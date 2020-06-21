<?php
require_once("./entities/product.class.php");
?>
<?php
$id = -1;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
}
include_once("header.php");
$prods = Product::get_product($id);
if (isset($_POST["btnsubmit"])) {
    $productID = $_POST["id"];
    $productName = $_POST["txtName"];
    $cateID = $_POST["txtCateID"];
    $price = $_POST["txtprice"];
    $quantity = $_POST["txtquantity"];
    $description = $_POST["txtdesc"];
    $picture = $_FILES["txtpic"];
    $newProduct = new Product($productName, $cateID, $price, $quantity, $description, $picture);
    $result = $newProduct->edit_product($productID);
    if (!$result) {
        header("Location:edit_product.php?id=$id");
        
    } else {
        header("Location:manager_product.php");
    }
}
?>
<?php
if (isset($_GET["failure"])) {
    echo '<script language="javascript">';
    echo 'alert("Cập nhật thất bại")';
    echo '</script>';
}
?>
<div class="container">
    <div class="col-sm-9 panel panel-info">
        <h3 class="panel-heading text-center">Cập nhật thông tin</h3>
        <?php
        foreach ($prods as $item) {
        ?>
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="hidden" class="form-control" name="id" value="<?php echo $item["ProductID"];
                                                                                echo isset($_POST["id"]) ? $_POST["id"] : ""; ?>" />
                </div>
                <div class="form-group">
                    <label>Tên sản phẩm</label>
                    <input type="text" class="form-control" name="txtName" value="<?php echo $item["ProductName"];
                                                                                    echo isset($_POST["txtName"]) ? $_POST["txtName"] : ""; ?>" />
                </div>
                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea class="form-control" name="txtdesc" cols="21" rows="10" value=""><?php echo $item["Description"];
                                                                                                echo isset($_POST["txtdesc"]) ? $_POST["txtdesc"] : ""; ?></textarea>
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col">
                            <label>Số lượng</label>
                            <input class="form-control" type="number" name="txtquantity" value="<?php echo $item["Quantity"];
                                                                                                echo isset($_POST["txtquantity"]) ? $_POST["txtquantity"] : ""; ?>" />
                        </div>
                        <div class="col">
                            <label>Giá</label>
                            <input class="form-control" type="number" name="txtprice" value="<?php echo $item["Price"];
                                                                                                echo isset($_POST["txtprice"]) ? $_POST["txtprice"] : ""; ?>" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Loại sản phẩm</label>
                    <select class="form-control" type="number" name="txtCateID" value="<?php echo $item["CateID"];
                                                                                        echo isset($_POST["txtCateID"]) ? $_POST["txtCateID"] : ""; ?>">
                        <?php
                        require_once("./config/db.class.php");
                        $db = new Db();
                        $sql = "SELECT * from category";
                        $result = $db->select_to_array($sql);
                        foreach ($result as $catogory) {
                        ?>
                            <?php if ($catogory['CateID'] == $item["CateID"]) { ?>
                                <option selected value="<?php echo ($catogory['CateID']) ?>">
                                    <?php echo ($catogory['CategoryName']) ?>
                                </option>
                            <?php
                            } else { ?>
                                <option value="<?php echo ($catogory['CateID']) ?>">
                                    <?php echo ($catogory['CategoryName']) ?>
                                </option>
                        <?php
                            }
                        }
                        ?>
                    </select>
                </div>
                <div class="form-group">
                    <label>Hình ảnh</label>
                    <img src="<?php echo $item["Picture"]; ?>" classs="img-responsive" alt="<?php echo $item["ProductName"]; ?>" style="width:100px">
                    <input class="form-control" type="file" accept="image/png, image/jpeg" name="txtpic" value="<?php echo $item["Picture"];
                                                                                                                echo isset($_POST["txtpic"]) ? $_POST["txtpic"] : ""; ?>" />
                </div>
                <div class="form-group text-center">
                    <input class="btn btn-success" type="submit" name="btnsubmit" value="Sửa sản phẩm">
                </div>
            </form>
        <?php } ?>
    </div>
</div>
<?php include_once("footer.php"); ?>