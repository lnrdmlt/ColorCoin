<?php

header('Content-type: image/svg+xml');

$h = 0;
$s = 50;
$l = 50;

if (is_numeric($_GET['h'])) {
    $h = $_GET['h'];
}

if (is_numeric($_GET['s'])) {
    $s = $_GET['s'];
}

if (is_numeric($_GET['l'])) {
    $l = $_GET['l'];
}

?>

<svg width="400" height="400" xmlns="http://www.w3.org/2000/svg">
    <rect width="400" height="400" fill="hsl(<? echo $h ?>,<? echo $s ?>%,<? echo $l ?>%)" />
</svg>