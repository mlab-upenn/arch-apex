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

echo "var ccount_link = new Array();\n";

$lines = file($settings['logfile']);

foreach ($lines as $thisline) {
    $thisline = trim($thisline);
    list($id,$added,$url,$count,$linkname)=explode('%%',$thisline);
    echo "ccount_link[$id]=$count;\n";
}

echo '
function ccount_display(id) {
    document.write(ccount_link[id]);
}
';

exit();
?>
