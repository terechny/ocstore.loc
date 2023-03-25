<h3><?php echo $text_report_date_range; ?></h3>
<div class="table-responsive">
  <table class="table table-hover table-bordered">
    <thead>
      <tr>
        <th class="text-left"><?php echo $text_report_campaign_name; ?></th>
        <th class="text-center"><?php echo $text_report_status; ?></th>
        <th class="text-center"><?php echo $text_report_impressions; ?></th>
        <th class="text-center"><?php echo $text_report_clicks; ?></th>
        <th class="text-center"><?php echo $text_report_cost; ?></th>
        <th class="text-center"><?php echo $text_report_conversions; ?></th>
        <th class="text-center"><?php echo $text_report_conversion_value; ?></th>
      </tr>
    </thead>
    <?php if ($advertise_google_report_campaigns) { ?>
      <?php foreach ($advertise_google_report_campaigns as $campaign) { ?>
        <tr>
          <td class="text-left"><?php echo $campaign['campaign_name']; ?></td>
          <td class="text-center">
            <?php if ($campaign['status'] == 'paused') : ?>
              <span class="label label-warning"><?php echo $text_label_paused; ?></span>
            <?php elseif($campaign['status'] == 'active') : ?>
              <span class="label label-success"><?php echo $text_label_active; ?></span>
            <?php endif; ?>
          </td>
          <td class="text-center"><?php echo $campaign['impressions']; ?></td>
          <td class="text-center"><?php echo $campaign['clicks']; ?></td>
          <td class="text-center"><?php echo $campaign['cost']; ?></td>
          <td class="text-center"><?php echo $campaign['conversions']; ?></td>
          <td class="text-center"><?php echo $campaign['conversion_value']; ?></td>
        </tr>
      <?php } ?>
    <?php } ?>
  </table>
</div>
