<script type="text/javascript">
    gtag('event', 'purchase', {
        'send_to': '<?php echo $send_to; ?>',
        'transaction_id': '<?php echo $transaction_id; ?>',
        'currency': '<?php echo $currency; ?>',
        'tax': '<?php echo $tax; ?>',
        'shipping': '<?php echo $shipping; ?>',
        'value': <?php echo $value; ?>,
        'items': <?php echo $items; ?>,
        'ecomm_totalvalue': <?php echo $ecomm_totalvalue; ?>,
        'ecomm_prodid': <?php echo $ecomm_prodid; ?>
    });

    if (typeof gtag_report_conversion == 'function') {
        gtag_report_conversion();
    }
</script>