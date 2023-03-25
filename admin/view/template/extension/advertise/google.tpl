<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" class="btn btn-primary" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>"><i class="fa fa-save"></i></button>
        <a href="<?php echo $mapping; ?>" class="btn btn-warning" data-toggle="tooltip" title="<?php echo $button_mapping; ?>"><i class="fa fa-tags"></i></a> <a href="<?php echo $shipping_taxes; ?>" class="btn btn-warning" data-toggle="tooltip" title="<?php echo $button_shipping_taxes; ?>"><i class="fa fa-truck"></i></a> <a href="<?php echo $campaign; ?>" class="btn btn-warning" data-toggle="tooltip" title="<?php echo $button_campaign; ?>"><i class="fa fa-cogs"></i></a> <a href="<?php echo $text_video_tutorial_url_setup; ?>" target="_blank" class="btn btn-info" data-toggle="tooltip" title="<?php echo $button_video_tutorial_setup; ?>"><i class="fa fa-video-camera"></i></a> <a href="<?php echo $cancel; ?>" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_cancel ; ?>"><i class="fa fa-reply"></i></a>
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
    <?php if ($success) { ?>
    <div class="alert alert-success alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><i class="fa fa-close"></i></button>
      <i class="fa fa-check-circle"></i>&nbsp;<?php echo $success; ?>
    </div>
    <?php } ?>
    <div id="blockerError" style="display: none;" class="alert alert-danger">
      <i class="fa fa-exclamation-triangle"></i>&nbsp;<?php echo $error_adblock; ?>
    </div>
    <?php if ($error) { ?>
    <div class="alert alert-danger alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><i class="fa fa-close"></i></button>
      <i class="fa fa-exclamation-triangle"></i>&nbsp;<?php echo $error; ?>
    </div>
    <?php } ?>
    <div id="warning-container">
      <?php if ($warning) { ?>
      <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><i class="fa fa-close"></i></button>
        <i class="fa fa-info-circle"></i>&nbsp;<?php echo $warning; ?>
      </div>
      <?php } ?>
    </div>
    <div id="alert-container"></div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i>&nbsp;<span><?php echo $text_panel_heading; ?></span></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
          <div class="tabbable">
            <ul class="nav nav-tabs mainMenuTabs">
              <li class="active"><a href="#tab_ads" data-toggle="tab"><?php echo $tab_text_ads; ?></a></li>
              <li><a href="#tab_reports" data-toggle="tab"><?php echo $tab_text_reports; ?></a></li>
              <li><a href="#tab_settings" data-toggle="tab"><?php echo $tab_text_settings; ?></a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane" id="tab_settings"><?php echo $tab_settings; ?></div>
              <div class="tab-pane active" id="tab_ads"><?php echo $tab_ads; ?></div>
              <div class="tab-pane" id="tab_reports"><?php echo $tab_reports; ?></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<style type="text/css">
    .adBanner {
        background-color: transparent;
        height: 1px;
        width: 1px;
    }
</style>
<div id="wrapTest">
    <div class="adBanner">
    </div>
</div>
<script type="text/javascript">
(function($) {
    $(document).ready(function() {
        $('#blockerError').toggle($("#wrapTest").height() == 0);
    });
})(jQuery);
</script>
<?php echo $footer; ?>
