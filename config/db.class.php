<?php
class Db
{
    protected static $connection;
    public function connect()
    {
        # code...
        if (!isset(self::$connection)) {
            # code...
            $config = parse_ini_file("config.ini");
            self::$connection = new mysqli("localhost", $config["username"], $config["password"], $config["databasename"]);
        }
        if (self::$connection == false) {
            # code...
            return false;
        }
        return self::$connection;
    }

    public function query_execute($queryString)
    {
        # code...
        $connection = $this->connect();
        
        $connection->query("SET NAMES utf8");
        $result = $connection->query($queryString);
        // $connection->close();
        return $result;
    }

    public function select_to_array($queryString)
    {
        # code...
        $rows = array();
        $result = $this->query_execute($queryString);
        if ($result == false) return false;

        while ($item = $result->fetch_assoc()) {
            # code...
            $rows[] = $item;
        }

        return $rows;
    }
}
