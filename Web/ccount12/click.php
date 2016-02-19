<?php
/*******************************************************************************
*  Title: PHP click counter (CCount)
*  Version: 1.2 @ October 29, 2007
*  Author: Klemen Stirn
*  Website: http://www.phpjunkyard.com
********************************************************************************
*  COPYRIGHT NOTICE
*  Copyright 2004-2007 Klemen Stirn. All Rights Reserved.
*
*  This script may be used and modified free of charge by anyone
*  AS LONG AS COPYRIGHT NOTICES AND ALL THE COMMENTS REMAIN INTACT.
*  By using this code you agree to indemnify Klemen Stirn from any
*  liability that might arise from it's use.
*
*  Selling the code for this program, in part or full, without prior
*  written consent is expressly forbidden.
*
*  Obtain permission before redistributing this software over the Internet
*  or in any other medium. In all cases copyright and header must remain
*  intact. This Copyright is in full effect in any country that has
*  International Trade Agreements with the United States of America or
*  with the European Union.
*
*  Removing any of the copyright notices without purchasing a license
*  is illegal! To remove PHPJunkyard copyright notice you must purchase a
*  license for this script. For more information on how to obtain a license
*  please visit the site below:
*  http://www.phpjunkyard.com/copyright-removal.php
*******************************************************************************/

error_reporting(E_ALL ^ E_NOTICE);
define('IN_SCRIPT',1);

/* Get settings from the settings.php file */
require 'settings.php';

/* First check if the ID is set and if it is valid */
$id = $_GET['id'];
if (empty($id) || preg_match("/\D/",$id)) {die('Invalid ID, numbers (0-9) only!');}

/* Get lines from file */
$lines = file($settings['logfile']);

/* Let's found the line that starts with our ID number */
$found = 0;
$i = 0;
foreach ($lines as $thisline) {
    if (strpos($thisline, $id.'%%') === 0) {
        /* We found the line, now we get URL and count from the line */
        $thisline = trim($thisline);
        list($id,$added,$url,$count,$name) = explode('%%',$thisline);
        /* Increase count by 1 and update this line */
        $count = $count + 1;
        $lines[$i]=$id.'%%'.$added.'%%'.$url.'%%'.$count.'%%'.$name."\r\n";
        $found=1;
        break;
    }
    /* This line didn't start with our ID, lets go to the next one */
    $i++;
}
if ($found != 1) {die('This ID doesn\'t exist!');}

if ($settings['count_unique']==0 || $_COOKIE['ccount_unique']!=$id) {
    /* Rewrite the log file with the updated line */
    $content = implode('', $lines);
    $fp = fopen($settings['logfile'],'w') or die('Can\'t write to log file! Please Change the file permissions (CHMOD to 666 on UNIX machines!)');
    flock($fp, LOCK_EX);
    fputs($fp,$content);
    flock($fp, LOCK_UN);
    fclose($fp);

    /* Print the Cookie and P3P compact privacy policy */
    header('P3P: CP="NOI NID"');
    setcookie('ccount_unique', $id, time()+60*60*$settings['unique_hours']);
}

/* Redirect to the link URL */
Header('Location: '.$url);
exit();
?>
