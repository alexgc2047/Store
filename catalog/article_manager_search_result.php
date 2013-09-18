<?php
/*
  $Id: article_manager_search_result.php, v1.5.1 2010/07/12 12:00:00 ra Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce
  Portions Copyright 2009 http://www.oscommerce-solution.com

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_ARTICLE_MANAGER_SEARCH_RESULT);

  $searchFor = preg_replace('/[^A-Za-z0-9_ -]/', '', $_GET['article_keywords']);

  $articles_query = tep_db_query("select * from " . TABLE_ARTICLES . " a left join " . TABLE_ARTICLES_DESCRIPTION . " ad on a.articles_id = ad.articles_id where a.articles_status = 1 and ( ad.articles_name LIKE '%" . $searchFor . "%' or ad.articles_description LIKE '%" . $searchFor . "%' ) and language_id = " . (int)$languages_id);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_ARTICLE_MANAGER_SEARCH_RESULT));
  require(DIR_WS_INCLUDES . 'template_top.php');
?>
<table border="0" width="100%" cellspacing="3" cellpadding="3">
  <tr>

    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
            <td class="pageHeading" align="right"><?php echo tep_image(DIR_WS_IMAGES . 'table_background_specials.gif', HEADING_TITLE, HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT); ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
            <td class="main"><?php echo TEXT_INFORMATION; ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>

      <?php
      if (tep_db_num_rows($articles_query)) {
          echo '<tr><td><table border="0" cellpadding="2" width="100%">';
          while ($articles = tep_db_fetch_array($articles_query))  {
             $cleanedDescription = trim(strip_tags($articles['articles_description']));
             echo '<tr><td class="smallText" colspan="2"><a href="' . tep_href_link(FILENAME_ARTICLE_INFO, 'articles_id='.$articles['articles_id'])  . '"><b>' . $articles['articles_name'] . '</b></a></td></tr>';
             echo '<tr><td width="8"></td><td class="smallText">' . (strlen($cleanedDescription) > MAX_ARTICLE_ABSTRACT_LENGTH ? substr($cleanedDescription, 0, MAX_ARTICLE_ABSTRACT_LENGTH) . '<a href="' . tep_href_link(FILENAME_ARTICLE_INFO, 'articles_id='.$articles['articles_id'])  . '">' . TEXT_SEARCH_SEE_MORE . '</a>' : $cleanedDescription ) . '</td></tr>';
          }
          echo '</table></td></tr>';
      } else {
          echo '<tr><td class="main">' . TEXT_NO_ARTICLES_FOUND . '</td></tr>';
      }
      ?>

      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="1" cellpadding="2">
          <tr>
            <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                <td align="right"><?php echo '<a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . tep_image_button('button_continue.gif', IMAGE_BUTTON_CONTINUE) . '</a>'; ?></td>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>

  </tr>
</table>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>