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
        <h3 class="panel-title"><i class="fa fa-list-ol"></i>&nbsp;<span><?php echo $text_panel_heading; ?></span></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <input type="hidden" name="advertise_google_checklist_confirmed" value="1"/>
          <div class="alert alert-info"><?php echo $text_checklist_intro; ?></div>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <tbody>
                <tr>
                  <td class="text-center td-pointer"><input type="checkbox" name="acknowledge[0]"/></td>
                  <td class="text-left"><?php echo $text_checklist_acknowledge_0; ?></td>
                </tr>
                <tr>
                  <td class="text-center td-pointer"><input type="checkbox" name="acknowledge[1]"/></td>
                  <td class="text-left"><?php echo $text_checklist_acknowledge_1; ?></td>
                </tr>
                <tr>
                  <td class="text-center td-pointer"><input type="checkbox" name="acknowledge[2]"/></td>
                  <td class="text-left"><?php echo $text_checklist_acknowledge_2; ?></td>
                </tr>
                <tr>
                  <td class="text-center td-pointer"><input type="checkbox" name="acknowledge[3]"/></td>
                  <td class="text-left"><?php echo $text_checklist_acknowledge_3; ?></td>
                </tr>
                <tr>
                  <td class="text-center td-pointer"><input type="checkbox" name="acknowledge[4]"/></td>
                  <td class="text-left"><?php echo $text_checklist_acknowledge_4; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="pull-right">
            <button type="submit" class="btn btn-primary"><?php echo $button_proceed; ?></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<style type="text/css">
  .td-pointer {
    cursor: pointer;
  }
</style>
<script type="text/javascript">
(function($) {
    $('input[name^=acknowledge]').change(function(e) {
        $(this).closest('tr').toggleClass('success', $(this).is(':checked'));

        $('button[type="submit"]').attr('disabled', $('input[name^=acknowledge]:not(:checked)').length > 0);
    }).trigger('change');

    $('input[name^=acknowledge]').closest('td').click(function(e) {
        if ($(e.target).is('input')) {
            return;
        }

        var checkbox = $(this).find('input[name^=acknowledge]').first();

        $(checkbox).prop('checked', !$(checkbox).prop('checked')).trigger('change');
    });
})(jQuery);
</script>
<?php echo $footer; ?>
