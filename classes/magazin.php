<?php

class magazin
{
    public static function search($parentNodeID)
    {
        try {
            $db = DBHelper::getConnection();
            $http = eZHTTPTool::instance();
            if ( $http->hasPostVariable( 'param1' ) )
            {
                $parentNodeID = $http->postVariable( 'param1' );
                $sql = "SELECT DISTINCT name FROM ezcontentobject, ezcontentobject_tree WHERE contentclass_id = ? AND parent_node_id = ? AND ezcontentobject.id = ezcontentobject_tree.contentobject_id ORDER BY name ASC";
                $res = $db->prepare($sql);
                $res->execute(array('51',$parentNodeID));
                $dataArray = $res->fetchAll(PDO::FETCH_ASSOC);
                return $dataArray;
            }
            
        } catch (PDOException $e) {
           echo $e->getMessage();
           eZDebug::writeError( $errMsg );
           return array( 'error' => $errMsg );
        }
        
    }
}
