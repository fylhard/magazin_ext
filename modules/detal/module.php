<?php
// Introduction in the development of eZ Publish extensions
 
$Module = array( 'name' => 'detal' );
$ViewList = array();
 
// new View list with 2 fixed parameters and
// 2 parameters in order
// http://.../modul1/list/ $Params['ParamOne'] /
// $Params['ParamTwo']/ param4/$Params['4Param'] /param3/$Params['3Param']
 
$ViewList['search'] = array( 'script' => 'search.php',
		             'functions' => array( 'read' ),
		             'unordered_params' => array( 'offset' => 'Offset' ));

$FunctionList = array(); 
$FunctionList['read'] = array();
?>
