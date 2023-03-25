<?php echo $header; ?>
<?php echo $column_left; ?>
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
    <?php if (!$from_dashboard) { ?><?php echo $steps; ?><?php } ?>
    <?php if ($success) { ?>
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
        <h3 class="panel-title">
          <i class="fa fa-truck"></i>&nbsp;
          <span>
                        <?php if ($from_dashboard) { ?><?php echo $text_panel_heading_shipping_taxes_2; ?><?php } else { ?><?php echo $text_panel_heading_shipping_taxes; ?><?php } ?>
                    </span>
        </h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <fieldset>
            <legend><?php echo $text_shipping_transit_times; ?></legend>
            <div class="form-group required">
              <label for="input-min-transit-time" class="col-sm-3 control-label"><?php echo $entry_min_transit_time; ?></label>
              <div class="col-sm-9">
                <input type="number" class="form-control" id="input-min-transit-time" name="advertise_google_shipping_taxes[min_transit_time]" value="<?php echo $advertise_google_shipping_taxes['min_transit_time']; ?>"/>
                <?php if ($error_min_transit_time) { ?>
                <div class="text-danger"><?php echo $error_min_transit_time; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label for="input-max-transit-time" class="col-sm-3 control-label"><?php echo $entry_max_transit_time; ?></label>
              <div class="col-sm-9">
                <input type="number" class="form-control" id="input-max-transit-time" name="advertise_google_shipping_taxes[max_transit_time]" value="<?php echo $advertise_google_shipping_taxes['max_transit_time']; ?>"/>
                <?php if ($error_max_transit_time) { ?>
                <div class="text-danger"><?php echo $error_max_transit_time; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_shipping_services; ?></legend>
            <div class="form-group">
              <div class="col-sm-3">
                <label> <input type="radio" name="advertise_google_shipping_taxes[shipping_type]" value="flat" <?php if ($advertise_google_shipping_taxes['shipping_type'] == 'flat') { echo  'checked'; } ?> /><?php echo $text_shipping_flat; ?>
                </label>
              </div>
              <div class="col-sm-9" data-shipping-visible-on="flat">
                <div class="input-group">
                  <div class="input-group-addon"><i class="fa fa-dollar"></i></div>
                  <input type="number" class="form-control" name="advertise_google_shipping_taxes[flat_rate]" value="<?php echo $advertise_google_shipping_taxes['flat_rate']; ?>"/>
                  <div class="input-group-addon"><?php echo $text_usd; ?></div>
                </div>
                <?php if ($error_flat_rate) { ?>
                <div class="text-danger"><?php echo $error_flat_rate; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-3">
                <label><input type="radio" name="advertise_google_shipping_taxes[shipping_type]" value="carrier" <?php if ($advertise_google_shipping_taxes['shipping_type'] == 'carrier') { echo 'checked'; } ?>  /><?php echo $text_shipping_carrier; ?></label>
              </div>
              <div class="col-sm-9" data-shipping-visible-on="carrier">
                <div class="input-group">
                  <div class="input-group-addon"><?php echo $text_carrier_postcode; ?></div>
                  <input type="text" class="form-control" name="advertise_google_shipping_taxes[carrier_postcode]" value="<?php if (isset($advertise_google_shipping_taxes['carrier_postcode'])) { echo $advertise_google_shipping_taxes['carrier_postcode']; } ?>"/>
                </div>
                <?php if ($error_carrier_postcode) { ?>
                <div class="text-danger"><?php echo $error_carrier_postcode; ?></div>
                <?php } ?>
                <div class="input-group margin-top-10">
                  <div class="input-group-addon"><span data-toggle="tooltip" title="<?php echo $help_carrier_price_percentage; ?>"><?php echo $text_carrier_price_percentage; ?></span></div>
                  <input type="number" class="form-control" name="advertise_google_shipping_taxes[carrier_price_percentage]" value="<?php echo $advertise_google_shipping_taxes['carrier_price_percentage']; ?>"/>
                  <div class="input-group-addon">%</div>
                </div>
                <?php if ($error_carrier_price_percentage) { ?>
                <div class="text-danger"><?php echo $error_carrier_price_percentage; ?></div>
                <?php } ?><?php foreach ($available_carriers as $carrier) { ?>
                <fieldset class="margin-top-10">
                  <legend><?php echo $carrier['name']; ?> (<?php echo $carrier['country']; ?>)</legend>
                  <?php foreach ($carrier['services'] as $service) { ?><label class="label-block"> <input type="checkbox" name="advertise_google_shipping_taxes[carrier][<?php echo $carrier['code']; ?>][<?php echo $service['code']; ?>]" value="1" <?php if (isset($advertise_google_shipping_taxes[$carrier['code']][$service['code']]) && ($advertise_google_shipping_taxes[$carrier['code']][$service['code']] == '1')) { echo 'checked'; } ?> /> <?php echo $service['name']; ?>
                  </label><?php } ?>
                </fieldset>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12">
                <label> <input type="radio" name="advertise_google_shipping_taxes[shipping_type]" value="custom" <?php if ($advertise_google_shipping_taxes['shipping_type'] == 'custom') { echo  'checked'; } ?>  /><?php echo $text_shipping_custom; ?>
                </label>
              </div>
            </div>
          </fieldset>
          <fieldset class="margin-top-10">
            <legend><?php echo $text_taxes; ?></legend>
            <div class="form-group">
              <div class="col-sm-3">
                <label> <input type="radio" name="advertise_google_shipping_taxes[tax_type]" value="usa" <?php if ($advertise_google_shipping_taxes['tax_type'] == 'usa') { echo 'checked'; } ?>  /><?php echo $text_tax_usa; ?>
                </label>
              </div>
              <div class="col-sm-9" data-tax-visible-on="usa">
                <div class="input-group">
                  <div class="input-group-addon"><?php echo $text_tax_on_shipping; ?></div>
                  <select class="form-control" name="advertise_google_shipping_taxes[tax_on_shipping]">
                    <option value="1"
                    <?php if (isset($advertise_google_shipping_taxes['tax_on_shipping']) && ($advertise_google_shipping_taxes['tax_on_shipping'] == '1')) { echo 'selected'; } ?>><?php echo $text_enabled; ?></option>
                    <option value="0"
                    <?php if (isset($advertise_google_shipping_taxes['tax_on_shipping']) && ($advertise_google_shipping_taxes['tax_on_shipping'] == '0')) { echo 'selected'; } ?>><?php echo $text_disabled; ?></option>
                  </select>
                </div>
                <fieldset class="margin-top-10">
                  <legend><?php echo $text_active_states; ?></legend>
                  <?php foreach ($states as $id => $state) { ?>
                    <label class="label-block">
                      <input type="checkbox" name="advertise_google_shipping_taxes[tax][]" value="<?php echo $id; ?>" <?php if (isset($advertise_google_shipping_taxes['tax']) && in_array($id, $advertise_google_shipping_taxes['tax'])) { echo 'checked'; } ?> />
                      <?php echo $state; ?>
                    </label>
                  <?php } ?>
                </fieldset>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12">
                <label> <input type="radio" name="advertise_google_shipping_taxes[tax_type]" value="not_usa" <?php if ($advertise_google_shipping_taxes['tax_type'] == 'not_usa') { echo 'checked'; } ?>  /><?php echo $text_tax_not_usa; ?>
                </label>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12">
                <label> <input type="radio" name="advertise_google_shipping_taxes[tax_type]" value="custom" <?php if ($advertise_google_shipping_taxes['tax_type'] == 'custom') { echo 'checked'; } ?>  /><?php echo $text_tax_custom; ?>
                </label>
              </div>
            </div>
          </fieldset>
          <div class="pull-right">
            <button type="submit" class="btn btn-primary" id="proceed"><?php echo $button_proceed; ?></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<style type="text/css">
  .label-block {
    display: block;
    cursor: pointer;
  }

  .margin-top-10 {
    margin-top: 10px;
  }
</style>
<script type="text/javascript">
(function($) {
    var selector = {
        shipping_type: '[name="advertise_google_shipping_taxes[shipping_type]"]',
        tax_type: '[name="advertise_google_shipping_taxes[tax_type]"]',
        save: '#proceed',
        form: '#form'
    }

    $(selector.shipping_type).change(function(e) {
        $('[data-shipping-visible-on]').hide();

        $('[data-shipping-visible-on="' + $(this).val() + '"]').show();
    });

    $(selector.shipping_type + ':checked').trigger('change');

    $(selector.tax_type).change(function(e) {
        $('[data-tax-visible-on]').hide();

        $('[data-tax-visible-on="' + $(this).val() + '"]').show();
    });

    $(selector.tax_type + ':checked').trigger('change');

    $(document).on('click', selector.save, function(e) {
        e.preventDefault();
        e.stopPropagation();

        $(selector.save).text('<?php echo $text_loading; ?>').attr('disabled', true);

        $(selector.form).submit();
    });
})(jQuery);
</script>
<?php echo $footer; ?>