<script type="text/javascript">
(function($) {
    var option_map = <?php echo $option_map; ?>;

    var submitGtag = function(ecomm_prodid) {
        console.log("[GTAG] Submit product view: " + ecomm_prodid);

        gtag('event', 'view_item', {
            'send_to': '<?php echo $send_to; ?>',
            'items': [
                {
                    'brand': '<?php echo $brand; ?>',
                    'category': '<?php echo $category; ?>',
                    'id': ecomm_prodid,
                    'name': '<?php echo $name; ?>',
                    'quantity': 1
                }
            ]
        });
    };

    var submitGtagByColorAndSize = function(color, size) {
        $.each(option_map.groups, function(ecomm_prodid, group) {
            if (group.color == color && group.size == size) {
                submitGtag(ecomm_prodid);
            }
        });
    };

    if (option_map.colors === null && option_map.sizes === null) {
        submitGtagByColorAndSize("", "");
    } else {
        $('[name^="option["]').change(function() {
            var color, size = "";

            $('select[name^="option["], [type="radio"][name^="option["]:checked').each(function(index, option) {
                var product_option_value_id = $(option).val();

                if (option_map.colors !== null && typeof option_map.colors[product_option_value_id] != 'undefined') {
                    color = option_map.colors[product_option_value_id];
                }

                if (option_map.sizes !== null && typeof option_map.sizes[product_option_value_id] != 'undefined') {
                    size = option_map.sizes[product_option_value_id];
                }
            });

            submitGtagByColorAndSize(color, size);
        }).trigger('change');
    }
})(jQuery);
</script>