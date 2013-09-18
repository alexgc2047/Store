<?php
/*
  $Id: headertags_seo_install.php, v 3.0 by Jack_mcs

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  
  $db_error = false;

  $hts_check_query = tep_db_query("select * from ". TABLE_PRODUCTS_DESCRIPTION);

  for ($ctr = 0; $ctr < tep_db_fetch_fields($hts_check_query); $ctr++) {
      if (false != strstr(mysql_field_name($hts_check_query, $ctr), 'products_head_title_tag')) {
          echo 'Looks like Header Tags is already installed. Aborting...';
	  tep_exit();
      }
  }
  $line = array("ALTER TABLE " . TABLE_CATEGORIES_DESCRIPTION . " ADD categories_htc_title_tag VARCHAR(80) NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_CATEGORIES_DESCRIPTION . " ADD categories_htc_desc_tag LONGTEXT NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_CATEGORIES_DESCRIPTION . " ADD categories_htc_keywords_tag LONGTEXT NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_CATEGORIES_DESCRIPTION . " ADD categories_htc_description LONGTEXT NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }

  $line = array("ALTER TABLE " . TABLE_MANUFACTURERS_INFO . " ADD manufacturers_htc_title_tag VARCHAR(80) NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_MANUFACTURERS_INFO . " ADD manufacturers_htc_desc_tag LONGTEXT NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_MANUFACTURERS_INFO . " ADD manufacturers_htc_keywords_tag LONGTEXT NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_MANUFACTURERS_INFO . " ADD manufacturers_htc_description LONGTEXT NULL;");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }

  $line = array("ALTER TABLE " . TABLE_PRODUCTS_DESCRIPTION . " ADD products_head_title_tag VARCHAR(80) NULL");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
	   break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_PRODUCTS_DESCRIPTION . " ADD products_head_desc_tag LONGTEXT NULL");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_PRODUCTS_DESCRIPTION . " ADD products_head_keywords_tag LONGTEXT NULL");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_PRODUCTS_DESCRIPTION . " ADD products_head_listing_text LONGTEXT NULL");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }
  $line = array("ALTER TABLE " . TABLE_PRODUCTS_DESCRIPTION . " ADD products_head_sub_text LONGTEXT NULL");
  foreach ($line as $value) {
    if (tep_db_query($value) == false) {
      $db_error = true;
		 break;
    }
  }

  $hts_sql_array = array(
                   array("DROP TABLE IF EXISTS headertags_cache"),
                   array("CREATE TABLE headertags_cache (title text, data text)"),
                   array("DROP TABLE IF EXISTS headertags_default"),
                   array("CREATE TABLE headertags_default (default_title varchar(255) default '' NOT NULL, default_description varchar(255) default '' NOT NULL, default_keywords varchar(255) default '' NOT NULL, default_logo_text varchar(255) default '' NOT NULL, default_logo_append_group tinyint(1) default 1 NOT NULL, default_logo_append_category tinyint(1) default 1 NOT NULL, default_logo_append_manufacturer tinyint(1) default 1 NOT NULL, default_logo_append_product tinyint(1) default 1 NOT NULL, meta_google tinyint(1) default 0 NOT NULL, meta_language tinyint(1) default 0 NOT NULL, meta_noodp tinyint(1) default 1 NOT NULL, meta_noydir tinyint(1) default 1 NOT NULL, meta_replyto tinyint(1) default 0 NOT NULL, meta_revisit tinyint(1) default 0 NOT NULL, meta_robots tinyint(1) default 0 NOT NULL, meta_unspam tinyint(1) default 0 NOT NULL, meta_canonical tinyint(1) default 1 NOT NULL, language_id int DEFAULT '1' NOT NULL, PRIMARY KEY (default_title, language_id))"),
                   array("DROP TABLE IF EXISTS headertags"),
                   array("CREATE TABLE headertags (page_name varchar(64) default '' NOT NULL, page_title varchar(120) default '' NOT NULL, page_description varchar(255) default '' NOT NULL, page_keywords varchar(255) default '' NOT NULL, page_logo varchar(255) default '' NOT NULL, page_logo_1 varchar(255) default '' NOT NULL, page_logo_2 varchar(255) default '' NOT NULL, page_logo_3 varchar(255) default '' NOT NULL, page_logo_4 varchar(255) default '' NOT NULL, append_default_title tinyint(1) default 0 NOT NULL, append_default_description tinyint(1) default 0 NOT NULL, append_default_keywords tinyint(1) default 0 NOT NULL, append_default_logo tinyint(1) default 0 NOT NULL, append_category tinyint(1) default 0 NOT NULL, append_manufacturer tinyint(1) default 0 NOT NULL, append_model tinyint(1) default 0 NOT NULL, append_product tinyint(1) default 1 NOT NULL, append_root tinyint(1) default 1 NOT NULL, sortorder_title tinyint(2) default 0 NOT NULL, sortorder_description tinyint(2) default 0 NOT NULL, sortorder_keywords tinyint(2) default 0 NOT NULL, sortorder_logo tinyint(2) default 0 NOT NULL, sortorder_logo_1 tinyint(2) default 0 NOT NULL, sortorder_logo_2 tinyint(2) default 0 NOT NULL, sortorder_logo_3 tinyint(2) default 0 NOT NULL, sortorder_logo_4 tinyint(2) default 0 NOT NULL, sortorder_category tinyint(2) default 0 NOT NULL, sortorder_manufacturer tinyint(2) default 0 NOT NULL, sortorder_model tinyint(2) default 0 NOT NULL, sortorder_product tinyint(2) default 10 NOT NULL, sortorder_root tinyint(2) default 1 NOT NULL, sortorder_root_1 tinyint(2) default 1 NOT NULL, sortorder_root_2 tinyint(2) default 1 NOT NULL, sortorder_root_3 tinyint(2) default 1 NOT NULL, sortorder_root_4 tinyint(2) default 1 NOT NULL, language_id int DEFAULT '1' NOT NULL, PRIMARY KEY (page_name, language_id))"),
                   array("DROP TABLE IF EXISTS headertags_silo"),
                   array("CREATE TABLE headertags_silo (category_id int NOT NULL DEFAULT '0', box_heading VARCHAR (60) NOT NULL, is_disabled TINYINT (1) DEFAULT 0 NOT NULL, max_links int DEFAULT '6' NOT NULL, sorton TINYINT (2) DEFAULT 0 NOT NULL, language_id int DEFAULT '1' NOT NULL, PRIMARY KEY ( category_id, language_id ))"),
                   array("DROP TABLE IF EXISTS headertags_keywords"),
                   array("CREATE TABLE headertags_keywords (id int(11) NOT NULL AUTO_INCREMENT, keyword varchar(120) NOT NULL DEFAULT '', counter int(11) NOT NULL DEFAULT '1', last_search datetime NOT NULL DEFAULT '0000-00-00 00:00:00', google_last_position tinyint(4) NOT NULL, google_date_position_check datetime NOT NULL DEFAULT '0000-00-00 00:00:00', found TINYINT( 1 ) NOT NULL DEFAULT 0, language_id int(11) NOT NULL DEFAULT '1', PRIMARY KEY (id), KEY keyword (keyword), KEY found (found)) AUTO_INCREMENT=1"),
                   array("DROP TABLE IF EXISTS headertags_search"),
                   array("CREATE TABLE headertags_search (product_id INT( 11 ) NOT NULL, keyword VARCHAR( 64 ) NOT NULL, language_id INT( 11 ) NOT NULL, KEY keyword (keyword))"));

  // create tables
  foreach ($hts_sql_array as $sql_array) {
    foreach ($sql_array as $value) {
      if (tep_db_query($value) == false) {
        $db_error = true;
      }
    }
  }
  
  $languages_query = tep_db_query("select languages_id from " . TABLE_LANGUAGES . " order by sort_order");

  while ($languages = tep_db_fetch_array($languages_query)) {
      $hts_sql_array = array(array("INSERT INTO headertags_default VALUES ('Default title', 'Default description', 'Default Keywords', 'Default Logo Text', '0','0','0','0','0','0','1','1','0','0','0','0', '1', " . $languages['languages_id'] . ")"),
                             array("INSERT INTO headertags VALUES ('index.php', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', 'Replace me in Page Control under index.php - oscommerce-solution.com', '', '', '', '', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '10', '0', '1', '1', '1', '1', " . $languages['languages_id'] . ")"),
                             array("INSERT INTO headertags VALUES ('product_info.php', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0','0',  '10', '1', '1', '1', '1', '1', " . $languages['languages_id'] . ")"),
                             array("INSERT INTO headertags VALUES ('product_reviews.php', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', '10', '1', '1', '1', '1', '1', " . $languages['languages_id'] . ")"),
                             array("INSERT INTO headertags VALUES ('product_reviews_info.php', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', '0', '10', '1', '1', '1', '1', '1', " . $languages['languages_id'] . ")"),
                             array("INSERT INTO headertags VALUES ('product_reviews_write.php', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', '0', '10', '1', '1', '1', '1', '1', " . $languages['languages_id'] . ")"),
                             array("INSERT INTO headertags VALUES ('specials.php', 'specials', 'specials', 'specials', 'Specials', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0','0', '0', '10', '1', '1', '1', '1', '1', " . $languages['languages_id'] . ")"));

      // create tables
      foreach ($hts_sql_array as $sql_array) {
        foreach ($sql_array as $value) {
          if (tep_db_query($value) == false) {
            $db_error = true;
          }
        }
      }
  }


  $hts_check_query = tep_db_query("select max(configuration_group_id) as id from configuration_group ");
  $max = tep_db_fetch_array($hts_check_query);
  $configuration_group_id = $max['id'] + 1;

  // create configuration group
  $group_query = "INSERT INTO configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible ) VALUES ('" . $configuration_group_id . "', 'Header Tags SEO', 'Header Tags SEO site wide options', '22' , '1')";

  if (tep_db_query($group_query) == false) {
    $db_error = true;
  } else {
    $sortID = 1;
  
    // create configuration variables
    $fields = " configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function ";
    $hts_sql_array = array(array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Automatically Add New Pages', 'HEADER_TAGS_AUTO_ADD_PAGES', 'true', 'Adds any new pages when Page Control is accessed<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Check for Missing Tags', 'HEADER_TAGS_CHECK_TAGS', 'true', 'Check to see if any products, categories or manufacturers contain empty meta tag fields<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Clear Cache', 'HEADER_TAGS_CLEAR_CACHE', 'false', 'Remove all Header Tags cache entries from the database.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'clear\', \'false\'), ', now(), 'header_tags_reset_cache')"),
  
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Category Parents in Title and Tags</font>', 'HEADER_TAGS_ADD_CATEGORY_PARENTS', 'Standard', 'Adds all categories in the current path (Full), all immediate categories if the product is in more than one category (Duplicate) or only the immediate category (Standard). These settings only work if the Category checkbox is enabled in Page Control.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(''Full Category Path'', ''Duplicate Categories'', ''Standard''), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Column Box</font>', 'HEADER_TAGS_DISPLAY_COLUMN_BOX', 'false', 'Display product box in column while on product page<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Currently Viewing</font>', 'HEADER_TAGS_DISPLAY_CURRENTLY_VIEWING', 'true', 'Display a link near the bottom of the product page.<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Help Popups</font>', 'HEADER_TAGS_DISPLAY_HELP_POPUPS', 'true', 'Display short popup messages that describes a feature<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Disable Permission Warning</font>', 'HEADER_TAGS_DIABLE_PERMISSION_WARNING', 'false', 'Prevent the warning that appears if the permissions for the includes/header_tags.php file appear to be incoorect.<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Page Top Title</font>', 'HEADER_TAGS_DISPLAY_PAGE_TOP_TITLE', 'true', 'Displays the page title at the very top of the page<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Silo Links</font>', 'HEADER_TAGS_DISPLAY_SILO_BOX', 'false', 'Display a box displaying links based on the settings in Silo Control<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Social Bookmark</font>', 'HEADER_TAGS_DISPLAY_SOCIAL_BOOKMARKS', 'true', 'Display social bookmarks on the product page<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=purple>Display Tag Cloud</font>', 'HEADER_TAGS_DISPLAY_TAG_CLOUD', 'false', 'Display the Tag Cloud infobox<br>(true=on false=off)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
  
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable AutoFill - Listing Text</font>', 'HEADER_TAGS_ENABLE_AUTOFILL_LISTING_TEXT', 'false', 'If true, text will be shown on the product listing page automatically. If false, the text only shows if the field has text in it.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'),', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable Cache</font>', 'HEADER_TAGS_ENABLE_CACHE', 'None', 'Enables cache for Header Tags. The GZip option will use gzip to try to increase speed but may be a little slower if the Header Tags data is small.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'None\', \'Normal\', \'GZip\'),', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable an HTML Editor</font>', 'HEADER_TAGS_ENABLE_HTML_EDITOR', 'No Editor', 'Use an HTML editor, if selected. !!! Warning !!! The selected editor must be installed for it to work!!!)', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'CKEditor\', \'FCKEditor\', \'TinyMCE\', \'No Editor\'),', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable HTML Editor for Category Descriptions</font>', 'HEADER_TAGS_ENABLE_EDITOR_CATEGORIES', 'false', 'Enables the selected HTML editor for the categories description box. The editor must be installed for this to work.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable HTML Editor for Products Descriptions</font>', 'HEADER_TAGS_ENABLE_EDITOR_PRODUCTS', 'false', 'Enables the selected HTML editor for the products description box. The editor must be installed for this to work.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable HTML Editor for Product Listing text</font>', 'HEADER_TAGS_ENABLE_EDITOR_LISTING_TEXT', 'false', 'Enables the selected HTML editor for the Header Tags text on the product listing page. The editor must be installed for this to work.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable HTML Editor for Product Sub Text</font>', 'HEADER_TAGS_ENABLE_EDITOR_SUB_TEXT', 'false', 'Enables the selected HTML editor for the sub text on the products page. The editor must be installed for this to work.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'<font color=blue>Enable Version Checker</font>', 'HEADER_TAGS_ENABLE_VERSION_CHECKER', 'true', 'Enables the code that checks if updates are available.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
  
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Keyword Density Range', 'HEADER_TAGS_KEYWORD_DENSITY_RANGE', '0.02,0.06', 'Set the limits for the keyword density use to dynamically select the keywords. Enter two figures, separated by a comma.', '" . $configuration_group_id . "', '" . ($sortID++). "', NULL, now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Position Domain', 'HEADER_TAGS_POSITION_DOMAIN', '', 'Set the domain name to be used in the keyword position checking code, like www.domain_name.com or domain_name.com/shop.', '" . $configuration_group_id . "', '" . ($sortID++). "', NULL, now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Position Page Count', 'HEADER_TAGS_POSITION_PAGE_COUNT', '2', 'Set the number of pages to search when checking keyword positions (10 urls per page).', '" . $configuration_group_id . "', '" . ($sortID++). "', NULL, now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Separator - Description', 'HEADER_TAGS_SEPARATOR_DESCRIPTION', '-', 'Set the separator to be used for the description (and titles and logo).', '" . $configuration_group_id . "', '" . ($sortID++). "', NULL, now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Separator - Keywords', 'HEADER_TAGS_SEPARATOR_KEYWORD', ',', 'Set the separator to be used for the keywords.', '" . $configuration_group_id . "', '" . ($sortID++). "', NULL, now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Search Keywords', 'HEADER_TAGS_SEARCH_KEYWORDS', 'false', 'This option allows keywords stored in the Header Tags SEO search table to be searched when a search is performed on the site.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Store Keywords', 'HEADER_TAGS_STORE_KEYWORDS', 'true', 'This option stores the searched for keywords so they can be used by other parts of Header Tags, like in the Tag Cloud option.', '" . $configuration_group_id . "', '" . ($sortID++). "', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL)"),
                           array("INSERT INTO configuration (" . $fields . ") VALUES (NULL,'Tag Cloud Column Count', 'HEADER_TAGS_TAG_CLOUD_COLUMN_COUNT', '8', 'Set the number of keywords to display in a row in the Tag Cloud box.', '" . $configuration_group_id . "', '" . ($sortID++). "', NULL, now(), NULL)"));
  
    foreach ($hts_sql_array as $sql_array) {
      foreach ($sql_array as $value) {
        //echo $value . '<br>';
        if (tep_db_query($value) == false) {
          $db_error = true;
        }
      }
    }
  }

?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body>


<!-- body //-->
<table border="0" width="100%" cellspacing="3" cellpadding="3">
  <tr>

<!-- body_text //-->
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo 'Header Tags SEO Database Installer'; ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td class="main">
<?php
  if ($db_error == false) {
    echo 'Database successfully updated for Header Tags SEO!!!';
?>
        </td>
       </tr>
       <tr>
         <td><?php echo '<a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . tep_image_button('button_continue.gif', IMAGE_BUTTON_CONTINUE) . '</a>'; ?></td>
       </tr>

<?php
  } else {
    echo 'Errors encountered during database update.</td></tr>';
  }
?>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
    </table></td>
<!-- body_text_eof //-->

  </tr>
</table>
<!-- body_eof //-->

</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
