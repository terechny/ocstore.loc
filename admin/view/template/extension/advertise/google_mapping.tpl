<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $text_video_tutorial_url_install; ?>" target="_blank" class="btn btn-info" data-toggle="tooltip" title="<?php echo $button_video_tutorial_install; ?>"><i class="fa fa-video-camera"></i></a> <a href="<?php echo $cancel; ?>" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if (!$from_dashboard) { echo $steps; } ?><?php if ($success) { ?>
    <div class="alert alert-success alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
      <i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;<?php echo $success; ?>
    </div>
    <?php } ?>
    <?php if ($error) { ?>
    <div class="alert alert-danger alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;<?php echo $error; ?>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-tags"></i>&nbsp;<span><?php if ($from_dashboard) { ?><?php echo $text_panel_heading_mapping_2; ?><?php } else { ?><?php echo $text_panel_heading_mapping; ?><?php } ?></span></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <input type="hidden" name="advertise_google_modify_existing" value="0"/>
          <p><?php echo $text_mapping_intro; ?></p>
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th class="width_33"><?php echo $entry_google_product_category; ?></th>
                  <th class="width_66"><?php echo $entry_oc_category; ?></th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($mapping as $map) { ?>
                <tr>
                  <td class="width_33"><?php echo $map['google_product_category']['name']; ?></td>
                  <td class="width_66 category-select-container">
                    <input type="text" name="category_autocomplete" value="<?php echo $map['oc_category']['name']; ?>" class="form-control"/> <input type="hidden" name="advertise_google_mapping[<?php echo $map['google_product_category']['id']; ?>]" data-google-category-id="<?php echo $map['google_product_category']['id']; ?>" value="<?php echo $map['oc_category']['category_id']; ?>">
                    <button class="btn btn-danger button-remove"><i class="fa fa-close"></i></button>
                  </td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
          <div class="pull-right">
            <button type="submit" class="btn btn-primary" id="proceed"><?php echo $button_proceed; ?></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<style type="text/css">
  .width_33 {
    width: 33%;
  }

  .width_66 {
    width: 66%;
  }

  .table > tbody > tr > td.category-select-container {
    padding-right: 50px;
    position: relative;
  }

  .category-select-container .button-remove {
    position: absolute;
    right: 5px;
    top: 8px;
  }
</style>
<script type="text/javascript">
(function($) {
    var selector = {
        save: '#proceed',
        save_modify: '#button-save-modify',
        save_proceed: '#button-save-proceed',
        form: '#form',
        autocomplete: '[name="category_autocomplete"]',
        category_id: '[data-google-category-id]',
        remove: '.button-remove',
        modify_existing: '[name="advertise_google_modify_existing"]'
    };

    $(selector.autocomplete).each(function(index, element) {
        $(element).autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: '<?php echo $url_category_autocomplete; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['category_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $(element).val(item.label);

                $(element).closest('td').find(selector.category_id).val(item.value).trigger('change');
            }
        });
    });

    $(selector.category_id).change(function(e) {
        var has_value = $(this).val() != '';

        $(this).closest('td').find(selector.autocomplete).attr('disabled', has_value);
        $(this).closest('td').find(selector.remove).attr('disabled', !has_value);
    }).trigger('change');

    $(selector.remove).click(function(e) {
        $(this).closest('td').find(selector.autocomplete).val('');
        $(this).closest('td').find(selector.category_id).val('').trigger('change');
    });

    $(document).on('click', selector.save, function(e) {
        e.preventDefault();
        e.stopPropagation();

        $(selector.save).text('<?php echo $text_loading; ?>').attr('disabled', true);

        $.ajax({
            url: '<?php echo $url_mapping_verify; ?>',
            dataType: 'json',
            success: function(data) {
                if (data.submit_directly) {
                    $(selector.modify_existing).val('0');
                    $(selector.form).submit();
                } else {
                    var modal = $(data.modal_confirmation).modal();

                    $(modal).on('hidden.bs.modal', function(e) {
                        $(this).remove();

                        $(selector.save).text('<?php echo $button_proceed; ?>').attr('disabled', false);
                    });

                    $(modal).on('shown.bs.modal', function(e) {
                        $(selector.save_proceed).click(function() {
                            $(selector.save_proceed).text('<?php echo $text_loading; ?>').attr('disabled', true);
                            $(selector.save_modify).attr('disabled', true);
                            $(selector.modify_existing).val('0');

                            $(selector.form).submit();
                        });

                        $(selector.save_modify).click(function() {
                            $(selector.save_modify).text('<?php echo $text_loading; ?>').attr('disabled', true);
                            $(selector.save_proceed).attr('disabled', true);
                            $(selector.modify_existing).val('1');

                            $(selector.form).submit();
                        });
                    });
                }
            }
        });
    });
})(jQuery);
</script>
<?php echo $footer; ?>
