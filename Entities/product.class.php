<?php // IDEA:
require_once("./config/db.class.php");



class Product
{
    public $productID;
    public $productName;
    public $cateID;
    public $price;
    public $quantity;
    public $description;
    public $picture;

    public function __construct($pro_name, $cate_id, $price, $quantity, $desc, $picture)
    {

        $this->productName = $pro_name;
        $this->cateID = $cate_id;
        $this->price = $price;
        $this->quantity = $quantity;
        $this->description = $desc;
        $this->picture = $picture;
    }

    public function save()
    {
        $file_temp = $this->picture['tmp_name'];
        $user_file = $this->picture['name'];
        $timestamp = date("Y") . date("m") . date("d") . date("h") . date("i") . date("s");
        $filepath = "uploads/" . $timestamp . $user_file;
        if (move_uploaded_file($file_temp, $filepath) == false) {
            return false;
        }
        //end upload file
        $db = new Db();

        $sql = "INSERT INTO Product (ProductName, CateID, Price, Quantity, Description, Picture) VALUES 
        ('$this->productName','$this->cateID','$this->price','$this->quantity','$this->description','$filepath')";

        $result = $db->query_execute($sql);
        return $result;
    }

    public static function list_product()
    {
        # code...
        $db = new Db();
        $sql = "SELECT * FROM product";
        $result = $db->select_to_array($sql);
        return $result;
    }
    public static function list_product_by_cateid($cateid)
    {
        # code...
        $db = new Db();
        $sql = "SELECT * FROM product WHERE CateID='$cateid'";
        $result = $db->select_to_array($sql);
        return $result;
    }

    public static function list_product_relate($cateid, $id)
    {
        # code...
        $db = new Db();
        $sql = "SELECT * FROM product WHERE CateID='$cateid' productID!='$id'";
        $result = $db->select_to_array($sql);
        return $result;
    }

    public static function get_product($id)
    {
        $db = new Db();
        $sql = "SELECT * from product where productID='$id'";
        $result = $db->select_to_array($sql);
        return $result;
    }

    public function edit_product($id)
    {
        $file_temp = $this->picture['tmp_name'];
        $user_file = $this->picture['name'];
        $timestamp = date("Y") . date("m") . date("h") . date("i") . date("s");
        $filepath = "images/" . $timestamp . $user_file;
        if (move_uploaded_file($file_temp, $filepath) == false) {
            return false;
        }
        $db = new Db();
        $sql = "UPDATE product SET ProductName='$this->productName',CateID='$this->cateID',Price='$this->price',Quantity='$this->quantity',Description='$this->description',Picture='$filepath' WHERE ProductID='$id'";
        $result = $db->query_execute($sql);
        if ($result == false) return false;
        return true;
    }

    public static function delect_product($id)
    {
        $db = new Db();
        $sql = "DELETE FROM product WHERE ProductID='$id'";
        $result = $db->query_execute($sql);
        if ($result == false) return false;
        return true;
    }
}
