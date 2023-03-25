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
    <?php if (!$from_dashboard) { ?><?php echo $steps; ?><?php } ?>
    <div id="alerts">
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
      <?php if ($warning) { ?>
      <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><i class="fa fa-close"></i></button>
        <i class="fa fa-info-circle"></i>&nbsp;<?php echo $warning; ?>
      </div>
      <?php } ?>
    </div>
    <div class="row">
      <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i>&nbsp;<span><?php if ($from_dashboard) { ?><?php echo $text_panel_heading_campaign_2; ?><?php } else { ?><?php echo $text_panel_heading_campaign; ?><?php } ?></span></h3>
          </div>
          <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
              <div class="form-group required">
                <label class="col-sm-2 control-label"><?php echo $entry_campaign; ?></label>
                <div class="col-sm-10">
                  <div id="targets">
                    <?php if ($targets) { ?>
                    <div class="table-responsive">
                      <table class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th class="text-left"><?php echo $entry_campaign_name; ?></th>
                            <th class="text-center"><?php echo $entry_country; ?></th>
                            <th class="text-center"><?php echo $entry_budget; ?></th>
                            <th class="text-left"><?php echo $entry_feed; ?></th>
                            <th class="text-center"><?php echo $entry_roas; ?></th>
                            <th class="text-center"><?php echo $entry_status; ?></th>
                            <th class="text-right"><?php echo $entry_action; ?></th>
                          </tr>
                        </thead>
                        <tbody id="list">
                          <?php foreach ($targets as $target) { ?>
                          <tr>
                            <td class="text-left"><?php echo $target['campaign_name']; ?></td>
                            <td class="text-center"><?php echo $target['country']['name']; ?></td>
                            <td class="text-center"><?php echo $target['budget']['formatted']; ?></td>
                            <td class="text-left">
                              <ul>
                                <?php foreach ($target['feeds'] as $feed) { ?>
                                <li><?php echo $feed['text']; ?></li>
                                <?php } ?>
                              </ul>
                            </td>
                            <td class="text-center">
                                <?php if ($target['roas_status']) : ?>
                                    <?php echo $target['roas']; ?>&#37;
                                <?php else: ?>
                                    <span class="label label-default" data-toggle="tooltip" data-original-title="<?php echo $target['roas_warning']; ?>"><?php echo $text_label_unavailable; ?></span>
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                              <?php if ($target['status'] == 'paused') { ?><span class="label label-warning"><?php echo $text_label_paused; ?></span><?php } elseif ($target['status'] == 'active') { ?><span class="label label-success"><?php echo $text_label_active; ?></span><?php } ?>
                            </td>
                            <td class="text-right">
                              <button class="btn btn-primary button-target-edit" data-toggle="tooltip" title="<?php echo $button_edit; ?>" data-target-id="<?php echo $target['target_id']; ?>"><i class="fa fa-pencil"></i></button>
                              <button class="btn btn-danger button-target-delete" data-toggle="tooltip" title="<?php echo $button_delete; ?>" data-target-id="<?php echo $target['target_id']; ?>"><i class="fa fa-trash"></i></button>
                            </td>
                          </tr>
                          <?php } ?>
                        </tbody>
                      </table>
                    </div>
                    <?php } else { ?>
                    <div class="alert alert-warning"><i class="fa fa-warning"></i> <?php echo $text_no_targets; ?></div>
                    <?php } ?>
                  </div>
                  <div>
                    <button id="button-target-add" class="btn btn-default"><i class="fa fa-plus"></i> <?php echo $button_add_target; ?></button>
                  </div>
                </div>
              </div>
              <!--div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_auto_advertise; ?></label>
                  <div class="col-sm-10">
                      <label class="radio-inline">
                          <input type="radio" name="advertise_google_auto_advertise" value="1" <?php echo $advertise_google_auto_advertise == '1' ? 'checked="checked"' : ''; ?>>
                          <?php echo $text_yes; ?>
                      </label>
                      <label class="radio-inline">
                          <input type="radio" name="advertise_google_auto_advertise" value="0" <?php echo $advertise_google_auto_advertise == '0' ? 'checked="checked"' : ''; ?>>
                          <?php echo $text_no; ?>
                      </label>
                  </div>
              </div-->
              <hr/>
              <?php if (!$from_dashboard): ?>
              <div class="alert alert-info text-left">
                <div class="checkbox">
                  <label><input type="checkbox" class="acknowledge"/> <?php echo $text_acknowledge_add_campaign_1; ?></label>
                </div>
                <div class="checkbox">
                  <label><input type="checkbox" class="acknowledge"/> <?php echo $text_acknowledge_add_campaign_2; ?></label>
                </div>
              </div>
              <?php endif; ?>
              <div class="pull-right">
                <button type="submit" <?php echo !$from_dashboard ? 'disabled' : ''; ?> class="btn btn-primary" id="proceed"><?php echo $button_proceed; ?></button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-info-circle"></i>&nbsp;<span><?php echo $text_panel_heading_more_info; ?></span></h3>
          </div>
          <div class="panel-body"><?php echo $text_campaign_more_info; ?></div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-image"></i>&nbsp;<span><?php echo $text_panel_heading_preview; ?></span></h3>
          </div>
          <div class="panel-body text-center">
            <img id="ad-preview" src="view/image/advertise/google/ad-preview.png"/>
          </div>
        </div>
      </div>
    </div>
  </div>
  <style type="text/css">
    .feed {
      position: relative;
    }

    .feed > .row {
      padding-right: 60px;
    }

    .button-feed-delete {
      position: absolute;
      top: 9px;
      right: 0;
    }

    #feeds > .feed:first-child > .row {
      margin-top: -9px;
    }

    #ad-preview {
      max-width: 100%;
    }
  </style>
  <script type="text/template" id="template-targets">
  <div class="table-responsive">
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th class="text-left"><?php echo $entry_campaign_name; ?></th>
          <th class="text-center"><?php echo $entry_country; ?></th>
          <th class="text-center"><?php echo $entry_budget; ?></th>
          <th class="text-left"><?php echo $entry_feed; ?></th>
          <th class="text-center"><?php echo $entry_roas; ?></th>
          <th class="text-center"><?php echo $entry_status; ?></th>
          <th class="text-right"><?php echo $entry_action; ?></th>
        </tr>
      </thead>
      <tbody id="list"></tbody>
    </table>
  </div>
  </script>
  <script type="text/template" id="template-list-element">
  <tr>
    <td class="text-left">{campaign_name}</td>
    <td class="text-center">{country}</td>
    <td class="text-center">{budget}</td>
    <td class="text-left">{feeds}</td>
    <td class="text-center">{roas}</td>
    <td class="text-center">{status}</td>
    <td class="text-right">
      <button class="btn btn-primary button-target-edit" data-toggle="tooltip" title="<?php echo $button_edit; ?>" data-target-id="{target_id}"><i class="fa fa-pencil"></i></button>
      <button class="btn btn-danger button-target-delete" data-toggle="tooltip" title="<?php echo $button_delete; ?>" data-target-id="{target_id}"><i class="fa fa-trash"></i></button>
    </td>
  </tr>
  </script>
  <script type="text/template" id="template-modal">
  <div id="target-modal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><i class="fa fa-close"></i></button>
          <h4 class="modal-title">{title}</h4>
        </div>
        <div class="modal-body form-horizontal">
          <div id="target-alerts"></div>
          <div class="form-group required" data-error-type="error_campaign_name">
            <label for="input-campaign-name" class="col-sm-3 control-label"><?php echo $entry_campaign_name; ?></label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="input-campaign-name" name="campaign_name" value="{campaign_name}"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label"><?php echo $entry_status; ?></label>
            <div class="col-sm-9">
              <select class="form-control" name="status" id="select-status" data-value="{status}">
                <option value="active"><?php echo $text_active; ?></option>
                <option value="paused"><?php echo $text_paused; ?></option>
              </select>
            </div>
          </div>
          <div class="form-group required" data-error-type="error_country">
            <label for="select-country" class="col-sm-3 control-label"><?php echo $entry_country; ?></label>
            <div class="col-sm-9">
              <select class="form-control" name="country" id="select-country" data-value="{country}">
                <option value=""><?php echo $text_select_country; ?></option>
              </select>
            </div>
          </div>
          <div class="form-group" data-error-type="error_roas">
              <label for="input-roas" class="col-sm-3 control-label"><?php echo $entry_roas; ?></label>
              <div class="col-sm-9">
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $help_roas; ?></div>
                  <div id="warning-roas" class="alert alert-warning" style="display: none;"><i class="fa fa-exclamation-triangle"></i> {roas_warning}</div>
                  <div class="input-group">
                      <input type="number" class="form-control" id="input-roas" name="roas" value="{roas}" min="0" />
                      <div class="input-group-addon"><strong>%</strong></div>
                  </div>
              </div>
          </div>
          <div class="form-group required" data-error-type="error_budget">
            <label for="input-budget" class="col-sm-3 control-label"><?php echo $entry_budget; ?></label>
            <div class="col-sm-9">
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $help_budget; ?></div>
              <div id="warning-budget" class="alert alert-warning" style="display: none;"><i class="fa fa-exclamation-triangle"></i> <?php echo $warning_budget; ?></div>
              <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-dollar"></i></div>
                <input type="number" class="form-control" id="input-budget" name="budget" value="{budget}" min="5"/>
                <div class="input-group-addon"><?php echo $text_usd_day; ?></div>
              </div>
            </div>
          </div>
          <div class="form-group required" data-error-type="error_feed">
            <label class="col-sm-3 control-label"><?php echo $entry_feed; ?></label>
            <div class="col-sm-9">
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $help_feed; ?></div>
              <div id="feeds">{feeds}</div>
              <div>
                <button id="button-feed-add" class="btn btn-success"><i class="fa fa-plus"></i> <?php echo $button_add_feed; ?></button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> <?php echo $button_close; ?></button>
          <button type="button" class="btn btn-primary" id="button-target-save" data-text="<?php echo $button_save; ?>" data-loading="<?php echo $text_loading_please_wait; ?>" data-url="{url}"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        </div>
      </div>
    </div>
  </div>
  </script>
  <script type="text/template" id="template-feed">
  <div class="feed" data-id="{id}">
    <div class="row">
      <div class="col-md-6 form-control-static">
        <select class="form-control" name="feed[{id}][language]" data-value="{language}">
          <option value=""><?php echo $text_select_language; ?></option>
          {languages}
        </select>
      </div>
      <div class="col-md-6 form-control-static">
        <select class="form-control" name="feed[{id}][currency]" data-value="{currency}">
          <option value=""><?php echo $text_select_currency; ?></option>
          {currencies}
        </select>
      </div>
    </div>
    <button class="button-feed-delete btn btn-default" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash"></i></button>
  </div>
  </script>
  <script type="text/template" id="template-alert">
  <div class="alert alert-{type} alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="<?php echo $text_close; ?>"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
    <i class="fa fa-{icon}" aria-hidden="true"></i>&nbsp;{message}
  </div>
  </script>
  <script type="text/javascript">
  (function($) {
      var allowed_targets = <?php echo $json_allowed_targets; ?>;

      var targets = <?php echo $json_targets; ?>;

      var id = 0;

      var selector = {
          alerts: '#alerts',
          acknowledge: '.acknowledge',
          save: '#proceed',
          form: '#form',
          target: {
              container: '#targets',
              list: '#list',
              modal: '#target-modal',
              alerts: '#target-alerts',
              add: '#button-target-add',
              edit: '.button-target-edit',
              delete: '.button-target-delete',
              country: '#select-country',
              status: '#select-status',
              save: '#button-target-save',
              budget: '#input-budget',
              warning_budget: '#warning-budget',
              roas: '#input-roas',
              warning_roas: '#warning-roas'
          },
          feed: {
              container: '#feeds',
              error_type: '[data-error-type]',
              language: 'select[name*="[language]"]',
              currency: 'select[name*="[currency]"]',
              add: '#button-feed-add',
              delete: '.button-feed-delete',
              row: '.feed'
          },
          template: {
              alert: '#template-alert',
              modal: '#template-modal',
              feed: '#template-feed',
              targets: '#template-targets',
              list_element: '#template-list-element'
          }
      };

      var template = function(html, data) {
          $.map(data, function(text, key) {
              html = html.replace(new RegExp("{" + key + "}", 'g'), text);
          });

          return html;
      };

      var makeModalHtml = function(data) {
          var html = $(selector.template.modal).html();

          return template(html, data);
      };

      var makeFeedsHtml = function(data) {
          var html = $(selector.template.feed).html();

          data.languages = '';
          data.currencies = '';

          // Set the feed countries
          $(allowed_targets).each(function(index, target) {
              if (target.country.code == $(selector.target.country).val()) {
                  $(target.languages).each(function(index, language) {
                      data.languages += '<option value="' + language.code + '" ' + (language.status ? '' : 'disabled') + '>' + language.name + '</option>';
                  });

                  $(target.currencies).each(function(index, currency) {
                      data.currencies += '<option value="' + currency.code + '" ' + (currency.status ? '' : 'disabled') + '>' + currency.name + '</option>';
                  });
              }
          });

          return template(html, data);
      };

      var makeAlertHtml = function(data) {
          var html = $(selector.template.alert).html();

          return template(html, data);
      };

      var displayError = function(container, message) {
          $(container).html(makeAlertHtml({
              icon: 'exclamation-triangle',
              type: 'danger',
              message: message
          }));
      };

      var makeListElementHtml = function(data) {
          var html = $(selector.template.list_element).html();

          return template(html, data);
      }

      var makeListElementRoasHtml = function(roas_status, roas_warning, roas) {
        if (!roas_status) {
            return '<span class="label label-default" data-toggle="tooltip" data-original-title="' + roas_warning + '"><?php echo $text_label_unavailable; ?></span>';
        } else {
            return roas.toString() + '&#37;';
        }
    }

    var makeListElementStatusHtml = function(status) {
          if (status == 'paused') {
              return '<span class="label label-warning"><?php echo $text_label_paused; ?></span>';
          } else if (status == 'active') {
              return '<span class="label label-success"><?php echo $text_label_active; ?></span>';
          }

          return '';
      }

      var makeListElementFeedsHtml = function(feeds) {
          html = '<ul>';

          $(feeds).each(function(index, feed) {
              html += '<li>' + feed.text + '</li>';
          });

          html += '</ul>';

          return html;
      }

      var displaySuccess = function(message) {
          $(selector.alerts).html(makeAlertHtml({
              icon: 'check-circle',
              type: 'success',
              message: message
          }));
      };

      var refreshTargets = function(callback) {
          $.ajax({
              url: '<?php echo $target_list; ?>',
              type: 'GET',
              dataType: 'json',
              beforeSend: function() {
                  $(selector.target.container).html('<div class="alert alert-info text-center"><?php echo $text_loading; ?></div>');
              },
              complete: callback,
              error: function(jqXHR, textStatus, errorThrown) {
                  displayError(selector.alerts, '(' + textStatus + ') ' + errorThrown);
              },
              success: function(data) {
                  if (data.error) {
                      displayError(selector.alerts, data.error);
                  } else {
                      if (data.targets.length) {
                          targets = data.targets;

                          $(selector.target.container).html($(selector.template.targets).html());

                          $(data.targets).each(function(index, target) {
                              $(selector.target.list).append(makeListElementHtml({
                                  target_id: target.target_id,
                                  campaign_name: target.campaign_name,
                                  country: target.country.name,
                                  budget: target.budget.formatted,
                                  roas: makeListElementRoasHtml(target.roas_status, target.roas_warning, target.roas),
                                  status: makeListElementStatusHtml(target.status),
                                  feeds: makeListElementFeedsHtml(target.feeds)
                              }));
                          });
                      } else {
                          $(selector.target.container).html('<div class="alert alert-warning"><i class="fa fa-warning"></i> <?php echo $text_no_targets; ?></div>');
                      }
                  }
              }
          });
      };

      var initModal = function(modalData) {
          var html = $(makeModalHtml(modalData));

          $(html).modal();

          $(html).on('shown.bs.modal', function() {
              // Enable tooltips
              $('[data-toggle="tooltip"]').tooltip({container: 'body', html: true});

              // Populate countries
              $(allowed_targets).each(function(index, target) {
                  $(selector.target.country).append('<option value="' + target.country.code + '">' + target.country.name + '</option>');
              });

              // Select the current country
              $(selector.target.country).val($(selector.target.country).attr('data-value')).trigger('change');

              $(selector.target.status).val($(selector.target.status).attr('data-value')).trigger('change');

              $(selector.target.budget).trigger('change');

              $(selector.target.roas).attr('disabled', !modalData.roas_status);
              $(selector.target.roas).attr('data-original-disabled', !modalData.roas_status ? '1' : '0');

              $(selector.target.warning_roas).toggle(!modalData.roas_status);
          });

          $(html).on('hidden.bs.modal', function() {
              $(this).remove();
          });
      };

      /*var campaignCreateTestPromise = new Promise((resolve, reject) => {
          <?php //if ($can_edit_campaigns) { ?>
          resolve();
          <?php //} else { ?>
          var doCampaignCreateTest = function() {
              $.ajax({
                  url: '<?php // echo $url_campaign_test; ?>',
                  dataType: 'json',
                  success: function(data) {
                      if (data.status) {
                          resolve();
                      } else if (data.redirect) {
                          document.location = data.redirect;
                      } else {
                          setTimeout(doCampaignCreateTest, 10000);
                      }
                  }
              });
          };

          doCampaignCreateTest();
          <?php // } ?>
      });*/

      $(document).on('click', selector.target.add, function(e) {
          e.preventDefault();
          e.stopPropagation();

          var modalData = {
              title: '<?php echo $text_add_target; ?>',
              url: '<?php echo $target_add; ?>',
              campaign_name: '',
              budget: '25.00',
              roas: 0,
              roas_status: false,
              roas_warning: '<?php echo $text_roas_warning; ?>',
              country: '',
              status: 'active',
              feeds: makeFeedsHtml({
                  id: id++,
                  language: '',
                  currency: ''
              })
          };

          initModal(modalData);
      });

      $(document).on('click', selector.target.edit, function(e) {
          e.preventDefault();
          e.stopPropagation();

          var data = null;
          var feeds = '';
          var target_id = $(this).attr('data-target-id');

          $(targets).each(function(index, target) {
              if (target.target_id == target_id) {
                  data = target;
                  return;
              }
          });

          $(data.feeds).each(function(index, feed) {
              feeds += makeFeedsHtml({
                  id: id++,
                  language: feed.language,
                  currency: feed.currency
              });
          });

          var modalData = {
              title: '<?php echo $text_edit_target; ?>'.replace(/%s/, data.campaign_name),
              url: '<?php echo $target_edit; ?>'.replace(/{target_id}/, target_id),
              campaign_name: data.campaign_name,
              budget: data.budget.value,
              roas: data.roas,
              roas_status: data.roas_status,
              roas_warning: data.roas_warning,
              country: data.country.code,
              status: data.status,
              feeds: feeds
          };

          initModal(modalData);
      });

      $(document).on('click', selector.target.delete, function(e) {
          e.preventDefault();
          e.stopPropagation();

          if (confirm('<?php echo $text_confirm; ?>')) {
            var target_id = $(this).attr('data-target-id');

            $(selector.target.container).html('<div class="alert alert-info text-center"><?php echo $text_loading_please_wait; ?></div>');

            //campaignCreateTestPromise.then(function() {
              $.ajax({
                  url: '<?php echo $target_delete; ?>'.replace(/{target_id}/, target_id),
                  type: 'GET',
                  dataType: 'json',
                  complete: function() {
                      refreshTargets();
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                      displayError(selector.alerts, '(' + textStatus + ') ' + errorThrown);
                  },
                  success: function(data) {
                      if (data.error) {
                          displayError(selector.alerts, data.error);
                      } else if (data.redirect) {
                          document.location = data.redirect;
                      } else {
                          displaySuccess(data.success);
                      }
                  }
              });
            //});
          }
      });

      $(document).on('click', selector.feed.add, function(e) {
          $(selector.feed.container).append(
              $(makeFeedsHtml({
                  id: id++,
                  language: '',
                  currency: ''
              }))
          );
      });

      $(document).on('click', selector.feed.delete, function(e) {
          e.preventDefault();

          if (confirm("<?php echo $text_confirm; ?>")) {
              $(this).closest(selector.feed.row).remove();
          }
      });

      $(document).on('click', selector.target.save, function(e) {
          var saveButton = this;

          $(selector.target.alerts).empty();
          $(selector.alerts).empty();

          $(selector.target.save)
              .text($(selector.target.save).attr('data-loading'))
              .attr('disabled', true);

          $(selector.target.modal).find('input,select').attr('disabled', true);
          $(selector.target.modal).find(selector.feed.add).attr('disabled', true);
          $(selector.target.modal).find(selector.feed.delete).attr('disabled', true);

          $('.text-danger').remove();

          $('.has-error').removeClass('has-error');

          //campaignCreateTestPromise.then(function() {
              $.ajax({
                  url: $(saveButton).attr('data-url'),
                  type: 'POST',
                  dataType: 'json',
                  data: $(selector.target.modal).find('input,select'),
                  complete: function() {
                      $(selector.target.save)
                          .text($(selector.target.save).attr('data-text'))
                          .attr('disabled', false);

                      $(selector.target.modal).find('input,select').attr('disabled', false);
                      $(selector.target.modal).find('[data-original-disabled]').each(function(index, element) {
                          $(element).attr('disabled', $(element).attr('data-original-disabled') == '1');
                      });
                      $(selector.target.modal).find(selector.feed.add).attr('disabled', false);
                      $(selector.target.modal).find(selector.feed.delete).attr('disabled', false);
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                      displayError(selector.target.alerts, '(' + textStatus + ') ' + errorThrown);
                  },
                  success: function(data) {
                      if (data.error) {
                          displayError(selector.target.alerts, data.error);

                          $(selector.feed.error_type).each(function(index, element) {
                              if (typeof data[$(element).attr('data-error-type')] != 'undefined') {
                                  $(element).find('.col-sm-9').append('<div class="text-danger">' + data[$(element).attr('data-error-type')] + '</div>');
                              }
                          });

                          // Highlight any found errors
                          $('.text-danger').each(function() {
                              var element = $(saveButton).parent().parent();

                              if (element.hasClass('form-group')) {
                                  element.addClass('has-error');
                              }
                          });
                      } else if (data.redirect) {
                          document.location = data.redirect;
                      } else if (data.success) {
                          displaySuccess(data.success);

                          refreshTargets(function() {
                              $(selector.target.modal).modal('hide');
                          });
                      }
                  }
              });
          //});
      });

      $(document).on('change', selector.target.country, function() {
          var code = $(this).val();

          // Set the feed countries
          $(allowed_targets).each(function(index, target) {
              if (target.country.code == code) {
                  $(selector.feed.container).find(selector.feed.language).find('option[value!=""]').remove();

                  $(target.languages).each(function(index, language) {
                      $(selector.feed.container).find(selector.feed.language).append('<option value="' + language.code + '" ' + (language.status ? '' : 'disabled') + '>' + language.name + '</option>');
                  });

                  $(selector.feed.container).find(selector.feed.language).val(
                      $(selector.feed.container).find(selector.feed.language).attr('data-value')
                  );

                  $(selector.feed.container).find(selector.feed.currency).find('option[value!=""]').remove();

                  $(target.currencies).each(function(index, currency) {
                      $(selector.feed.container).find(selector.feed.currency).append('<option value="' + currency.code + '" ' + (currency.status ? '' : 'disabled') + '>' + currency.name + '</option>');
                  });

                  $(selector.feed.container).find(selector.feed.currency).val(
                      $(selector.feed.container).find(selector.feed.currency).attr('data-value')
                  );
              }
          });
      });

      $(document).on('change', selector.acknowledge, function() {
          $(selector.save).attr('disabled', $(selector.acknowledge + ':not(:checked)').length > 0);
      });

      $(document).on('change keyup', selector.target.budget, function() {
          if (parseFloat($(this).val()) < 10) {
              $(selector.target.warning_budget).show();
          } else {
              $(selector.target.warning_budget).hide();
          }
      });

      $(document).on('click', selector.save, function(e) {
          e.preventDefault();
          e.stopPropagation();

          $(selector.save).text('<?php echo $text_loading_please_wait; ?>').attr('disabled', true);
          $(selector.acknowledge).attr('disabled', true);

          //campaignCreateTestPromise.then(function() {
              $(selector.form).submit();
          //});
      });
  })(jQuery);
  </script>
  <?php echo $footer; ?>
