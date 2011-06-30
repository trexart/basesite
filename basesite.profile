<?php

/**
* @file
*   This file contains an example Drupal 6 Install Profile. It is based on the default installation profile and comments
*   found at drupal.org/node/67921.
*/

/**
* Return an array of the modules to be enabled when this profile is installed.
*
* @return
*   An array of modules to enable.
*/
function basesite_profile_modules() {
  $modules = array(
       // Drupal core
      'block',
      'comment',
      'contact',
      'dblog',
      'filter',
      'help',
      'menu',
      'node',
      'search',
      'system', 
      'taxonomy',
      'upload',
      'user',
      // Admin
      'admin', 'admin_tools',
      // Boxes
      'boxes',
      // Content
      'content', 'optionwidgets', 'text',
      // CTools
      'ctools',
      // Context
      'context', 'context_ui', 'context_layouts',
      // Date
      'date_api', 'date_timezone', 'date', 'date_popup',
      // External Link
      'extlink',
      // Features
      'features',
      // Jquery
      'jquery_ui', 'jquery_update', 
      // Libraries
      'libraries',
      // Google Analytics
      'googleanalytics',
      // Poormanscron
      'poormanscron',
      // Strongarm
      'strongarm',
      // Token
      'token',
      // Transliteration
      'transliteration',
      // Views
      'views', 'views_ui',
      // Vertical Tabs
      'vertical_tabs',
    );
    return $modules;
}

/**
* Return a description of the profile for the initial installation screen.
*
* @return
*   An array with keys 'name' and 'description' describing this profile,
*   and optional 'language' to override the language selection for
*   language-specific profiles.
*/
function basesite_profile_details() {
  return array(
    'name' => 'Basic site profile',
    'description' => 'Select this profile to create a base site to develop on.'
  );
}

/**
* Return a list of tasks that this profile supports.
*
* @return
*   A keyed array of tasks the profile will perform during
*   the final stage. The keys of the array will be used internally,
*   while the values will be displayed to the user in the installer
*   task list.
*/
function basesite_profile_task_list() {
}

/**
* Perform any final installation tasks for this profile.
*
* @param $task
*   The current $task of the install system. When hook_profile_tasks()
*   is first called, this is 'profile'.
* @param $url
*   Complete URL to be used for a link or form action on a custom page,
*   if providing any, to allow the user to proceed with the installation.
*
* @return
*   An optional HTML string to display to the user. Only used if you
*   modify the $task, otherwise discarded.
*/

function basesite_profile_tasks(&$task, $url) {

  // Insert default user-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em> is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status', 'revision'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  // Don't display date and author information for page nodes by default.
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);

  // Set the preferred theme.
  $themes = system_theme_data();
  $preferred_themes = array('cube', 'rubik');
  foreach ($preferred_themes as $theme) {
    if (array_key_exists($theme, $themes)) {
      system_initialize_theme_blocks($theme);
      db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = ('%s')", $theme);
      variable_set('theme_default', $theme);
      break;
    }
  }

  // Default input filter allowed HTML tags.
  variable_set('allowed_html_1', '<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd> <ins> <del> <p> <br> <h3> <h4>');

  // Set timezone for date_timezone.module.
  variable_set('date_default_timezone', 36000);
  variable_set('date_default_timezone_name', 'Australia/Sydney');
  variable_set('date_first_day', '1');
  
  // set date formats
  variable_set('date_format_long', 'l, j F Y - g:ia');
  variable_set('date_format_medium', 'D, d/m/Y - g:ia');
  variable_set('date_format_short', 'd/m/Y - g:ia');
  
  // set date popup value
  variable_set('date_popup_css_file', 'sites/all/modules/contrib/jquery_ui/jquery.ui/themes/default/ui.datepicker.css');
  
  // Set site name for anonymous user
  variable_set('anonymous', 'Guest');

  // Set site_footer value.
  variable_set('site_footer', st('&copy; Copyright 2011 by Base Site. All rights reserved.'));

  // Configure access log for statistics module.
  variable_set('statistics_count_content_views', '0');
  variable_set('statistics_enable_access_log', '1');
  variable_set('statistics_flush_accesslog_timer', '2419200');

  // Configure user settings. Set user creation to administrator only.
  variable_set('user_register', '0');
  
  // set default temp folder
  variable_set('file_directory_temp', 'sites/default/tmp');

  // Create custom roles and set initial permissions.

  /*$role = array('name' => 'editor');
  drupal_write_record('role', $role);
  $role = array('name' => 'ninja');
  drupal_write_record('role', $role);

  db_query("UPDATE {permission} SET perm = 'access content, search content, view uploaded files' WHERE rid = 1");
  db_query("UPDATE {permission} SET perm = 'view advanced help index, view advanced help popup, view advanced help topic, access content, search content, use advanced search, upload files, view uploaded files, access user profiles' WHERE rid = 2");
  db_query("INSERT INTO {permission} (rid, perm, tid) VALUES(3, 'upload files', 0)");
  db_query("INSERT INTO {permission} (rid, perm, tid) VALUES(4, 'perform backup, administer blocks, administer menu, administer nodes, create url aliases, access statistics, access administration pages, access site reports, upload files', 0)");*/

  // Create Home Page.

  $node = new StdClass();
  $node->type = 'page';
  $node->status = 1;
  $node->promote = 0;
  $node->uid = 1;
  $node->name = 'admin';
  $node->path = 'home';
  $node->title = 'Welcome';
  $node->body = st('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.');
  node_save($node);

  variable_set('site_frontpage', 'node/1');

  // Update the menu router information.
  menu_rebuild();

  // Run cron for the first time.
  drupal_cron_run();

}

/**
* Implementation of hook_form_alter().
*
* Allows the profile to alter the site-configuration form. This is
* called through custom invocation, so $form_state is not populated.
*/
function basesite_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
    $form['site_information']['site_mail']['#default_value'] = 'noreply@example.com';
    $form['admin_account']['account']['name']['#default_value'] = 'admin';
    $form['admin_account']['account']['mail']['#default_value'] = 'drupal@example.com';
  }
}
?>