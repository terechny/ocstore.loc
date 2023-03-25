<style type="text/css">
  .control-label.control-label-left {
    text-align: left;
    padding-bottom: 5px;
  }

  .margin-top-10 {
    margin-top: 10px;
  }
</style>
<form id="form-popup-product">
  <div class="alert alert-info"><?php echo $text_info_popup_product; ?></div>
  <div class="form-horizontal">
    <?php if ($error) { ?>
    <div class="alert alert-danger alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;<?php echo $error; ?>
    </div>
    <?php } ?>

    <div class="form-group">
      <label for="select-google-product-category" class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_google_product_category; ?>"><?php echo $entry_google_product_category; ?></span></label>
      <div class="col-xs-12">
        <select name="google_product_category" id="select-google-product-category" class="form-control">
          <?php foreach ($google_product_categories as $id => $name) { ?>
          <option value="<?php echo $id; ?>"
          <?php echo $id == $google_product_category ? 'selected' : ''; ?>><?php echo $name; ?></option>
          <?php } ?>
        </select>
        <?php if ($error_product_category) { ?>
        <div class="text-danger"><?php echo $error_product_category; ?></div>
        <?php } ?>
      </div>
    </div>

    <div class="form-group">
      <label for="select-color" class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_color; ?>"><?php echo $entry_color; ?></span></label>
      <div class="col-xs-12">
        <select id="select-color" name="color" class="form-control">
          <?php foreach ($options as $id => $name) { ?>
          <option value="<?php echo $id; ?>"
          <?php echo $id == $color ? 'selected' : ''; ?>><?php echo $name; ?></option>
          <?php } ?>
        </select>
        <?php if ($error_color) { ?>
        <div class="text-danger"><?php echo $error_color; ?></div>
        <?php } ?>
      </div>
    </div>

    <div class="form-group">
      <div class="col-xs-12">
        <div class="row">
          <div class="col-sm-4 margin-top-10">
            <label for="select-size-system" class="control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_size_system; ?>"><?php echo $entry_size_system; ?></span></label> <select id="select-size-system" name="size_system" class="form-control">
              <?php foreach ($size_systems as $id => $name) { ?>
              <option value="<?php echo $id; ?>"
              <?php echo $id == $size_system ? 'selected' : ''; ?>><?php echo $name; ?></option>
              <?php } ?>
            </select>
            <?php if ($error_size_system) { ?>
            <div class="text-danger"><?php echo $error_size_system; ?></div>
            <?php } ?>
          </div>
          <div class="col-sm-4 margin-top-10">
            <label for="select-size-type" class="control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_size_type; ?>"><?php echo $entry_size_type; ?></span></label> <select id="select-size-type" name="size_type" class="form-control">
              <?php foreach ($size_types as $id => $name) { ?>
              <option value="<?php echo $id; ?>"
              <?php echo $id == $size_type ? 'selected' : ''; ?>><?php echo $name; ?></option>
              <?php } ?>
            </select>
            <?php if($error_size_type) { ?>
            <div class="text-danger"><?php echo $error_size_type; ?></div>
            <?php } ?>
          </div>
          <div class="col-sm-4 margin-top-10">
            <label for="select-size" class="control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_size; ?>"><?php echo $entry_size; ?></span></label> <select id="select-size" name="size" class="form-control">
              <?php foreach ($options as $id => $name) { ?>
              <option value="<?php echo $id; ?>"
              <?php echo $id == $size ? 'selected' : ''; ?>><?php echo $name; ?></option>
              <?php } ?>
            </select>
            <?php if ($error_size) { ?>
            <div class="text-danger"><?php echo $error_size; ?></div>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="select-condition" class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_condition; ?>"><?php echo $entry_condition; ?></span></label>
      <div class="col-xs-12">
        <select name="condition" id="select-condition" class="form-control">
          <?php foreach ($conditions as $id => $name) { ?>
          <option value="<?php echo $id; ?>"
          <?php echo $id == $condition ? 'selected' : ''; ?>><?php echo $name; ?></option>
          <?php } ?>
        </select>
        <?php if ($error_condition) { ?>
        <div class="text-danger"><?php echo $error_condition; ?></div>
        <?php } ?>
      </div>
    </div>

    <div class="form-group">
      <label for="select-age-group" class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_age_group; ?>"><?php echo $entry_age_group; ?></span></label>
      <div class="col-xs-12">
        <select name="age_group" id="select-age-group" class="form-control">
          <?php foreach ($age_groups as $id => $name) { ?>
          <option value="<?php echo $id; ?>"
          <?php echo $id == $age_group ? 'selected' : ''; ?>><?php echo $name; ?></option>
          <?php } ?>
        </select>
        <?php if ($error_age_group) { ?>
        <div class="text-danger"><?php echo $error_age_group; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label for="select-gender" class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_gender; ?>"><?php echo $entry_gender; ?></span></label>
      <div class="col-xs-12">
        <select name="gender" id="select-gender" class="form-control">
          <?php foreach ($genders as $id => $name) { ?>
          <option value="<?php echo $id; ?>"
          <?php echo $id == $gender ? 'selected' : ''; ?>><?php echo $name; ?></option>
          <?php } ?>
        </select>
        <?php if ($error_gender) { ?>
        <div class="text-danger"><?php echo $error_gender; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_adult; ?>"><?php echo $entry_adult; ?></span></label>
      <div class="col-xs-12">
        <label class="radio-inline"> <input type="radio" name="adult" value="1" <?php echo $adult ? "checked" : ''; ?> /> <?php echo $text_yes; ?>
        </label> <label class="radio-inline"> <input type="radio" name="adult" value="0" <?php echo !$adult ? "checked" : ''; ?> /> <?php echo $text_no; ?>
        </label>
        <?php if ($error_adult) { ?>
        <div class="text-danger"><?php echo $error_adult; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_multipack; ?>"><?php echo $entry_multipack; ?></span></label>
      <div class="col-xs-12">
        <input type="number" name="multipack" value="<?php echo $multipack; ?>" class="form-control"/>
        <?php if ($error_multipack) { ?>
        <div class="text-danger"><?php echo $error_multipack; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-xs-12 control-label control-label-left"><span data-toggle="tooltip" title="<?php echo $help_is_bundle; ?>"><?php echo $entry_is_bundle; ?></span></label>
      <div class="col-xs-12">
        <label class="radio-inline"> <input type="radio" name="is_bundle" value="1" <?php echo $is_bundle ? "checked" : ''; ?> /> <?php echo $text_yes; ?>
        </label> <label class="radio-inline"> <input type="radio" name="is_bundle" value="0" <?php echo !$is_bundle ? "checked" : ''; ?> /> <?php echo $text_no; ?>
        </label>
        <?php if ($error_is_bundle) { ?>
        <div class="text-danger"><?php echo $error_is_bundle; ?></div>
        <?php } ?>
      </div>
    </div>
    <?php if ($error) { ?>
    <div class="alert alert-danger alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;<?php echo $error; ?>
    </div>
    <?php } ?>
  </div>
</form>