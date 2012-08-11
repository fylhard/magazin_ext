<?php
$FunctionList = array();
 
// {fetch('detal','parts', hash())}
$FunctionList['parts'] = array( 'name' => 'parts',
                     'operation_types' => array( 'read' ),
                     'call_method' => array( 'class' => 'eZPartFunctionCollection',
                                             'method' => 'fetchPartsList' ),
                     'parameter_type' => 'standard',
                     'parameters' => array()
               );
 
?>
