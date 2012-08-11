<?php

$tpl = eZTemplate::factory();

if (!empty($_GET)) {
    $searchData = $_GET;
    $searchString = implode(" ", $searchData);
} elseif (!empty($_POST)) {
    $searchData = $_POST;
    $searchString = implode(" ", $searchData);
}
eZDebug::writeDebug($searchData);
eZDebug::writeDebug($searchString);

$Offset = $Params['Offset'];

$tpl->setVariable( 'getString', http_build_query($searchData));
$tpl->setVariable( 'searchData', $searchData );
$tpl->setVariable( 'searchString', $searchString );
$tpl->setVariable( 'offset', $Offset );

$Result['content'] = $tpl->fetch( 'design:detal/search.tpl' );