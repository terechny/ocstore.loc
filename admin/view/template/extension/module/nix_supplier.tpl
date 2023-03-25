<div id="nix-modal-supplier--answer"></div>
<form action="" method="post" enctype="multipart/form-data" id="nix-modal-supplier--form" class="form-horizontal">
	<?php if (isset($supplier_id)) { ?>
	<input type="hidden" name="supplier_id" id="input-supplier-id" value="<?php echo $supplier_id; ?>">
	<?php } ?>
	
	<fieldset>
		<legend><?php echo $supplier_fieldset_settings; ?></legend>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-name"><?php echo $entry_supplier_name; ?></label>
			<div class="col-sm-8">
				<input type="text" name="name" id="input-name" class="form-control input-sm" value="<?php echo (isset($supplier['name'])) ? $supplier['name'] : ''; ?>">
			</div>
		</div>
		<div class="form-group hidden">
			<label class="col-sm-4 control-label" for="input-link-price"><?php echo $entry_supplier_link_price; ?></label>
			<div class="col-sm-8">
				<input type="text" name="link_price" id="input-link-price" class="form-control input-sm" value="<?php echo (isset($supplier['link_price'])) ? $supplier['link_price'] : ''; ?>">
			</div>
		</div>
	</fieldset>
	
	<p>&nbsp;</p>

	<fieldset>
		<legend><?php echo $supplier_fieldset_tags; ?></legend>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-name"><?php echo $entry_tag_product_name; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[name]" id="input-tag-name" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['name'])) ? $supplier['tags']['name'] : ''; ?>">
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-model"><?php echo $entry_tag_product_model; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[model]" id="input-tag-model" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['model'])) ? $supplier['tags']['model'] : ''; ?>">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label" for="input-tag-sku"><?php echo $entry_tag_product_sku; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[sku]" id="input-tag-sku" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['sku'])) ? $supplier['tags']['sku'] : ''; ?>">
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-description"><?php echo $entry_tag_product_description; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[description]" id="input-tag-description" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['description'])) ? $supplier['tags']['description'] : ''; ?>">
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-price"><?php echo $entry_tag_product_price; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[price]" id="input-tag-price" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['price'])) ? $supplier['tags']['price'] : ''; ?>">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label" for="input-tag-price-wholesale"><?php echo $entry_tag_product_price_wholesale; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[price_wholesale]" id="input-tag-price-wholesale" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['price_wholesale'])) ? $supplier['tags']['price_wholesale'] : ''; ?>">
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-images"><?php echo $entry_tag_product_images; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[images]" id="input-tag-images" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['images'])) ? $supplier['tags']['images'] : ''; ?>">
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-category"><?php echo $entry_tag_product_category; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[category]" id="input-tag-category" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['category'])) ? $supplier['tags']['category'] : ''; ?>">
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-tag-manufacturer-name"><?php echo $entry_tag_product_manufacturer_name; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[manufacturer_name]" id="input-tag-manufacturer-name" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['manufacturer_name'])) ? $supplier['tags']['manufacturer_name'] : ''; ?>">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label" for="input-tag-attributes"><?php echo $entry_tag_product_attributes; ?></label>
			<div class="col-sm-8">
				<input type="text" name="tags[attributes]" id="input-tag-attributes" class="form-control input-sm" value="<?php echo (isset($supplier['tags']['attributes'])) ? $supplier['tags']['attributes'] : ''; ?>">
			</div>
		</div>
	</fieldset>
	
	<p>&nbsp;</p>
	
	<fieldset>
		<legend><?php echo $supplier_fieldset_attributes; ?></legend>
		<div class="form-group required">
			<label class="col-sm-4 control-label" for="input-attribute-parent-id"><?php echo $entry_attribute_parent_id; ?></label>
			<div class="col-sm-8">
				<input type="text" name="attributes[parent_id]" id="input-attribute-parent-id" class="form-control input-sm" value="<?php echo (isset($supplier['attributes']['parent_id'])) ? $supplier['attributes']['parent_id'] : ''; ?>">
			</div>
		</div>
	</fieldset>
	
</form>