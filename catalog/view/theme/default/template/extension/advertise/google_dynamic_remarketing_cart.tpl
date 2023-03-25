<script type="text/javascript">
    console.log("[GTAG] Submit cart view: " + <?php echo $ecomm_prodid; ?>);

    gtag('event', 'page_view', {
        'send_to': '<?php echo $send_to; ?>',
        'name': 'cart',
        'ecomm_prodid': <?php echo $ecomm_prodid; ?>,
        'ecomm_pagetype': 'cart',
        'ecomm_totalvalue': <?php echo $ecomm_totalvalue; ?>,
        'value': <?php echo $ecomm_totalvalue; ?>,
        'items': <?php echo $items; ?>
    });
</script>