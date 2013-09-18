<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require(DIR_WS_INCLUDES . 'counter.php');
?>

<div class="grid_24 footer">
  <p align="center"><?php echo FOOTER_TEXT_BODY; ?></p>
  <?php
/*** Begin Header Tags SEO ***/
if ($request_type == NONSSL) { 
  if (HEADER_TAGS_DISPLAY_TAG_CLOUD == 'true') {
      echo '<tr><td align="center"><div style="text-align:center">';
      include(DIR_WS_INCLUDES . 'headertags_seo_tagcloud_footer.php');
      echo '</div></td></tr>';
  }
}
/*** End Header Tags SEO ***/
?>

</div>

<?php
  if ($banner = tep_banner_exists('dynamic', '468x50')) {
?>

<div class="grid_24" style="text-align: center; padding-bottom: 20px;">
  <?php echo tep_display_banner('static', $banner); ?>
</div>

<?php
  }
?>

<script type="text/javascript">
$('.productListTable tr:nth-child(even)').addClass('alt');
</script>
