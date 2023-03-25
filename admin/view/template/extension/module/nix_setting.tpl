<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
				<!--<button type="submit" form="form-nix" data-toggle="tooltip" title="<?php echo $btn_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $btn_save; ?></button>-->
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $btn_cancel; ?>" class="btn btn-warning"><i class="fa fa-reply"></i> <?php echo $btn_cancel; ?></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if (isset($errors['warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $errors['warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <?php if (isset($message_success)) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $message_success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-cogs"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">				
				<div class="module-navigation">
          <a class="btn btn-default navbar-btn active" href="<?php echo $link_part_settings; ?>"><i class="fa fa-cogs"></i> <?php echo $text_part_settings; ?></a>
          <a class="btn btn-default navbar-btn" href="<?php echo $link_part_import; ?>"><i class="fa fa-upload"></i> <?php echo $text_part_import; ?></a>
        </div>
				
				<!-- Form . Begin -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-nix" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_supplier_list; ?></label>
						<div class="col-sm-10">
							<ul id="suppliers-list--wrapper" class="list-unstyled list-group">
								<?php foreach ($supplier_list as $supplier) { ?><li class="list-group-item"><a href="#" data-supplier-id="<?php echo $supplier['supplier_id']; ?>" class="nix-modal-supplier--toggle--edit"><?php echo $supplier['name']; ?></a> <i class="fa fa-close text-danger nix-supplier--delete" style="cursor: pointer;"></i></li><?php } ?>
							</ul>
							
							<div>
							<button id="nix-modal-supplier--toggle--add" class="btn btn-success btn-sm" data-target="#nix-modal-supplier"><i class="fa fa-plus"></i> &nbsp;<?php echo $btn_add_supplier; ?></button>
							</div>
						</div>
					</div>
					
				
					
					<!--<button type="submit" class="btn btn-primary"><?php echo $btn_save; ?></button>-->
        </form>
				<!-- /Form . End-->
      </div>
    </div>
		
		<div class="row">
			<div class="col-sm-12"><?php echo $text_copyright; ?></div>
		</div>
		
  </div>
	
</div>


<!-- Trigger the modal with a button -->


<!-- Modal -->
<div id="nix-modal-supplier" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><?php echo $supplier_modal_title; ?></h4>
      </div>
      <div class="modal-body" id="nix-modal-supplier--body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="nix-modal-supplier--btn"><?php echo $btn_supplier_modal_save; ?></button>
      </div>
    </div>

  </div>
</div>

<script type="text/javascript">
	var supplierRow = 0;
	var itemChoosen = false;
	
	$('#nix-modal-supplier--toggle--add').click(function (e) {
    e.preventDefault();
		
		$('#nix-modal-supplier .modal-footer').show();
		
		$.get('index.php?route=extension/module/nix/supplierForm&token=<?php echo $token; ?>&row=' + supplierRow, function(data, status) {
			$('#nix-modal-supplier--body').html(data);
		});
		
		$('#nix-modal-supplier').modal();
	});
	
	$('body').on('click', '.nix-modal-supplier--toggle--edit', function(e) {
		e.preventDefault();
		
		itemChoosen = $(this);
		
		$('#nix-modal-supplier .modal-footer').show();
		
		$.get('index.php?route=extension/module/nix/supplierEdit&token=<?php echo $token; ?>&supplier_id=' + $(this).attr('data-supplier-id'), function(data, status) {
			$('#nix-modal-supplier--body').html(data);
		});
		
		$('#nix-modal-supplier').modal();
	});
	
	
	$('#nix-modal-supplier--btn').click(function (e) {
    e.preventDefault();
		
		$('#nix-modal-supplier--form .text-danger').remove();		
		
		var supplierForm = $('#nix-modal-supplier--form').serialize();
		
		$.ajax({
      url: 'index.php?route=extension/module/nix/supplierSave&token=<?php echo $token; ?>',
      type: 'POST',
      dataType: 'json',
      data: supplierForm,
      success: function (json) {
        console.log('request success');
        if ('OK' == json['status']) {
					$('#nix-modal-supplier--answer').html('<div class="alert alert-success">' + json['msg'] + '</div>');
					
					if (typeof json['supplier_id'] !== 'undefined') {
						// Add
						$('#suppliers-list--wrapper').append('<li class="list-group-item"><a href="#" data-supplier-id="' + json['supplier_id'] + '" class="nix-modal-supplier--toggle--edit">' + $('#input-name').val() + '</a> <i class="fa fa-close text-danger nix-supplier--delete" style="cursor: pointer;"></i></li>');
					} else {
						// Edit
						itemChoosen.text($('#input-name').val()); // change supplier name (it can be edited)
						itemChoosen = false;
					}
					
					// Common
					$('#nix-modal-supplier--form').html('');
					$('#nix-modal-supplier .modal-footer').hide();

        } else {
          console.log('Error');
          $('#nix-modal-supplier--answer').html('<div class="alert alert-danger">' + json['msg'] + '</div>');
			
					$.each(json['errors'], function(key, value) {
						console.log('error item value');
						console.log(value);
						
						$('#input-' + key).closest('form-group').addClass('has-feedback');
						
						$('#input-' + key).after('<div class="text-danger">' + value + '</div>');
					});
	
        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // Error ajax query
        console.log('AJAX query Error: ' + textStatus);
      },
    });
		
		
		$('#nix-modal-supplier').modal();
	});
	
	
	$('body').on('click', '.nix-supplier--delete', function(e) {
		e.preventDefault();
		
		thisEl = $(this);
		
		var data = 'supplier_id=' + $(this).prev('.nix-modal-supplier--toggle--edit').attr('data-supplier-id');
		
		$.ajax({
      url: 'index.php?route=extension/module/nix/supplierDelete&token=<?php echo $token; ?>',
      type: 'POST',
      dataType: 'json',
      data: data,
      success: function (json) {
        console.log('request success');
        if ('OK' == json['status']) {
					$(thisEl).closest('.list-group-item').remove();

        }
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // Error ajax query
        console.log('AJAX query Error: ' + textStatus);
      },
    });
	});
	
	

</script>
<?php echo $footer; ?>
