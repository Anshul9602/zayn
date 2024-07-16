<?php
class ControllerAccountGeneratePDF extends Controller {
    public function index() {
        require_once(DIR_SYSTEM . 'library/dompdf/autoload.inc.php');

        use Dompdf\Dompdf;
        use Dompdf\Options;

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $wishlist = json_decode(file_get_contents('php://input'), true);

            if (!$wishlist) {
                echo json_encode(['success' => false, 'message' => 'No wishlist items found.']);
                exit;
            }

            // Generate the HTML for the PDF
            $html = '<h1>Your Wishlist</h1><ul>';
            foreach ($wishlist as $item) {
                $html .= '<li>' . htmlspecialchars($item['productname']) . ' - <a href="' . htmlspecialchars($item['producturl']) . '">View Product</a></li>';
            }
            $html .= '</ul>';

            // Initialize Dompdf
            $options = new Options();
            $options->set('defaultFont', 'Arial');
            $dompdf = new Dompdf($options);
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();
            $output = $dompdf->output();

            // Save the PDF to a file
            $pdfFilePath = DIR_DOWNLOAD . 'wishlist.pdf';
            file_put_contents($pdfFilePath, $output);

            // Send the PDF via email
            $to = $this->customer->getEmail(); // Change to the recipient's email address
            $subject = 'Your Wishlist';
            $message = 'Please find your wishlist attached.';

            $this->sendEmailWithPDF($to, $subject, $message, $pdfFilePath);

            echo json_encode(['success' => true, 'message' => 'Wishlist PDF sent to your email.']);
        }
    }

    private function sendEmailWithPDF($to, $subject, $message, $pdfFilePath) {
        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($to);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender($this->config->get('config_name'));
        $mail->setSubject($subject);
        $mail->setText($message);

        // Attachment
        $content = file_get_contents($pdfFilePath);
        $mail->addAttachment($pdfFilePath, 'wishlist.pdf');

        $mail->send();
    }
}
?>
