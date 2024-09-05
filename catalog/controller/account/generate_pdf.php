<?php
class ControllerAccountGeneratePDF extends Controller {
    public function index() {
        // Set content type to JSON
        header('Content-Type: application/json');

        // Ensure the request method is POST
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Read and decode JSON input data
            $inputData = json_decode(file_get_contents('php://input'), true);
            $inputData['pdf'] = "";  // Placeholder for PDF, if you generate it later

            // Check if input data is present
            if (empty($inputData)) {
                echo json_encode(['success' => false, 'message' => 'No data found.']);
                exit;
            }

            // Log the input data for debugging (optional)
            error_log('Received form data and wishlist data:');
            error_log(print_r($inputData, true));

            // Load the model
            $this->load->model('account/wishcat');

            // Convert wishlist data to JSON string to store in the database
            $wishlistJson = json_encode($inputData['wishlist']);

            // Call the model method to save data
           $response['sql'] =  $this->model_account_wishcat->saveCatData(
                $inputData['name'],
                $inputData['company_name'],
                $inputData['email'],
                $inputData['pdf'],
                $wishlistJson
            );
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode(['success' => true, 'message' => 'Received form data and wishlist data.']));
        } else {
            // Method not allowed
            http_response_code(405);
            echo json_encode(['error' => 'Method Not Allowed']);
            exit;
        }
    }
}
?>
