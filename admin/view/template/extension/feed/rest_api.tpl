<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-rest_api" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title." - V".$version; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit." - V".$version; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-rest_api" class="form-horizontal">
          
          <div class="form-group" style="font-size:large" align='center'>
            <p>To start uploading, enable this extension below (then save) and download our desktop softwares from the following links:</p>
            <ol>
                <li><a href="https://www.reoon.com/download-opencart-dropship/" target="_blank" rel="noopener">Reoon OpenCart Dropshipping App (Desktop)</a>.</li>
                <li><a href="https://www.reoon.com/download-opencart-reviews-importer/" target="_blank" rel="noopener">Reoon OpenCart Reviews Importer (Desktop)</a>.</li>
            </ol>
            <p>For more details about our tools, please visit <a href="https://www.reoon.com/" target="_blank" rel="noopener">www.reoon.com</a></p>
          </div>
          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="rest_api_status" id="input-status" class="form-control">
                <?php if ($rest_api_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
	  </div>

            
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
