<?php echo $header; ?>
<style>
  @media print {
    * {
      visibility: hidden;
    }

    /* Show element to print, and any children he has. */
    #content * {
      visibility: initial;
    }
  }
</style>

<div class="container">
  <br />
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>


  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h2>Quotation</h2>
      <br />
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2">Quotation Details</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"> <b>Quotation ID:</b> #<?php print_r($quotation_info[0]['quotation_id']); ?><br>
              <b>Date Added:</b> <?php print_r($quotation_info[0]['date_added']); ?></td>
            <td class="text-left" style="width: 50%;"> <b>Current Status:</b> <?php print_r($quotation_info[0]['status']); ?><br>
              <b>Valid Till:</b> <?php print_r($quotation_info[0]['date_valid']); ?> </td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%; vertical-align: top;"> Payment Address</td>
            <td class="text-left" style="width: 50%; vertical-align: top;">Shipping Address</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php print_r($address['firstname']); ?> <?php print_r($address['lastname']); ?>
              <br><?php print_r($address['address_1']); ?><br><?php print_r($address['address_2']); ?>
              <br><?php print_r($address['city']); ?> <?php print_r($address['postcode']); ?><br>
              <?php print_r($address['zone']); ?><br><?php print_r($address['country']); ?></td>
            <td class="text-left"><?php print_r($address['firstname']); ?> <?php print_r($address['lastname']); ?>
              <br><?php print_r($address['address_1']); ?><br><?php print_r($address['address_2']); ?>
              <br><?php print_r($address['city']); ?> <?php print_r($address['postcode']); ?><br>
              <?php print_r($address['zone']); ?><br><?php print_r($address['country']); ?></td>
          </tr>
        </tbody>
      </table>

      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-center">Image</td>
              <td class="text-left">Product Name</td>
              <td class="text-left">Model</td>
              <td class="text-right">Quantity</td>
              <td class="text-right">Price</td>
              <td class="text-right">Total</td>

            </tr>
          </thead>
          <tbody>

            <?php $total = 0;
            foreach ($quotation_products as $product) { ?>
              <tr>
                <td class="text-center"> <img style="width: 120px; margin:auto" src=" image/<?php echo $product['image']; ?>" alt="" class="img-thumb"></td>
                <td class="text-left"><?php echo $product['name']; ?>
                </td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-right"><?php echo $product['quantity']; ?></td>
                <td class="text-right"><?php echo number_format($product['price'], 2); ?></td>
                <td class="text-right "><?php $total = $total + $product['total'];
                                        echo number_format($product['total'], 2); ?></td>

              </tr>
            <?php } ?>

          </tbody>
          <tfoot>

            <tr>
              <td colspan="4"></td>
              <td class="text-right"><b>Total</b></td>
              <td class="text-right"><?php echo number_format($total, 2) ?></td>

            </tr>

          </tfoot>
        </table>
      </div>

      <div class="buttons clearfix">
        <div class="pull-right">
          <a onclick="window.print(); return false;" href="#" class="btn btn-hero">
            <li class="fa fa-print"></li> Print
          </a>
          &nbsp;&nbsp;
          <a href="<?php echo $continue; ?>" class="btn btn-hero">
            <li class="fa fa-envelope"></li> Mail
          </a>

        </div>
      </div>
      <br />
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
