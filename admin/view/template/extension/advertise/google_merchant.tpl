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
    <?php echo $steps; ?>
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
        <h3 class="panel-title"><i class="fa fa-user"></i>&nbsp;<span><?php echo $text_panel_heading_merchant; ?></span></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <div class="form-group">
            <p class="col-md-12"><?php echo $text_merchant_intro; ?></p>
            <div class="col-md-12">
              <label class="control-label"><input type="radio" name="advertise_google_gmc_account_type" value="api" <?php if ($advertise_google_gmc_account_type == "api") { echo 'checked'; } ?>/> <?php echo $text_new_merchant; ?></label>
            </div>
            <div class="col-md-12">
              <label class="control-label"><input type="radio" name="advertise_google_gmc_account_type" value="existing" <?php if ($advertise_google_gmc_account_type == "existing") { echo 'checked'; } ?>/> <?php echo $text_existing_merchant; ?></label>
            </div>
          </div>
          <div class="alert alert-info text-left">
            <?php echo $text_merchant_website_claim; ?>
            <hr/>
            <div class="checkbox">
              <label><input type="checkbox" class="acknowledge"/> <?php echo $text_acknowledge_merchant_tos; ?></label>
            </div>
          </div>
          <div class="pull-right">
            <button id="proceed" disabled type="submit" class="btn btn-primary"><?php echo $button_proceed; ?></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
(function($) {
    var selector = {
        acknowledge: '.acknowledge',
        save: '#proceed',
        form: '#form'
    }

    $(document).on('change', selector.acknowledge, function() {
        $(selector.save).attr('disabled', $(selector.acknowledge + ':not(:checked)').length > 0);
    });

    $(selector.acknowledge).trigger('change');

    $(document).on('click', selector.save, function(e) {
        e.preventDefault();
        e.stopPropagation();

        $(selector.save).text('<?php echo $text_loading; ?>').attr('disabled', true);

        $(selector.form).submit();
    });
})(jQuery);
</script>
<?php echo $footer; ?>
