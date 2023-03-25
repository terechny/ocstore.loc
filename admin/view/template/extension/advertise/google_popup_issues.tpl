<?php foreach ($product_issues as $product_issue) : ?>
    <h3><?php echo $product_issue['language_name']; ?></h3>

    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="text-left"><?php echo $text_color; ?></th>
                    <th class="text-left"><?php echo $text_size; ?></th>
                    <th class="text-left"><?php echo $text_destination_status; ?></th>
                    <th class="text-left"><?php echo $text_data_quality_issues; ?></th>
                    <th class="text-left"><?php echo $text_item_level_issues; ?></th>
                    <th class="text-left"><?php echo $text_google_expiration_date; ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($product_issue['issues'] as $issue) : ?>
                    <tr>
                        <td class="text-left"><?php echo $issue['color']; ?></td>
                        <td class="text-left"><?php echo $issue['size']; ?></td>
                        <td class="text-left">
                            <?php if ($issue['destination_statuses']) : ?>
                                <?php foreach ($issue['destination_statuses'] as $status) : ?>
                                    <?php if ($status['approvalPending']) : ?>
                                        <?php echo $status['destination']; ?><?php echo $status['destination'] ? ': ' : ''; ?><span class="label label-warning"><?php echo $text_label_pending; ?></span><br />
                                    <?php else : ?>
                                        <?php if ($status['approvalStatus'] == 'approved') : ?>
                                            <?php echo $status['destination']; ?><?php echo $status['destination'] ? ': ' : ''; ?><span class="label label-success"><?php echo $text_label_approved; ?></span><br />
                                        <?php elseif ($status['approvalStatus'] == 'disapproved') : ?>
                                            <?php echo $status['destination']; ?><?php echo $status['destination'] ? ': ' : ''; ?><span class="label label-danger"><?php echo $text_label_disapproved; ?></span><br />
                                        <?php endif; ?>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <span class="label label-warning"><?php echo $text_label_pending; ?></span>
                            <?php endif; ?>
                        </td>
                        <td class="text-left">
                            <?php if ($issue['data_quality_issues']) : ?>
                                <?php foreach ($issue['data_quality_issues'] as $index => $quality_issue) : ?>
                                    <?php if ($quality_issue['severity'] == 'critical') : ?>
                                        <?php echo $quality_issue['destination']; ?><?php echo $quality_issue['destination'] ? ': ' : ''; ?><span class="label label-danger"><?php echo $text_label_critical; ?></span>
                                    <?php elseif ($quality_issue['severity'] == 'error') : ?>
                                        <?php echo $quality_issue['destination']; ?><?php echo $quality_issue['destination'] ? ': ' : ''; ?><span class="label label-danger"><?php echo $text_label_error; ?></span>
                                    <?php elseif ($quality_issue['severity'] == 'suggestion') : ?>
                                        <?php echo $quality_issue['destination']; ?><?php echo $quality_issue['destination'] ? ': ' : ''; ?><span class="label label-info"><?php echo $text_label_suggestion; ?></span>
                                    <?php endif; ?>
                                    <?php echo $quality_issue['detail']; ?>
                                    <?php if ($index + 1 != count($issue['data_quality_issues'])) : ?>
                                        <hr />
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <?php echo $text_na; ?>
                            <?php endif; ?>
                        </td>
                        <td class="text-left">
                            <?php if ($issue['item_level_issues']) : ?>
                                <?php foreach ($issue['item_level_issues'] as $index => $item_issue) : ?>
                                    <strong><?php echo $item_issue['servability']; ?></strong> <?php echo $item_issue['detail']; ?> <a href="<?php echo $item_issue['documentation']; ?>" target="_blank"><?php echo $text_learn_more; ?> <i class="fa fa-external-link"></i></a>
                                    <?php if ($index + 1 != count($issue['item_level_issues'])) : ?>
                                        <hr />
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <?php echo $text_na; ?>
                            <?php endif; ?>
                        </td>
                        <td class="text-left"><?php echo $issue['google_expiration_date']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
<?php endforeach; ?>