<?php

class DBHelper{
    
    private static $db = null;
       
    private function __construct()
    {
        
    }
    
    public static function getConnection()
    {
        if (self::$db == null) {
            try {
                $configDBIni = eZINI::instance('magazin.ini');
                $configDBArray = $configDBIni->variableMulti('configDB', array('dbname','host','username','password'));
                $dbname = $configDBArray['0'];
                $host = $configDBArray['1'];
                $username = $configDBArray['2'];
                $password = $configDBArray['3'];
                self::$db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
                self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            } catch (PDOException $e) {
                $errMsg = $e->getMessage();
                eZDebug::writeError( $errMsg );
                return array( 'error' => $errMsg );
            } 
        }
        
        return self::$db;
    }
    
    public function __destruct()
    {
        self::$db = null;
    }
    
}