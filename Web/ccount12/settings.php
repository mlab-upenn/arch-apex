<?php
/*** SETUP YOUR CLICK COUNTER ***/
/* Detailed information can be found in the readme file */

/* Password for admin area */
$settings['apass']='mlab4ever';

/* URL of the click.php file */
$settings['click_url']='https://mlab.seas.upenn.edu/mlep/ccount12/click.php';

/* Count UNIQUE clicks ONLY? 1 = YES, 0 = NO   */
$settings['count_unique']=1;

/* Number of hours a visitor is considered as "unique" */
$settings['unique_hours']=24;

/*** OPTIONAL SETTINGS BELOW ***/

/* Name of the log file */
$settings['logfile']='clicks.txt';

/* Name of the file where last ID number is stored */
$settings['idfile']='ids.txt';

/*****************************
* DO NOT EDIT BELOW THIS LINE
*/
if (!defined('IN_SCRIPT')) {die('Invalid attempt!');}
$settings['verzija']='1.2';
?>
