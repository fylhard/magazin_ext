<?php

class eZPartFunctionCollection
{
    public static function fetchPartsList()
    {
        try {
            $class_id = array();
            $config = eZINI::instance('magazin.ini');
            $class_id[] = $config->variable('detal_class','class_id');
            $dataArray = array();
            $db = DBHelper::getConnection();
            $sql = "SELECT DISTINCT name FROM ezcontentobject WHERE contentclass_id = ? ORDER BY name ASC";
            $res = $db->prepare($sql);
            $res->execute($class_id);
            $dataArray = $res->fetchAll(PDO::FETCH_ASSOC);
            
            return array('result' => $dataArray);
            
        } catch (PDOException $e) {
           echo $e->getMessage();
           eZDebug::writeError( $errMsg );
           return array( 'error' => $errMsg );
        }
    }
  
}
