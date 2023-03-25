<?php echo $header; ?>
	<style>
	.has-error {
		border-color: #ff0000;
	}
	
	.panel-body {
		position: relative;
	}
	
	.panel-body.with-loader::before {
		content: "";
		position: absolute;
		width: 100%;
		height: 100%;
		background: rgba(255, 255, 255, .5);
		z-index: 3;
	}
	
	.loader {
		z-index: 9;
		position: absolute;
		display: none;
		left: 45%;
		top: 45%;
		
		width: 280px;
		text-align: center;
	}
	
	.loader-dialog {
		color: #ff0000;
	}
	
	.loader-stopwatch {
		margin-bottom: 15px;
	}
	
	.loader-icon {
		display: inline-block;
		width: 64px;
		height: 64px;
		
    border: 5px solid #8c8d9a; /* bg */
    border-top: 5px solid #fcb92b; /* primary */
    border-radius: 50%;
    
    animation: spin 1s linear infinite;
	}

	@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
	}
	
</style>
<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
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
        <h3 class="panel-title"><i class="fa fa-upload"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
				<div class="module-navigation">
          <a class="btn btn-default navbar-btn" href="<?php echo $link_part_settings; ?>"><i class="fa fa-cogs"></i> <?php echo $text_part_settings; ?></a>
          <a class="btn btn-default navbar-btn active" href="<?php echo $link_part_import; ?>"><i class="fa fa-upload"></i> <?php echo $text_part_import; ?></a>
        </div>
				<!-- Form . Begin -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="nix-import--form" class="form-horizontal">
					
					<div id="nix-import--answer"></div>
					
					<!-- Loader -->
					<div class="loader">
						<div class="loader-dialog"></div>
						<div class="loader-statistics"></div>
						<div class="loader-stopwatch timerDisplay">00 : 00 : 00 : 000</div>
						<div class="loader-icon"></div>
					</div> 
					
					<!-- Delete All -->
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<div class="checkbox">
								<label><input type="checkbox" name="delete_all" value="1" <?php echo ($delete_all) ? 'checked="checked"' : ''; ?>> <?php echo $entry_delete_all; ?></label>
								<span class="help-block"><span class="text-warning bg-warning"><?php echo $help_delete_all; ?></span></span>
							</div>
						</div>
					</div>
					
					<!-- Supplier -->
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-supplier"><?php echo $entry_supplier; ?></label>
						<div class="col-sm-10">
							<select name="supplier_id" id="input-supplier" class="form-control">
								<option value="*"><?php echo $text_select_option; ?></option>
								<?php foreach ($supplier_list as $supplier) { ?>
                <option value="<?php echo $supplier['supplier_id']; ?>" <?php echo ($supplier_id == $supplier['supplier_id']) ? 'selected="selected"' : ''; ?>><?php echo $supplier['name']; ?></option>
								<?php } ?>
              </select>
							<?php if (isset($errors['supplier_id'])) { ?>
							<div class="text-danger"><?php echo $errors['supplier_id']; ?></div>
						<?php } ?>
						</div>
					</div>
					
					<!-- XML File -->
					<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-xmllink"><span data-toggle="tooltip" title="<?php echo $help_file; ?>"><?php echo $entry_file; ?></span></label>
            <div class="col-sm-10">	
							
						<?php $i = 0; ?>
							
						<?php foreach ($languages as $language) { ?>
							
							<?php if ($i > 0) { ?><hr style="border-style: dashed; border-color: #ccc; margin: 15px 0 0 0;"><?php } ?>
							
							<?php if ($is_multilingual) { ?>
							<div class="radio" style="margin-bottom: 10px;">
								<label style="color: initial;"><input type="radio" name="language_id" value="<?php echo $language['language_id']; ?>" <?php echo (($language['language_id'] == $language_id) || ($i == 0 && $language_id == 0)) ? 'checked' : ''; ?>> <img src="<?php echo $language['src'] ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?> <?php echo $entry_language; ?></label>
							</div>
							<?php } else { ?>
							<input type="hidden" name="language_id" value="<?php echo $language['language_id']; ?>" checked />
							<?php } ?>
							
							<!--<input type="text" name="xmllink[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_xmllink; ?>" id="input-xmllink" class="form-control" />-->
							
							<!--<div><?php echo $xor; ?></div>-->

							<div class="input-group">
								<label class="input-group-btn">
									<input name="xmlfile[<?php echo $language['language_id']; ?>]" type="file" id="input-xmlfile-<?php echo $language['language_id']; ?>" style="display: none;" />
									<div class="btn btn-info" style="border-radius: 3px 0 0 3px"><?php echo $btn_file; ?></div>
								</label>
								<input type="text" class="form-control" id="xmlfile-status-<?php echo $language['language_id']; ?>" value="..." readonly>
							</div>
							
							<?php if (isset($errors['xmlfile'][$language['language_id']])) { ?>
							<div class="text-danger"><?php echo $errors['xmlfile'][$language['language_id']]; ?></div>
							<?php } ?>
							
							<script>
								$(document).ready(function () {
									$('#input-xmlfile-<?php echo $language['language_id']; ?>').change(function () {
										var f_name = [];
										for (var i = 0; i < $(this).get(0).files.length; ++i) {
											f_name.push(" " + $(this).get(0).files[i].name);
										}
										$('#xmlfile-status-<?php echo $language['language_id']; ?>').val(f_name.join(", "));
									});
								});
							</script>
							<?php $i++; ?>
							<?php } ?>

            </div>							
          </div>
					
					
					
					<?php /* ?>
					<!-- Language -->
					<?php if ($is_multilingual) { ?>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
						<div class="col-sm-10">
							<select name="language_id" id="input-language" class="form-control">
								<option value="*"><?php echo $text_select_option; ?></option>
								<?php foreach ($languages as $language) { ?>
								<option value="<?php echo $language['language_id']; ?>" <?php echo ($language_id == $language['language_id']) ? 'selected="selected"' : ''; ?>><?php echo $language['name']; ?></option>
								<?php } ?>
							</select>
							<?php if (isset($errors['language_id'])) { ?>
							<div class="text-danger"><?php echo $errors['language_id']; ?></div>
							<?php } ?>
						</div>
					</div>
					<?php } else { ?>
					<input type="hidden" name="language_id" value="<?php echo $config_language_id; ?>" checked />
					<?php } ?>
					
					 */ 
					?>
				
        <hr>
				<!-- Import Options -->
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $text_import_options; ?></label>
					<div class="col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" name="update_if_exist" value="1" <?php echo ($update_if_exist) ? 'checked="checked"' : ''; ?>> <?php echo $entry_update_if_exist; ?></label>
							<span class="help-block"><span class="text-primary"><?php echo $help_update_if_exist; ?></span></span>
						</div>				
						<?php if ($is_multilingual) { ?>
						<hr>
						<div class="checkbox">
							<label><input type="checkbox" name="copy_description" id="copy-description" value="1" <?php echo ($copy_description) ? 'checked="checked"' : ''; ?>> <?php echo $entry_copy_description; ?></label>
						</div>
						<hr>
						<div class="checkbox">
							<label><input type="checkbox" name="copy_attributes" id="copy-attributes" value="1" <?php echo ($copy_attributes) ? 'checked="checked"' : ''; ?>> <?php echo $entry_copy_attributes; ?></label>
							<span class="help-block"><span class="text-primary"><?php echo $help_copy_attributes; ?></span></span>
						</div>
						<?php } ?>
					</div>
				</div>
				
				
				
				
				
        <hr>
				
        <button type="submit" class="btn btn-primary" id="nix-import--btn"><?php echo $btn_import; ?></button>
				
        </form>
				<!-- /Form . End-->
				
      </div>
    </div>
		
		<div class="row">
			<div class="col-sm-12"><?php echo $text_copyright; ?></div>
		</div>
		
  </div>
	
</div>


<script>
	
	function toggleCopuAttributes() {
		if ($('#copy-description').is(':checked')) {
			$('#copy-attributes').attr('disabled', false);
			
			$('#copy-attributes').parent('label').css('color', 'initial');
			$('#copy-attributes').parent('label').next('.help-block').children('.text-primary').css('color', '#1e91cf');
		} else {
			$('#copy-attributes').attr('disabled', true);
			
			$('#copy-attributes').parent('label').css('color', '#ccc');
			$('#copy-attributes').parent('label').next('.help-block').children('.text-primary').css('color', '#ccc');
			
			if ($('#copy-attributes').is(':checked')) {			
				$('#copy-attributes').attr('checked', false);
			}
		}
	}
	
	toggleCopuAttributes();
	
	$('#copy-description').change(function() {
		toggleCopuAttributes();
	});
	

	$('#nix-import--form').on('submit', function (e) {
    e.preventDefault();
		
		var dataImport = new FormData(this); // to send files it is necessary FormData(), not serialize()
		
		dataImport.append('nix_new_submit', 1);
		
		$.ajax({
			url: 'index.php?route=extension/module/nix/processingImportAjax&token=<?php echo $token; ?>',
			type: 'POST',
			dataType: 'json',
			contentType: false, // to have regular post field with FormData() obj
			cache: false,
			processData: false, // to send a DOMDocument
			data: dataImport,
			beforeSend: function() {
				$('#nix-import--form .form-control').removeClass('has-error');				
				$('#nix-import--answer').html('');				
				$('.loader-dialog').html('<?php echo $status_started; ?>');
				
				// A! NOT only for this request!
				loaderOn(); // contain other on start actions
			},
			success: function (json) {
				console.log('Success httpResponse');
				console.debug(json);

				if ('Finish' == json['status']) {
					console.log('Import Finish by a request!');
					
					$('#nix-import--answer').html('<div class="alert alert-success">' + json['msg'] + json['statistics'] + '</div>');
					
					if (false != json['warnings']) {
						$('#nix-import--answer').append('<div class="alert alert-warning">' + json['warnings'] + '</div>');
					}
					
					loaderOff(); // contain other on stop actions
					
				} else if ('Continue' == json['status']) {
					console.log('Import Continue');
					
					$('.loader-statistics').html(json['statistics']);
					
					// !A Note 3:A
					// Not off loader while loop not finished		
					loopQueries();
					
				} else if ('Error' == json['status']) {
					console.log('Import Error');

					$('#nix-import--answer').html('<div class="alert alert-danger">' + json['msg'] + '</div>');

					if ('undefined' !== typeof json['errors']['supplier_id']) {
						$('#input-supplier').addClass('has-error');
					}

					if ('undefined' !== typeof json['errors']['xmlfile']) {
						<?php	foreach ($languages as $language) { ?>
						if ('undefined' !== typeof json['errors']['xmlfile'][<?php echo $language['language_id']; ?>]) {
							$('#xmlfile-status-<?php echo $language['language_id']; ?>').addClass('has-error');
						}
						<?php } ?>
					}
					
					// !A Note 3:B
					//  If there are errors in the form - it is necessary to edit fields and send request again
					loaderOff(); // contain other on stop actions
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				// Error ajax query
				console.log('AJAX query Error: ' + textStatus);
			}
		});
		
	});
	
	var i = 1;
	
	async function loopQueries() {
		var dataImport = $('#nix-import--form').serialize(); // Note-4:B -- not send files again
			
		await $.ajax({
			url: 'index.php?route=extension/module/nix/processingImportAjax&token=<?php echo $token; ?>',
			type: 'POST',
			dataType: 'json',
			data: dataImport,
			success: function (json) {
				console.log('Success httpResponse : ' + i);
				console.debug(json);

				if ('Finish' == json['status']) {
					console.log('Import Finish by the Loop');

					$('#nix-import--answer').html('<div class="alert alert-success">' + json['msg'] + json['statistics'] + '</div>');
					
					if (false != json['warnings']) {
						$('#nix-import--answer').append('<div class="alert alert-warning">' + json['warnings'] + '</div>');
					}

					// !A Note 3:C
					// If import is finihed by the loop
					loaderOff();					

				} else if ('Continue' == json['status']) {
					console.log('Import Continue : ' + i);
					
					$('.loader-statistics').html(json['statistics']);

					i++;

					loopQueries();
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				console.log('AJAX query Error in loopQueries() - ' +  i + ' : ' + textStatus);
			}
		});
	}
	
	function loaderOn() {
		$('.panel-body').addClass('with-loader');
		$('.loader').show();
		
		$('#nix-import--btn').attr('disabled', true);
		
		startStopwatch();	
	}
	
	function loaderOff() {
		$('.loader').hide();
		$('.panel-body').removeClass('with-loader');
		
		$('#nix-import--btn').attr('disabled', false);
		
		resetStopwatch();
		
		$('.loader-statistics').html('');
	}
	


// https://foolishdeveloper.com/create-a-simple-stopwatch-using-javascript-tutorial-code/
let [milliseconds,seconds,minutes,hours] = [0,0,0,0];
let timerRef = document.querySelector('.timerDisplay');
let int = null;

function startStopwatch() {
	if(int!==null){
		clearInterval(int);
	}
	int = setInterval(displayStopwatch,10);
};

function resetStopwatch() {
	clearInterval(int);
	[milliseconds,seconds,minutes,hours] = [0,0,0,0];
	timerRef.innerHTML = '00 : 00 : 00 : 000 ';
};

//document.getElementById('resetStopwatch').addEventListener('click', ()=>{
//	clearInterval(int);
//	[milliseconds,seconds,minutes,hours] = [0,0,0,0];
//	timerRef.innerHTML = '00 : 00 : 00 : 000 ';
//});

//document.getElementById('startStopwatch').addEventListener('click', ()=>{
//	if(int!==null){
//		clearInterval(int);
//	}
//	int = setInterval(displayStopwatch,10);
//});
//
//document.getElementById('pauseStopwatch').addEventListener('click', ()=>{
//	clearInterval(int);
//});
//
//document.getElementById('resetStopwatch').addEventListener('click', ()=>{
//	clearInterval(int);
//	[milliseconds,seconds,minutes,hours] = [0,0,0,0];
//	timerRef.innerHTML = '00 : 00 : 00 : 000 ';
//});

function displayStopwatch() {
	milliseconds+=10;
	if(milliseconds == 1000){
		milliseconds = 0;
		seconds++;
		if(seconds == 60){
			seconds = 0;
			minutes++;
			if(minutes == 60){
				minutes = 0;
				hours++;
			}
		}
	}
	let h = hours < 10 ? '0' + hours : hours;
	let m = minutes < 10 ? '0' + minutes : minutes;
	let s = seconds < 10 ? '0' + seconds : seconds;
	let ms = milliseconds < 10 ? '00' + milliseconds : milliseconds < 100 ? '0' + milliseconds : milliseconds;
	timerRef.innerHTML = ` ${h} : ${m} : ${s} : ${ms}`;
}

</script>

<?php echo $footer; ?>
