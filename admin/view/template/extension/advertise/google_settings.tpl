<div class="form-horizontal">
  <fieldset>
    <legend><?php echo $text_extension_settings; ?></legend>
    <div class="form-group">
      <label for="select-status" class="col-sm-2 control-label"><?php echo $text_status; ?></label>
      <div class="col-sm-10">
        <select name="advertise_google_status" id="select-status" class="form-control">
          <option value="1"
          <?php echo $advertise_google_status ? 'selected' : ''; ?>><?php echo $text_enabled; ?></option>
          <option value="0"
          <?php echo !$advertise_google_status ? 'selected' : ''; ?>><?php echo $text_disabled; ?></option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label for="select-reporting-interval" class="col-sm-2 control-label"><?php echo $text_reporting_interval; ?></label>
      <div class="col-sm-10">
        <select name="advertise_google_reporting_interval" id="select-reporting-interval" class="form-control">
          <?php foreach ($reporting_intervals as $interval => $description) { ?>
          <option value="<?php echo $interval; ?>"
          <?php echo $interval == $advertise_google_reporting_interval ? 'selected' : ''; ?>><?php echo $description; ?></option><?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label for="select-debug-log" class="col-sm-2 control-label"><?php echo $text_debug_log; ?></label>
      <div class="col-sm-10" id="select-debug-log-container">
        <select name="advertise_google_debug_log" id="select-debug-log" class="form-control">
          <option value="0"
          <?php echo !$advertise_google_debug_log ? 'selected' : ''; ?>><?php echo $text_disabled; ?></option>
          <option value="1"
          <?php echo $advertise_google_debug_log ? 'selected' : ''; ?>><?php echo $text_enabled; ?></option>
        </select> <a href="<?php echo $url_debug_log_download; ?>" id="download-debug-log" data-toggle="tooltip" title="<?php echo $text_download_debug_log; ?>" class="btn btn-default"><i class="fa fa-download"></i></a>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label"><?php echo $text_connection; ?></label>
      <div class="col-sm-10">
        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_disconnect_reminder; ?></div>
        <div class="form-control-static"><i class="text-success fa fa-circle"></i> <?php echo $text_connected; ?></div>
        <a id="button_disconnect" href="<?php echo $disconnect; ?>" class="btn btn-default"><i class="fa fa-power-off"></i> <?php echo $button_disconnect; ?></a>
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
        <label class="checkbox-inline"> <input id="checkbox_advertise_google_cron_acknowledge" type="checkbox" value="1" <?php if ($advertise_google_cron_acknowledge) { echo 'checked'; } ?> name="advertise_google_cron_acknowledge" /> <?php echo $text_acknowledge_cron; ?>
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
          <option value="1"
          <?php if ($advertise_google_cron_email_status == '1') { echo 'selected';} ?>><?php echo $text_enabled; ?></option>
          <option value="0"
          <?php if ($advertise_google_cron_email_status == '0') { echo 'selected';} ?>><?php echo $text_disabled; ?></option>
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
</div>
<style type="text/css">
  #select-debug-log-container {
    position: relative;
    padding-right: 70px;
  }

  #download-debug-log {
    position: absolute;
    right: 15px;
    top: 0;
  }
</style>
<script type="text/javascript">
(function($) {
    var randomString = function() {
        return (Math.random() * 100).toString(16).replace('.', '');
    }

    var setCronUrl = function() {
        $('#input_advertise_google_cron_url').val(
            "<?php echo $advertise_google_cron_url; ?>".replace('{CRON_TOKEN}', $('#input_advertise_google_cron_token').val())
        );
    }

    $(document).ready(function() {
        $('#button_disconnect').click(function(e) {
            if ($(this).is(':disabled') || !confirm('<?php echo $text_confirm; ?>')) {
                e.preventDefault();
            } else {
                $('#button_disconnect').text('<?php echo $text_disconnecting_please_wait; ?>').attr('disabled', true);
            }
        });

        setCronUrl();
    });

    $('#refresh-cron-token').click(function() {
        $('#input_advertise_google_cron_token').val(randomString() + randomString());
        setCronUrl();
    });
})(jQuery);
</script>
