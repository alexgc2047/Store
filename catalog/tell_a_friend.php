<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  if (!tep_session_is_registered('customer_id') && (ALLOW_GUEST_TO_TELL_A_FRIEND == 'false')) {
    $navigation->set_snapshot();
    tep_redirect(tep_href_link(FILENAME_LOGIN, '', 'SSL'));
  }

  /**** BEGIN ARTICLE MANAGER ****/
  $valid_product = false;
  if (isset($HTTP_GET_VARS['products_id'])) {
    $product_info_query = tep_db_query("select pd.products_name from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "'");
    if (tep_db_num_rows($product_info_query)) {
      $valid_product = true;

      $product_info = tep_db_fetch_array($product_info_query);
    } else {
      tep_redirect(tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $HTTP_GET_VARS['products_id']));
    }
  }

  $valid_article = false;
  if (isset($HTTP_GET_VARS['articles_id'])) {
    $article_info_query = tep_db_query("select pd.articles_name from " . TABLE_ARTICLES . " p, " . TABLE_ARTICLES_DESCRIPTION . " pd where p.articles_status = '1' and p.articles_id = '" . (int)$HTTP_GET_VARS['articles_id'] . "' and p.articles_id = pd.articles_id and pd.language_id = '" . (int)$languages_id . "'");
    if (tep_db_num_rows($article_info_query)) {
      $valid_article = true;

      $article_info = tep_db_fetch_array($article_info_query);
    } else {
      tep_redirect(tep_href_link(FILENAME_ARTICLE_INFO, 'articles_id=' . $HTTP_GET_VARS['articles_id']));
    }
  }
  /**** END ARTICLE MANAGER ****/


  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_TELL_A_FRIEND);

  if (isset($HTTP_GET_VARS['action']) && ($HTTP_GET_VARS['action'] == 'process') && isset($HTTP_POST_VARS['formid']) && ($HTTP_POST_VARS['formid'] == $sessiontoken)) {
    $error = false;

    $to_email_address = tep_db_prepare_input($HTTP_POST_VARS['to_email_address']);
    $to_name = tep_db_prepare_input($HTTP_POST_VARS['to_name']);
    $from_email_address = tep_db_prepare_input($HTTP_POST_VARS['from_email_address']);
    $from_name = tep_db_prepare_input($HTTP_POST_VARS['from_name']);
    $message = tep_db_prepare_input($HTTP_POST_VARS['message']);

    if (empty($from_name)) {
      $error = true;

      $messageStack->add('friend', ERROR_FROM_NAME);
    }

    if (!tep_validate_email($from_email_address)) {
      $error = true;

      $messageStack->add('friend', ERROR_FROM_ADDRESS);
    }

    if (empty($to_name)) {
      $error = true;

      $messageStack->add('friend', ERROR_TO_NAME);
    }

    if (!tep_validate_email($to_email_address)) {
      $error = true;

      $messageStack->add('friend', ERROR_TO_ADDRESS);
    }

    $actionRecorder = new actionRecorder('ar_tell_a_friend', (tep_session_is_registered('customer_id') ? $customer_id : null), $from_name);
    if (!$actionRecorder->canPerform()) {
      $error = true;

      $actionRecorder->record(false);

      $messageStack->add('friend', sprintf(ERROR_ACTION_RECORDER, (defined('MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES') ? (int)MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES : 15)));
    }

        /**** BEGIN ARTICLE MANAGER ****/
    if ($error == false) {
      // Modify e-mail depending on whether prodect or article
      // if product
      if ($valid_product) {
        $email_subject = sprintf(TEXT_EMAIL_SUBJECT, $from_name, STORE_NAME);
        $email_body = sprintf(TEXT_EMAIL_INTRO, $to_name, $from_name, $product_info['products_name'], STORE_NAME) . "\n\n";
    /**** END ARTICLE MANAGER ****/


      if (tep_not_null($message)) {
        $email_body .= $message . "\n\n";
      }

      $email_body .= sprintf(TEXT_EMAIL_LINK, tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . (int)$HTTP_GET_VARS['products_id'], 'NONSSL', false)) . "\n\n" .
                     sprintf(TEXT_EMAIL_SIGNATURE, STORE_NAME . "\n" . HTTP_SERVER . DIR_WS_CATALOG . "\n");

      tep_mail($to_name, $to_email_address, $email_subject, $email_body, $from_name, $from_email_address);

      $actionRecorder->record();

              $messageStack->add_session('header', sprintf(TEXT_EMAIL_SUCCESSFUL_SENT, $product_info['products_name'], tep_output_string_protected($to_name)), 'success');

        tep_redirect(tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $HTTP_GET_VARS['products_id']));

        /**** BEGIN ARTICLE MANAGER ****/
        } else if ($valid_article) {
          $email_subject = sprintf(TEXT_EMAIL_SUBJECT, $from_name, STORE_NAME);
          $email_body = sprintf(TEXT_EMAIL_INTRO, $to_name, $from_name, $article_info['articles_name'], STORE_NAME) . "\n\n";

          if (tep_not_null($message)) {
            $email_body .= $message . "\n\n";
          }

          $email_body .= sprintf(TEXT_EMAIL_LINK_ARTICLE, tep_href_link(FILENAME_ARTICLE_INFO, 'articles_id=' . $HTTP_GET_VARS['articles_id'])) . "\n\n" .
                         sprintf(TEXT_EMAIL_SIGNATURE, STORE_NAME . "\n" . HTTP_SERVER . DIR_WS_CATALOG . "\n");

          tep_mail($to_name, $to_email_address, $email_subject, $email_body, $from_name, $from_email_address);

          $messageStack->add_session('header', sprintf(TEXT_EMAIL_SUCCESSFUL_SENT, $article_info['articles_name'], tep_output_string_protected($to_name)), 'success');

          tep_redirect(tep_href_link(FILENAME_ARTICLE_INFO, 'articles_id=' . $HTTP_GET_VARS['articles_id']));
          }
          /**** END ARTICLE MANAGER ****/

    }
  } elseif (tep_session_is_registered('customer_id')) {
    $account_query = tep_db_query("select customers_firstname, customers_lastname, customers_email_address from " . TABLE_CUSTOMERS . " where customers_id = '" . (int)$customer_id . "'");
    $account = tep_db_fetch_array($account_query);

    $from_name = $account['customers_firstname'] . ' ' . $account['customers_lastname'];
    $from_email_address = $account['customers_email_address'];
  }

    /**** BEGIN ARTICLE MANAGER ****/
  if ($valid_product) {
    $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_TELL_A_FRIEND, 'products_id=' . $HTTP_GET_VARS['products_id']));
    } else if ($valid_article) {
      $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_TELL_A_FRIEND, 'articles_id=' . $HTTP_GET_VARS['articles_id']));
      }
  /**** END ARTICLE MANAGER ****/


  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1><?php echo sprintf(HEADING_TITLE, $product_info['products_name']); ?></h1>

<?php
  if ($messageStack->size('friend') > 0) {
    echo $messageStack->output('friend');
  }
?>

<!-- body_text //-->
    <?php /**** BEGIN ARTICLE MANAGER ****/ ?>
    <td width="100%" valign="top">
    <?php
      // Modify form processing depending on whether product or article
      if ($valid_product) {
        echo tep_draw_form('email_friend', tep_href_link(FILENAME_TELL_A_FRIEND, 'action=process&products_id=' . $HTTP_GET_VARS['products_id']));
        } else if ($valid_article) {
          echo tep_draw_form('email_friend', tep_href_link(FILENAME_TELL_A_FRIEND, 'action=process&articles_id=' . $HTTP_GET_VARS['articles_id']));
      }
    ?><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading">
            <?php
              // Modify heading depending on whether product or article
              if ($valid_product) {
                 $title = $product_info['products_name'];
                 } else if ($valid_article) {
                   $title = $article_info['articles_name'];
              }
              echo sprintf(HEADING_TITLE, $title);
            ?>
             </td>
   <?php /**** END ARTICLE MANAGER ****/ ?>


<div class="contentContainer">
  <div>
    <span class="inputRequirement" style="float: right;"><?php echo FORM_REQUIRED_INFORMATION; ?></span>
    <h2><?php echo FORM_TITLE_CUSTOMER_DETAILS; ?></h2>
  </div>

  <div class="contentText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldKey"><?php echo FORM_FIELD_CUSTOMER_NAME; ?></td>
        <td class="fieldValue"><?php echo tep_draw_input_field('from_name'); ?></td>
      </tr>
      <tr>
        <td class="fieldKey"><?php echo FORM_FIELD_CUSTOMER_EMAIL; ?></td>
        <td class="fieldValue"><?php echo tep_draw_input_field('from_email_address'); ?></td>
      </tr>
    </table>
  </div>

  <h2><?php echo FORM_TITLE_FRIEND_DETAILS; ?></h2>

  <div class="contentText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldKey"><?php echo FORM_FIELD_FRIEND_NAME; ?></td>
        <td class="fieldValue"><?php echo tep_draw_input_field('to_name') . '&nbsp;<span class="inputRequirement">' . ENTRY_FIRST_NAME_TEXT . '</span>'; ?></td>
      </tr>
      <tr>
        <td class="fieldKey"><?php echo FORM_FIELD_FRIEND_EMAIL; ?></td>
        <td class="fieldValue"><?php echo tep_draw_input_field('to_email_address') . '&nbsp;<span class="inputRequirement">' . ENTRY_EMAIL_ADDRESS_TEXT . '</span>'; ?></td>
      </tr>
    </table>
  </div>

  <h2><?php echo FORM_TITLE_FRIEND_MESSAGE; ?></h2>

  <div class="contentText">
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
      <tr>
        <td class="fieldValue"><?php echo tep_draw_textarea_field('message', 'soft', 40, 8); ?></td>
      </tr>
    </table>
  </div>

  <div class="buttonSet">
    <span class="buttonAction"><?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'triangle-1-e', null, 'primary'); ?></span>

    <td><?php
                    /**** BEGIN ARTICLE MANAGER ****/
                    // Modify back button depending on whether product or article
                    if ($valid_product) {
                      echo '<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $HTTP_GET_VARS['products_id']) . '">' . tep_image_button('button_back.gif', IMAGE_BUTTON_BACK) . '</a>';
                      } else if ($valid_article) {
                        echo '<a href="' . tep_href_link(FILENAME_ARTICLE_INFO, 'articles_id=' . $HTTP_GET_VARS['articles_id']) . '">' . tep_image_button('button_back.gif', IMAGE_BUTTON_BACK) . '</a>';
                    }
                    /**** END ARTICLE MANAGER ****/
                       ?></td>

  </div>
</div>

</form>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
