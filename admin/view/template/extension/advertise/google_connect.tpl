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
    <div class="alert alert-info alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
      <i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;<?php echo $text_connect_intro; ?>
    </div>
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
        <h3 class="panel-title"><i class="fa fa-plug"></i>&nbsp;<span><?php echo $text_panel_connect; ?></span></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <fieldset>
            <legend><?php echo $text_extension_settings; ?></legend>
            <div class="form-group">
              <label for="select-status" class="col-sm-2 control-label"><?php echo $text_status; ?></label>
              <div class="col-sm-10">
                <select name="advertise_google_status" id="select-status" class="form-control">
                  <option value="1" selected><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label for="input-app-id" class="col-sm-2 control-label"><?php echo $text_app_id; ?></label>
              <div class="col-sm-10">
                <input type="text" id="input-app-id" class="form-control" name="advertise_google_app_id" autocomplete="off" value="<?php echo $advertise_google_app_id; ?>"/>
                <?php if ($error_app_id) { ?>
                <div class="text-danger"><?php echo $error_app_id; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label for="input-app-secret" class="col-sm-2 control-label"><?php echo $text_app_secret; ?></label>
              <div class="col-sm-10">
                <input type="text" id="input-app-secret" class="form-control" name="advertise_google_app_secret" autocomplete="off" value="<?php echo $advertise_google_app_secret; ?>"/>
                <?php if ($error_app_secret) { ?>
                <div class="text-danger"><?php echo $error_app_secret; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_cron_settings; ?></legend>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_cron_info; ?></div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-original-title="<?php echo $help_local_cron; ?>"><?php echo $text_local_cron; ?></span></label>
              <div class="col-sm-10">
                <input readonly type="text" class="form-control" value="<?php echo $advertise_google_cron_command; ?>"/>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-original-title="<?php echo $help_remote_cron; ?>"><?php echo $text_remote_cron; ?></span></label>
              <div class="col-sm-10">
                <div class="input-group">
                  <input readonly type="text" name="advertise_google_cron_url" id="input_advertise_google_cron_url" class="form-control" value=""/>
                  <div data-toggle="tooltip" data-original-title="<?php echo $text_refresh_token; ?>" class="input-group-addon btn btn-primary" id="refresh-cron-token">
                    <i class="fa fa-refresh"></i>
                  </div>
                </div>
                <input id="input_advertise_google_cron_token" type="hidden" name="advertise_google_cron_token" value="<?php echo $advertise_google_cron_token; ?>"/>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="checkbox_advertise_google_cron_acknowledge"><?php echo $entry_setup_confirmation; ?></label>
              <div class="col-sm-10">
                <label class="checkbox-inline">
                  <?php if ($advertise_google_cron_acknowledge) { ?><input id="checkbox_advertise_google_cron_acknowledge" type="checkbox" value="1" name="advertise_google_cron_acknowledge" checked/><?php } else { ?><input id="checkbox_advertise_google_cron_acknowledge" type="checkbox" value="1" name="advertise_google_cron_acknowledge"/><?php }  ?><?php echo $text_acknowledge_cron; ?>
                </label>
                <?php if ($error_cron_acknowledge) { ?>
                <div class="text-danger"><?php echo $error_cron_acknowledge; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="dropdown_advertise_google_cron_email_status"><span data-toggle="tooltip" data-original-title="<?php echo $help_cron_email_status; ?>"><?php echo $text_cron_email_status; ?></span></label>
              <div class="col-sm-10">
                <select id="dropdown_advertise_google_cron_email_status" name="advertise_google_cron_email_status" class="form-control">
                  <option value="1" <?php if ($advertise_google_cron_email_status == '1') { echo 'selected'; } ?>><?php echo $text_enabled; ?></option>
                  <option value="0" <?php if ($advertise_google_cron_email_status == '0') { echo 'selected'; } ?>><?php echo $text_disabled; ?></option>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input_advertise_google_cron_email"><span data-toggle="tooltip" data-original-title="<?php echo $help_cron_email; ?>"><?php echo $text_cron_email; ?></span></label>
              <div class="col-sm-10">
                <input id="input_advertise_google_cron_email" name="advertise_google_cron_email" type="text" class="form-control" value="<?php echo $advertise_google_cron_email; ?>"/>
                <?php if ($error_cron_email) { ?>
                <div class="text-danger"><?php echo $error_cron_email; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <div class="pull-right">
            <button type="submit" class="btn btn-primary btn-block" id="connect"><?php echo $button_connect; ?></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
(function($) {
    var selector = {
        save: '#connect',
        form: '#form'
    }

    var randomString = function() {
        return (Math.random() * 100).toString(16).replace('.', '');
    }

    var setCronUrl = function() {
        $('#input_advertise_google_cron_url').val(
            "<?php echo $advertise_google_cron_url; ?>".replace('{CRON_TOKEN}', $('#input_advertise_google_cron_token').val())
        );
    }

    $(document).on('click', selector.save, function(e) {
        e.preventDefault();
        e.stopPropagation();

        $(selector.save).text('<?php echo $text_connecting; ?>').attr('disabled', true);

        $(selector.form).submit();
    });

    $(document).ready(function() {
        setCronUrl();
    });

    $('#refresh-cron-token').click(function() {
        $('#input_advertise_google_cron_token').val(randomString() + randomString());

        setCronUrl();
    });
})(jQuery);
</script>
<?php echo $footer; ?>
