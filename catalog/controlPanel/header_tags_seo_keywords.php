<?php
/*
  $Id: header_tags_seo_keywords.php,v 1.2 2011/07/24
  header_tags_keywords Originally Created by: Jack_mcs
  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce
  Portions Copyright 2009 oscommerce-solution.com

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  require_once('includes/functions/header_tags.php');
  require_once(DIR_WS_FUNCTIONS . 'headertags_seo_position_google.php');

  $filename = DIR_FS_CATALOG. DIR_WS_INCLUDES . 'header_tags.php'; 
  $languages = tep_get_languages();
  $sortBy = array('keyword' => 'checked', 'current' => 'found DESC, keyword ASC');

  /********************** HANDLE THE REQUESTS *********************/
  if (isset($_POST['sortgroup'])) {
      switch ($_POST['sortgroup']) {
          case TEXT_SORT_ON_DATE:           $sortBy['date'] = 'checked';                 $sortBy['current'] = 'last_search DESC'; break;
          case TEXT_SORT_ON_KEYWORD:        $sortBy['keyword'] = 'checked';              $sortBy['current'] = 'found DESC, keyword ASC'; break;
          case TEXT_SORT_ON_GOOGLE:         $sortBy['google_last_position'] = 'checked'; $sortBy['current'] = 'google_last_position DESC, keyword ASC'; break;
          case TEXT_SORT_ON_KEYWORD_NONHTS: $sortBy['nonhts_keyword'] = 'checked';       $sortBy['current'] = 'found, keyword ASC'; break;
          case TEXT_SORT_ON_SEARCHES:       $sortBy['searches'] = 'checked';             $sortBy['current'] = 'counter DESC'; break;
          default:                          $sortBy['keyword'] = 'checked';              $sortBy['current'] = 'found DESC, keyword ASC';
      }
  } 

  else if (isset($_POST['delete_words']) && $_POST['delete_words'] == true) {
      $deleted = 0;

      while (list($key, $value) = each($_POST)) {
          if (strpos($key, 'delete_word_') !== FALSE) {
              $deleted++;
              tep_db_query("delete from " . TABLE_HEADERTAGS_KEYWORDS . " where id = " . (int)$value);
          }
      }

      if ($deleted) $messageStack->add(sprintf(TEXT_DELETE_SUCCESSFUL, $deleted), 'success');
  }

  else if (isset($_POST['search_site']) && $_POST['search_site'] == true) {
      $updated = 0;


      while (list($key, $value) = each($_POST)) {
          if (strpos($key, 'searchgroup_') !== FALSE) {
              $parts = explode('_', $value);

              $pID = (isset($_POST['searchpid_'.$parts[2]]) ? (int)$_POST['searchpid_'.$parts[2]] : '');

              if ($pID > 0) { 
                  $kwrd_query = tep_db_query("select 1 from " . TABLE_HEADERTAGS_SEARCH . " where product_id = " . (int)$pID. " and keyword = '" . tep_db_input($parts[1]) . "' and language_id = " . (int)$parts[3]);

                  if ($parts[0] == TEXT_KEYWORD_SEARCH_SITE_YES) {
                      if (tep_db_num_rows($kwrd_query) == 0) { //otherwise it already exists
                          tep_db_query("insert into " . TABLE_HEADERTAGS_SEARCH . " (product_id, keyword, language_id) values ('" . (int)$pID . "', '" . tep_db_input($parts[1]) . "', '" . (int)$parts[3] . "')");
                          tep_db_query("update " . TABLE_HEADERTAGS_KEYWORDS . " set found = 1 where id = " . (int)$parts[2] . " and keyword = '" . tep_db_input($parts[1]) . "' and language_id = " . (int)$parts[3]);
                          $updated++;
                      }
                  } else if ($parts[0] == TEXT_KEYWORD_SEARCH_SITE_NO) {
                      if (tep_db_num_rows($kwrd_query) > 0) { //otherwise there's nothing to delete
                          tep_db_query("delete from " . TABLE_HEADERTAGS_SEARCH . " where product_id = " . (int)$pID. " and keyword = '" . tep_db_input($parts[1]) . "' and language_id = " . (int)$parts[3] );
                          tep_db_query("update " . TABLE_HEADERTAGS_KEYWORDS . " set found = 0 where id = " . (int)$parts[2] . " and keyword = '" . tep_db_input($parts[1]) . "' and language_id = " . (int)$parts[3]);
                          $updated++;
                      }
                  }
              } else {
                  $messageStack->add(ERROR_MISSING_PRODUCT_ID, 'error');
              }
          }
      }

      if ($updated) $messageStack->add(sprintf(TEXT_KEYWORD_SEARCH_SITE_SUCCESSFUL, $updated), 'success');
  }  

 /********************** Perform Maintenance on keywords **********************/


 /********************** LOAD THE STORED SEARCH WORDS **********************/
  $searchWords = array();
  $searchwords_query = tep_db_query("select * from " . TABLE_HEADERTAGS_SEARCH);
  while ($words = tep_db_fetch_array($searchwords_query)) {
      $searchWords[] = $words;
  }

  require(DIR_WS_INCLUDES . 'template_top.php');
?>
<style type="text/css">
td.HTC_Head {font-family: Verdana, Arial, sans-serif; color: sienna; font-size: 18px; font-weight: bold; } 
td.HTC_subHead {font-family: Verdana, Arial, sans-serif; color: sienna; font-size: 12px; } 
.HTC_title {background: #fof1f1; text-align: center;} 
input { vertical-align: middle; margin-top: -1px;}
</style>

<script src="includes/javascript/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>

<script type="text/javascript">
function ShowKeyword(str, id) {
//alert(str + " word is "+id);

  if (str=="")
    {
    document.getElementById(id).innerHTML="";
    return;
    } 
  if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
    }
  else
    {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  xmlhttp.onreadystatechange=function()
    {
    //alert(xmlhttp.readyState);
    if(xmlhttp.readyState == 1 || xmlhttp.readyState == "loading") {
      document.getElementById('waitimg').style.display = 'block';
      document.getElementById('waitimg').src = 'images/busywait.gif';
      document.getElementById('waitimg').border='0';
      //document.getElementById('waitimg').innerHTML="<img src='images/ajax-loader.gif' border='0' alt='running' style='display:block' />";   
      document.getElementById('waitdiv').style.top = $(window).scrollTop() + 200;
    }

    if (xmlhttp.readyState==4 && xmlhttp.status==200)
      {
      document.getElementById(id).innerHTML=xmlhttp.responseText;
      document.getElementById('waitimg').style.display = 'none';
      document.getElementById('waitimg').src = '';
      }
    }
  var URL = document.getElementById('search_url').value;
  var cnt = document.getElementById('page_count').value;

  var gooID = 'goolast_'+id;
  var googleLast = document.getElementById(gooID).value;

 // alert("word="+URL);  
  xmlhttp.open("GET","headertags_seo_keyword_position.php?keyword="+str+"&section=get_kword&url="+URL+"&page_cnt="+cnt+"&googleLast="+googleLast,true);
  xmlhttp.send();
}
</script>

<script type="text/javascript">
function handlesubmit(id) {
  if (id == 'search_site') {
    document.keywords_form.search_site.value = true;
  } else if (id == 'delete_words') {
    document.keywords_form.delete_words.value = true;  
  }
  document.keywords_form.submit();
} 
</script>

<script type="text/javascript">
if (document.images) {
    waitimg = new Image();
    waitimg.src = "images/busywait.gif";
}
</script>
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
    <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
     <tr>
      <td><table border="0" width="100%">
       <tr>
        <td class="HTC_Head"><?php echo HEADING_TITLE_SEO_KEYWORDS; ?></td>
       </tr>
      </table></td>  
     </tr>
     <tr><td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td></tr>
     <tr><td class="HTC_subHead"><?php echo TEXT_PAGE_HEADING_KEYWORDS; ?></td></tr>
     <tr><td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td></tr>
     <tr><td><?php echo tep_black_line(); ?></td></tr>     

     <!-- Begin of Header Tags -->   
     <tr>
      <td align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">     

       <!-- BEGIN KEYWORDS SECTION -->       
       <tr>
         <td align="right" width="100%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #fff; border: ridge #CCFFCC 3px; padding-left: 2px;">
          <tr style="background-color: #cccccc;">
            <th class="smallText"><?php echo HEADING_TITLE_SECTION_MAIN; ?></th>
          </tr>
          <tr><td height="8"></td></tr>	

          <tr>
            <td align="right" width="60%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top"><table border="0" cellpadding="0">
                    <tr class="smallText">
                      <form action="header_tags_seo_keywords.php" method="post" name="sortorder">                      
                      <td style="font-weight:bold; width:50px;"><?php echo TEXT_SORT_BY; ?></td>
                      <td><INPUT TYPE="radio" NAME="sortgroup" VALUE="<?php echo TEXT_SORT_ON_KEYWORD; ?>" <?php echo $sortBy['keyword']; ?> onClick="this.form.submit();"><?php echo TEXT_SORT_ON_KEYWORD; ?>&nbsp;</td>
                      <td><INPUT TYPE="radio" NAME="sortgroup" VALUE="<?php echo TEXT_SORT_ON_KEYWORD_NONHTS; ?>" <?php echo $sortBy['nonhts_keyword']; ?> onClick="this.form.submit();"><?php echo TEXT_SORT_ON_KEYWORD_NONHTS; ?>&nbsp;</td>
                      <td><INPUT TYPE="radio" NAME="sortgroup" VALUE="<?php echo TEXT_SORT_ON_DATE; ?>" <?php echo $sortBy['date']; ?> onClick="this.form.submit();"><?php echo TEXT_SORT_ON_DATE; ?>&nbsp;</td>
                      <td><INPUT TYPE="radio" NAME="sortgroup" VALUE="<?php echo TEXT_SORT_ON_SEARCHES; ?>" <?php echo $sortBy['searches']; ?> onClick="this.form.submit();"><?php echo TEXT_SORT_ON_SEARCHES; ?>&nbsp;</td>
                      <td><INPUT TYPE="radio" NAME="sortgroup" VALUE="<?php echo TEXT_SORT_ON_GOOGLE; ?>" <?php echo $sortBy['google_last_position']; ?> onClick="this.form.submit();"><?php echo TEXT_SORT_ON_GOOGLE; ?>&nbsp;</td>
                      </form>
                    </tr>
                  </table></td>
                  <td valign="top"><table border="0" cellpadding="0">
                    <tr class="smallText">
                      <td style="font-weight:bold; width:30px;"><?php echo TEXT_SEARCH_URL; ?></td>
                      <td width="80"><?php echo tep_draw_input_field('search_url', (defined('HEADER_TAGS_POSITION_DOMAIN') ? HEADER_TAGS_POSITION_DOMAIN : ''), ' id="search_url" maxlength="255" size="35"', false); ?> </td>
                      <td style="padding-left:10px; font-weight:bold; width:30px;"><?php echo TEXT_SEARCH_PAGE_COUNT; ?></td>
                      <td><?php echo tep_draw_input_field('page_count', (defined('HEADER_TAGS_POSITION_PAGE_COUNT') ? HEADER_TAGS_POSITION_PAGE_COUNT : ''), ' id="page_count" maxlength="3" size="4"', false); ?> </td>
                    </tr>
                  </table></td>                    
                </tr>    
                <tr><td hiehgt="10"></td></tr>
            </table></td>
          </tr>            

          <tr>
            <td align="right" width="60%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">                

                <?php

                 $keywords_query = tep_db_query("select * from " . TABLE_HEADERTAGS_KEYWORDS . " order by language_id, " . $sortBy['current']);

                 if (tep_db_num_rows($keywords_query) > 0 ) {

                     echo '<form action="header_tags_seo_keywords.php" method="post" name="keywords_form"><tr><td><table border="1" class="smallText">
                             <tr>
                               <th>' . TEXT_LANGUAGE . '</th>       
                               <th>' . '<input type="hidden" name="delete_words"><a href="javascript:handlesubmit(\'delete_words\');">' . TEXT_DELETE_WORD . '</a></th>                                   
                               <th>' . TEXT_KEYWORD . '</th>    
                               <th>' . TEXT_KEYWORD_COUNT . '</th>                    
                               <th>' . TEXT_KEYWORD_LAST_MODIFIED . '</th>                    
                               <th>' . TEXT_KEYWORD_POSITION_GOOGLE_LAST_DATE . '</th>                    
                               <th>' . TEXT_KEYWORD_POSITION_GOOGLE . '</th>     
                               <th>' . TEXT_KEYWORD_POSITION_GET_POSITION . '</th>  
                               <th>' . '<input type="hidden" name="search_site"><a href="javascript:handlesubmit(\'search_site\');">' . TEXT_KEYWORD_SEARCH_SITE . '</a></th>                                
                             </tr>';             

                     while ($keywords = tep_db_fetch_array($keywords_query)) {
                         $keyword = $keywords['keyword'];
                         $keyword_color = $keywords['found'] ? '#0000FF' : '#808000';
                         $lastChecked  = tep_date_short($keywords['google_date_position_check']);
                         $lastChecked  = ($lastChecked ? $lastChecked : '&nbsp;');
                         $lastSearched = tep_date_short($keywords['last_search']);
                         $lastSearched = ($lastSearched ? $lastSearched : '&nbsp;');

                         echo  '<input type="hidden"  name="goolast_' . $keywords['id']   . '" value="' .$keywords['google_last_position'] . '" id="goolast_' . $keywords['id'] . '">';

                         echo   '<tr>
                                  <td>' . GetLanguageName($keywords['language_id']) . '</td>
                                  <td>' . '<input type="checkbox" name="delete_word_' . $keywords['id'] . '" value="' . $keywords['id'] . '"></td>
                                  <td>' . '<span style="color:' . $keyword_color . '; font-weight:bold;">' . $keyword . '</span></td>
                                  <td>' . $keywords['counter'] . '</td>
                                  <td>' . $lastSearched . '</td>
                                  <td>' . $lastChecked. '</td>
                                  <td>' . '<div id="' . $keywords['id'] . '">' . $keywords['google_last_position'] . '</div></td>
                                  <td>' . '<input type="button" value="' . $keyword . '" onclick="ShowKeyword(\'' . $keyword .'\', \'' . $keywords['id'] . '\');" style="text-align:left">
                                  <td>' . '<input type="radio" name="searchgroup_' . $keywords['id'] . '" value="' . TEXT_KEYWORD_SEARCH_SITE_YES . '_' . $keyword  . '_' .$keywords['id'] . '_' . $keywords['language_id'] . '">' . TEXT_KEYWORD_SEARCH_SITE_YES . 
                                          '<input type="radio" name="searchgroup_' . $keywords['id'] . '" value="' . TEXT_KEYWORD_SEARCH_SITE_NO  . '_' . $keyword  . '_' .$keywords['id'] . '_' . $keywords['language_id'] . '">' . TEXT_KEYWORD_SEARCH_SITE_NO .
                                          '<input type="text"  name="searchpid_' . $keywords['id']   . '" value="' . GetProductID($searchWords, $keyword, $keywords['language_id']) . '" size="2">' . TEXT_KEYWORD_SEARCH_SITE_PID . '</td>
                                 </tr>';
                      }

                      echo '</table></td></tr></form>';                      
                  }
                  ?>              




            </table></td>
          </tr>   
         </table></td>
       </tr>   
       <!-- END KEYWORDS SECTION -->

       <tr><td height="20"></td></tr>	 


      </table></td> 
     </tr>
     <!-- end of Header Tags -->

    </table></td>
  </tr>
</table>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
