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

/* Start user session or output an error */
session_name('CCOUNT');
if (!session_start()) {
    error('Cannot start a new PHP session. Please contact server administrator or webmaster!');
}

/* If no action parameter is set let's force visitor to login */
if (empty($_REQUEST['action'])) {
    if (isset($_SESSION['logged']) && $_SESSION['logged'] == "Y") {
        pj_session_regenerate_id();
        mainpage();
    } else {
        login();
    }
} else {
    $action=htmlspecialchars($_REQUEST['action']);
}

/* Do the action that is set in $action variable */
if ($action == 'login') {
    checkpassword();
    $_SESSION['logged']='Y';
    pj_session_regenerate_id();
    mainpage();
} elseif ($action == 'save') {
    checklogin();
    savelink();
} elseif ($action == 'edit') {
    checklogin();
    editlink();
} elseif ($action == 'backup') {
    checklogin();
    sendbackup();
}  elseif ($action == 'remove') {
    checklogin();
    removelink();
} elseif ($action == 'reset') {
    checklogin();
    resetlink();
} elseif ($action == 'add') {
    checklogin();
    add();
} elseif ($action == 'restore') {
    checklogin();
    restore();
} elseif ($action == 'logout') {
    logout();
} else {
    login();
}
exit();

function savelink() {
global $settings;

$id=checkid();
$new_url=checkurl($_POST['url']);
$new_name = input($_POST['name']);
if (strlen($name)>40) {
    error('Your link name is too long! Please limit your name to maximum 40 chars!');
}
$new_count = input($_POST['count']);
if (preg_match("/\D/",$new_count)) {
    $new_count = 0;
}

$found=0;
$i=0;
$lines = file($settings['logfile']);

foreach ($lines as $thisline) {
    if (strpos($thisline, $id.'%%') === 0) {
        $thisline = trim($thisline);
        list($id,$added,$url,$count,$name) = explode('%%',$thisline);
        $lines[$i]=$id.'%%'.$added.'%%'.$new_url.'%%'.$new_count.'%%'.$new_name."\r\n";
        $found=1;
        break;
    }
    $i++;
}

if ($found != 1) {error('This ID doesn\'t exist!');}

$content = implode('', $lines);
$fp = @fopen($settings['logfile'],'w') or error('Can\'t write to log file! Please Change the file permissions (CHMOD to 666 on UNIX machines!)');
flock($fp, LOCK_EX);
fputs($fp,$content);
flock($fp, LOCK_UN);
fclose($fp);

mainpage('Changes to link ID '.$id.' have been saved!');
} // END savelink

function editlink() {
global $settings;

$id=checkid();

$found=0;
$i=0;
$lines = file($settings['logfile']);

foreach ($lines as $thisline) {
    if (strpos($thisline, $id.'%%') === 0) {
        $thisline = trim($thisline);
        list($id,$added,$url,$count,$name) = explode('%%',$thisline);
        $found=1;
        break;
    }
    $i++;
}

if ($found != 1) {error('This ID doesn\'t exist!');}

printHeader();
?>
<tr>
<td class="vmes">

<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td>
<p><a href="index.php?<?php echo mt_rand(1000,9999); ?>">Cancel / Go back</a> |
<a href="index.php?action=logout">LOGOUT</a></p>
</td>
</tr>
<tr>
<td><hr></td>
</tr>
</table>

<form action="index.php" method="POST">
<p><b>Editing link ID <?php echo $id; ?></b></p>

<p>Required fields are marked <b>bold</b>.</p>

<table border="0">
<tr>
<td>Clicks:<sup>1</sup></td>
<td><input type="text" name="count" value="<?php echo $count; ?>" size="6"></td>
</tr>
<tr>
<td>Link name:<sup>2</sup></td>
<td><input type="text" name="name" value="<?php echo $name; ?>" size="40" maxlength="40"></td>
</tr>
<tr>
<td><b>Link URL:</b><sup>3</sup></td>
<td><input type="text" name="url" value="<?php echo $url; ?>" size="50"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>

<table border="0">
<tr>
<td valign="top"><sup>1</sup></td>
<td>Set click count to a number of your choice. CCount will continue counting clicks
on this link from the new number.</td>
</tr>
<tr>
<td valign="top"><sup>2</sup></td>
<td>Link name is a unique name for this link (max 40 chars including spaces).
This name will be displayed as &quot;Web page&quot; in the statistics. If you don't choose a name the link
URL will be displayed.</td>
</tr>
<tr>
<td valign="top"><sup>3</sup></td>
<td>This is the URL to which your visitors will be redirected
after clicking the click tracking link (click.php?id=<?php echo $id; ?>).</td>
</tr>
</table>

<p><input type="hidden" name="id" value="<?php echo $id; ?>">
<input type="hidden" name="action" value="save"><input type="submit" value=" Save changes ">
| <a href="index.php?<?php echo mt_rand(1000,9999); ?>">Cancel / Go back</a></p>
</form>
<hr>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END editlink

function sendbackup() {
    global $settings;

    $name = 'ccount_backup_'.date(dmY).'.txt';

    /* Send the database file as an attachment */
    header ("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Length: ' . filesize($settings['logfile']));
    header('Content-Disposition: attachment; filename=' . $name);
    readfile($settings['logfile']);
    exit();
} // END sendbackup

function restore() {
global $settings;
$ext = strtolower(substr(strrchr($_FILES['backup']['name'], '.'), 1));
if ($ext != 'txt') {
    error('This doesn\'t seem to be the right backup file. CCount backup file should be named <b>'.$settings['logfile'].'</b>!');
}

if (!move_uploaded_file($_FILES['backup']['tmp_name'], $settings['logfile'])) {
    error('There has been an error uploading the backup file! Please make
    sure your log file ('.$settings['logfile'].') is writable by
    PHP scripts. On UNIX machines CHMOD it to 666 (rw-rw-rw-)!');
}

printHeader();
?>
<tr>
<td class="vmes"><p>&nbsp;</p>
<div align="center"><center>
<table width="400" cellpadding="3"> <tr>
<td align="center" class="head">Backup restored: <?php echo $_FILES['backup']['name']; ?></td>
</tr>
<tr>
<td class="dol">
<form>
<p>&nbsp;</p>
<p align="center"><b>Backup successfully restored!</b></p>
<p>Your backup has been successfully restored. If this was a valid CCount backup file your counter should work OK now!</p>
<p>&nbsp;</p>
<p align="center">
<a href="index.php">Click to continue</a></p>
<p>&nbsp;</p>
</td>
</tr> </table>
</div></center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END restore


function add() {
global $settings;

$url=checkurl($_POST['url']);
$name = input($_POST['name']);
if (strlen($name)>40) {
    error('Your link name is too long! Please limit your name to maximum 40 chars!');
}
$start_from = input($_POST['count']);
if (preg_match("/\D/",$start_from)) {
    $start_from = 0;
}

$previd = file_get_contents($settings['idfile']);
$previd = trim($previd);
$previd++;

$fp = @fopen($settings['idfile'],'w') or error('Can\'t write to the IDs file ('.$settings['idfile'].')! Make sure PHP scripts have permission to write to this file (CHMOD it to 666 on LINUX machines!)');
flock($fp, LOCK_EX);
fputs($fp,$previd);
flock($fp, LOCK_UN);
fclose($fp);

$addline = $previd . '%%' . date('Y/m/d') . '%%' . $url . '%%'. $start_from . '%%' . $name . "\r\n";

$fp = @fopen($settings['logfile'],'a') or error('Can\'t write to the log file ('.$settings['logfile'].')! Make sure PHP scripts have permission to write to this file (CHMOD it to 666 on LINUX machines!)');
flock($fp, LOCK_EX);
fputs($fp,$addline);
flock($fp, LOCK_UN);
fclose($fp);

printHeader();
?>
<tr>
<td class="vmes"><p>&nbsp;</p>
<div align="center"><center>
<table width="400" cellpadding="3"> <tr>
<td align="center" class="head">Link added</td>
</tr>
<tr>
<td class="dol">
<form>
<p>&nbsp;</p>
<p align="center"><b>New link successfully added!</b></p>
<p>A new link with ID <?php echo($previd); ?> has been successfully added.</p>
<p>To count clicks on this link use this URL:<br><br>
<b><?php echo("$settings[click_url]?id=$previd"); ?></b><br><br>
instead of the old one:<br><br>
<?php echo($url); ?></p>
<p>&nbsp;</p>
<p align="center">
<a href="index.php">
Click to continue</a></p>
<p>&nbsp;</p>
</td>
</tr> </table>
</div></center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END add

function resetlink() {
global $settings;

$id=checkid();

$found=0;
$i=0;
$lines = file($settings['logfile']);

foreach ($lines as $thisline) {
    if (strpos($thisline, $id.'%%') === 0) {
        $thisline = trim($thisline);
        list($id,$added,$url,$count,$name) = explode('%%',$thisline);
        $lines[$i]=$id.'%%'.$added.'%%'.$url.'%%0%%'.$name."\r\n";
        $found=1;
        break;
    }
    $i++;
}

if ($found != 1) {error('This ID doesn\'t exist!');}

$content = implode('', $lines);
$fp = @fopen($settings['logfile'],'w') or error('Can\'t write to log file! Please Change the file permissions (CHMOD to 666 on UNIX machines!)');
flock($fp, LOCK_EX);
fputs($fp,$content);
flock($fp, LOCK_UN);
fclose($fp);

mainpage('Link with ID '.$id.' was successfully reset to <b>0</b> clicks!');
} // END resetlink

function removelink() {
global $settings;

$id=checkid();

$found=0;
$i=0;
$lines = file($settings['logfile']);

foreach ($lines as $thisline) {
    if (strpos($thisline, $id.'%%') === 0) {
        unset($lines[$i]);
        $found=1;
        break;
    }
    $i++;
}

if ($found != 1) {error('This ID doesn\'t exist!');}

$content = implode('', $lines);
$fp = @fopen($settings['logfile'],'w') or error('Can\'t write to log file! Please Change the file permissions (CHMOD to 666 on UNIX machines!)');
flock($fp, LOCK_EX);
fputs($fp,$content);
flock($fp, LOCK_UN);
fclose($fp);

if ($found != 1) {
    error('This ID doesn\'t exist!');
}

mainpage('Link with ID '.$id.' was successfully removed!');
} // END removelink

function mainpage($notice='') {
global $settings;
printHeader();
?>
<tr>
<td class="vmes">

<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td>
<p><a href="#addlink">Add a new link</a> |
<a href="index.php?<?php echo mt_rand(1000,9999); ?>">Refresh stats</a> |
<a href="index.php?action=logout">LOGOUT</a></p>
</td>
</tr>
<tr>
<td><hr></td>
</tr>
</table>

<?php
if ($notice) {
    echo '<p align="center"><font color="#FF0000">'.$notice.'</font></p>';
}
?>

<p><b>Link statistics</b></p>
<?php
$lines = array();
$totalclicks = '';
$linewidth = '';
$maxclicks = 0;
$maxid = 0;
$noyet = 0;

$lines = file($settings['logfile']);
if (count($lines) == 0) {
    $noyet = 1;
}

if ($noyet == 1) {
    echo '<p>Not counting any links. Use the form below to add new links to be counted.</p>';
} else {
    $i=0;
    foreach ($lines as $thisline) {
        $thisline = trim($thisline);
        list($id,$added,$url,$count,$linkname)=explode('%%',$thisline);
        $totalclicks += $count;
        if($count > $maxclicks) {
            $maxclicks = $count;
            $maxid=$id;
        }
        $i++;
    }
    $average = $totalclicks/$i;
    $average = number_format($average, 1);

    echo '
    <table border="0" cellspacing="0" cellpadding="2">
    <tr>
    <td>Total links:</td>
    <td><b>'.$i.'</b></td>
    </tr>
    <tr>
    <td>Total clicks:</td>
    <td><b>'.$totalclicks.'</b></td>
    </tr>
    <tr>
    <td>Average clicks:</td>
    <td><b>'.$average.'</b></td>
    </tr>
    ';
    if ($maxclicks != 0) {
        echo '
        <tr>
        <td>Maximum clicks:</td>
        <td><b>'.$maxclicks.'</b> (link ID <b>'.$maxid.'</b>)</td>
        </tr>
        ';
    }
    echo '
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    </table>';
}

$maxlinewidth = 200;

if ($noyet == 0) {
    echo '
    <table border="0" cellpadding="3" cellspacing="0"><tr>
    <td align="center" valign="center" class="first">&nbsp;</td>
    <td align="center" valign="center" class="first"> <b>ID</b> </td>
    <td align="center" valign="center" class="second"> <b>Clicks</b> </td>
    <td align="center" valign="center" class="first"> <b>Added</b> </td>
    <td align="center" valign="center" class="second"> <b>Web page</b> </td>
    <td valign="center" class="first"> <b>Graph</b> </td>
    </tr>
    ';

    foreach ($lines as $thisline) {
        $thisline = trim($thisline);
        if (strlen($thisline) < 4) {
            continue;
        }

        list($id,$added,$url,$count,$linkname) = explode('%%',$thisline);

        if ($count == 0 || $maxclicks == 0) {
            $linewidth = 1;
        } else {
            $linewidth = round(($count * $maxlinewidth) / $maxclicks);
            if ($linewidth == 0) {
                $linewidth = 1;
            }
        }

        if (empty($linkname))
        {
            if (strlen($url) > 40)
            {
                $linkname = substr($url, 0, 20);
                $linkname .= '...';
                $linkname .= substr($url, -17);
            }
            else
            {
                $linkname=$url;
            }
        }

        echo '
        <tr>
        <td align="center" valign="center" class="first" nowrap><a href="index.php?action=remove&id='.$id.'" onclick="return doconfirm(\'Are you sure you want to remove link ID '.$id.'? This cannot be undone!\');"><img src="delete.gif" height="14" width="16" border="0" alt="Remove this link" style="vertical-align:text-bottom"></a>
        <a href="index.php?action=reset&id='.$id.'" onclick="return doconfirm(\'Are you sure you want to reset clicks for link ID '.$id.' to 0? This cannot be undone!\');"><img src="reset.gif" height="14" width="16" border="0" alt="Reset number of clicks to 0" style="vertical-align:text-bottom"></a>
        <a href="index.php?action=edit&id='.$id.'"><img src="edit.gif" height="14" width="16" border="0" alt="Edit this link" style="vertical-align:text-bottom"></a></td>
        <td align="center" valign="center" class="first"> '.$id.' </td>
        <td valign="center" class="second"> <b>'.$count.'</b> </td>
        <td align="center" valign="center" class="first"> '.$added.' </td>
        <td valign="center" class="second"> <a href="'.$url.'" target="_blank" class="link">'.$linkname.'</a> </td>
        <td valign="center" class="first"> <img src="line.gif" height="5" width="'.$linewidth.'" border="1" class="line"> </td>
        </tr>
        ';
    }

    echo '
    </table>

    <p><span class="tip">TIP:</span> For best performance you should remove links you don\'t use anymore. Button functions are explained below:</p>

    <p>
    <img src="delete.gif" height="14" width="16" border="0" style="vertical-align:text-bottom"> - delete link<br>
    <img src="reset.gif" height="14" width="16" border="0" style="vertical-align:text-bottom"> - reset number of clicks to 0<br>
    <img src="edit.gif" height="14" width="16" border="0" style="vertical-align:text-bottom"> - edit link
    </p>
    ';
}

?>
<hr>
<form action="index.php" method="POST">
<p><a name="#addlink"></a><b>Add a link</b></p>

<p>Use this form to add a new link to track clicks on. Required fields
are marked <b>bold</b>.<br>

<table border="0">
<tr>
<td>Start counting from:<sup>1</sup></td>
<td><input type="text" name="count" value="0" size="6"></td>
</tr>
<tr>
<td>Link name:<sup>2</sup></td>
<td><input type="text" name="name" size="40" maxlength="40"></td>
</tr>
<tr>
<td><b>Link URL:</b><sup>3</sup></td>
<td><input type="text" name="url" value="http://" size="50"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>

<table border="0">
<tr>
<td valign="top"><sup>1</sup></td>
<td>CCount will start counting clicks from the number you choose (default: start counting from 0).</td>
</tr>
<tr>
<td valign="top"><sup>2</sup></td>
<td>Link name is a unique name for this link (max 40 chars including spaces).
This name will be displayed as &quot;Web page&quot; in the statistics. If you don't choose a name the link
URL will be displayed.</td>
</tr>
<tr>
<td valign="top"><sup>3</sup></td>
<td>URL of the link you want to count clicks on.</td>
</tr>
</table>

<p><input type="hidden" name="action" value="add"><input type="submit" value=" Add link "></p>
</form>
<hr>
<p><b>Download backup</b></p>
<p>You may download a backup of the link database and restore it in the future
should your link file be corrupted for any reason.<br>
<a href="index.php?action=backup">Click to download backup</a></p>
<p><b>Restore backup</b></p>
<form action="index.php" method="POST" enctype="multipart/form-data">
<p><input type="hidden" name="action" value="restore">
Use this form to restore a previously downloaded backup file. This action cannot be undone!
Select your backup file:<br>
<input type="file" name="backup" size="30"></p>
<p><input type="submit" value="Click to restore this backup"></p>
</form>
<hr>
<p><b>Usage</b></p>
<p>To track clicks on a link, use this URL instead of the link original URL:<br>
<?php echo($settings['click_url']); ?>?id=<b>ID</b></p>
<p>Replace <b>ID</b> with the ID number of the URL, for example:<br>
<?php echo($settings['click_url']); ?>?id=13</p>
<hr>
<?php
eval(gzinflate(base64_decode('DdBHkqs4AADQ4/zuYoGxoAU19Re2ycYWMtCEzRQZbBBRpNPPvC
O8fImbr/KoSdHEc/6VxFP+w/+b5WmX5V9/5BRGn/aJLxcZHwyhYnuTqOxxMgzL18NojFpys9YixqJzJ0
5a3RGqMMgETgev7f1mXWo0AmxYP+KRX0Cpj5PQv8eHqbTDDtUlHU9jFsTVaCHBqM+jNfHykNYv2nNdDk
L3Pp/td4BrRtNxMBboDApOUX4UI4o/PiG1o4kdrLeDGVbR+aUaVZ0+e+6ChZnUV4UEhIAiqfFl+Ku9LN
F3+d9Qrz8hqswGJRhm3SqCVsP96tK+nSaLbLcTRdwM3iY1DZfZez18DdCYbxWQK1Chg6Di5Z2M3K0CR6
28eL9AnMeba4qPSIaYn41P3zL52WSeYXIxpxjUyFvSEmQ7oYLTyoRPygCgaOacrfbMNr2zmlv9xJZfDY
gZ93Sdd1W1NBrdQ3RTKNc9Osemrvd49uZwVTnHfo8nuPgKrpuPtGjNVW1oDC/9VBy3fPTbEfGay/oPjf
weePh/Dlc37qxBu2BVRmEJlp3HRHDelikE1/d7YBpXDx7csW0GeZIn9jxSp1IsVFEKz++g3UMoSAG3a6
VoacjIN9twpKupVP7dc4hnCfkIVEUwnE3cenM54cH+yeB93VJM1fg1jGzCYfMeo/7ZLmWJyKRMzfxYB1
5kpoQYfKHnke/z+kmL7aQUhCZlymsPZmD3csdH63ZpL8rnkLWVuxl2op6eF15Pc10T5fHcsDi/hZbadR
/qzewCBKZYoHhd//798/39/c9/')));
?>
<p><b>Rate this script</b></p>
<p>If you like this script please rate it or even write a review at:</p>
<p><a href="http://www.hotscripts.com/Detailed/36874.html" target="_new">Rate
this Script @ Hot Scripts</a></p>
<p><a href="http://php.resourceindex.com/rate?05375" target="_new">Rate
this Script @ The PHP Resource Index</a></p>
<hr>
<p><b>Stay updated</b></p>
<p>Join my FREE newsletter and you will be notified about new scripts, new
versions of the existing scripts and other important news from PHPJunkYard.<br>
<a href="http://www.phpjunkyard.com/newsletter.php"
target="_new">Click here for more info</a></p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END mainpage

function checkurl($url) {
    if (empty($url) || $url == 'http://' || $url == 'https://') {
        error('Please enter URL of the link you wish to add!');
    }
    if (strpos($url, '%%') !== false) {
        error('You cannot use %% in URLs!');
    }
    return $url;
} // END checkurl

function checkid() {
    $id = $_REQUEST['id'] or error('Please enter a link ID number!');
    if (preg_match("/\D/",$id)) {
        error('This is not a valid link ID, use numbers (0-9) only!');
    }
    return $id;
} // END checkid

function checklogin() {
    if (isset($_SESSION['logged']) && $_SESSION['logged'] == 'Y')
    {
        return true;
    }
    else
    {
        error('You are not authorized to view this page!');
    }
} // END checklogin

function checkpassword() {
global $settings;

    if(empty($_POST['pass']))
    {
        error('Please enter your admin password!');
    }
    else
    {
        $pass=htmlspecialchars($_POST['pass']);
    }

    if ($pass != $settings['apass'])
    {
        error('Wrong password!');
    }

} // END checkpassword

function logout() {
session_unset();
session_destroy();
global $settings;
printHeader();
?>
<tr>
<td class="vmes"><p>&nbsp;</p>
<div align="center"><center>
<table width="400"> <tr>
<td align="center" class="head">LOGGED OUT</td>
</tr>
<tr>
<td align="center" class="dol">
<p>&nbsp;</p>
<p><b>You have been successfully logged out.</b></p>
<p><a href="index.php">Click here to login again</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr> </table>
</div></center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END logout

function login() {
global $settings;
printHeader();
?>
<tr>
<td class="vmes"><p>&nbsp;</p>
<div align="center"><center>
<table width="400"> <tr>
<td align="center" class="head">Enter admin panel</td>
</tr>
<tr>
<td align="center" class="dol"><form method="POST" action="index.php"><p>&nbsp;<br><b>Please type in your admin password</b><br><br>
<input type="password" name="pass" size="20"><input type="hidden" name="action" value="login"></p>
<p><input type="submit" name="enter" value="Enter admin panel"></p>
</form>
</td>
</tr> </table>
</div></center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END login

function error($myproblem) {
global $settings;
printHeader();
?>
<tr>
<td class="vmes"><p>&nbsp;</p>
<div align="center"><center>
<table width="400">
<tr>
<td align="center" class="head">ERROR</td>
</tr>
<tr>
<td align="center" class="dol">
<p>&nbsp;</p>
<p><b>An error occured:</b></p>
<p><?php echo($myproblem); ?></p>
<p>&nbsp;</p>
<p><a href="index.php">Back to the previous page</a></p>
<p>&nbsp;</p>
</td>
</tr> </table>
</div></center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</td>
</tr>
<?php
printFooter();
exit();
} // END error

function input($in, $error = 0) {
    $in = trim($in);

    if ($error && strlen($in) == 0) {
        error($error);
    }

    return htmlspecialchars(stripslashes($in));
}

function printHeader() {
global $settings;
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel="STYLESHEET" type="text/css" href="style.css">
<title>PHP Click Counter admin panel</title>
<script language="Javascript" type="text/javascript"><!--
function doconfirm(message) {
    if (confirm(message)) {return true;}
    else {return false;}
}
//-->
</script>
</head>
<body marginheight="5" topmargin="5">
<div align="center"><center>
<table border="0" width="700" cellpadding="5">
<tr>
<td align="center" class="glava"><font class="header">PHP Click Counter <?php echo $settings['verzija']; ?><br>-- Admin panel --</font></td>
</tr>
<?php
}

function printFooter() {
global $settings;
eval(gzinflate(base64_decode('DdFHkqNIAADA50x3cEAUhYuNOeCdQHgQlw1MgfAIJ9Drd/MLiY
6s/6m/zVj12YZ+8mxFNPy3RMVUop8/Uqlo3byZPC+5kGyGWBDz8I6xruoHgqIHaLeaGkoxL5oIP7YSRl
Fujx8igtWiV1uYkAOIpC+50ZdZEj2HR/qd98nWoKLezmu55RF1mCPojMeZm9E9Iy4z0pataIUiXYEcib
GoDrzl58v+Zizp4cXustCykYz+JydtEvKtbmGY8HyQ5PF844YWdx40QZrOQ8s38ZnN1xbuE7c2IQZIjX
RR5LyMSzLwMBAR3AqDwO6A2NTJEY7QWtXp0mS2NGLdfdVDbT9krBvlODaagDLL3divQz9mYWfm1rhVB0
XKnPgCiKrh5Pi8Btb5rln3TflWtALNmYnpc70eVgTynezJSokKYhEsx0m9J7Xm7rkpYIfPnIZNdA86xR
380+cTA2zgNcrkjGOdX14dvlpC6RVXFbZqc2Dw/PQNEvzci5jq1L30/bHf9xMqI3ozNRezcTw0h+DDZ0
BTPKBSUlUXXFTU8DnLZ5QVQ6FndCjw7CxrFIjsqRNwbM9GRMpb++Gvzfnutxe7KbdHIr/7AUGEpJv+ZV
8faIB6NCBHi1OzsdZpnKV4BkNUcLFXtm5+++bPfqwYUqwDR9hR+X8vz9mXdb2tPU2z8fUdTWYa/WFKqq
XIN8vJFUJKOXYaaPMcQElb4CtmH/pChIfJ9CRxXS/F9JVkNICP0y9mjeBHLdvzxEkl4bEaBrA3u17AzA
6KyMg0oe5OLba6/byYqxmdyiovSKAtvL2ofaqEt4rJsM882WXoeYlUC7MUJ7GmsF0YwXk24a4xSLqnid
hctyxAo+vTExZbA6MLMqapetOMHcRCe0nsTCeDhEXnQ6aBXZZXbkhSza164sa06BnmhTsHuWD4weA4Jn
z+/v3z+/v7z38=')));
}

function pj_session_regenerate_id() {

    if (version_compare(phpversion(),"4.3.3",">=")) {
       session_regenerate_id();
    } else {
        $randlen = 32;
        $randval = '0123456789abcdefghijklmnopqrstuvwxyz';
        $random = '';
        $randval_len = 35;
        for ($i = 1; $i <= $randlen; $i++) {
            $random .= substr($randval, rand(0,$randval_len), 1);
        }

        if (session_id($random)) {
            setcookie(
                session_name('CCOUNT'),
                $random,
                ini_get("session.cookie_lifetime"),
                "/"
            );
            return true;
        } else {
            return false;
        }
    }

}
?>
