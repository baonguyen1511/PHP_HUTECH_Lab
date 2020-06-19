<?php
require_once("./entities/product.class.php");
require_once("./entities/category.class.php");
?>
<?php
include_once("header.php");
if (!isset($_GET["cateid"])) {
    $prods = Product::list_product();
} else {
    $cateid = $_GET["cateid"];
    $prods = Product::list_product_by_cateid($cateid);
}
$cates = Category::list_category();
?>
<?php
if (isset($_GET["inserted"])) {
    echo '<script language="javascript">';
    echo 'alert("Thêm sản phẩm thành công")';
    echo '</script>';
}
?>
<div class="container text-center">
    <div class="col-sm-3">
        <h3>Danh mục</h3>
        <ul class="list-group">
            <?php
            foreach ($cates as $item) {
                echo "<li class='list-group-item'><a href=./list_product.php?cateid=" . $item["CateID"] . ">" . $item["CategoryName"] . "</a></li>";
            }
            ?>
        </ul>
    </div>
    <div class="col-sm-9">
        < <h3>Danh sách tất cả sản phẩm</h3></br>
            <div class="row">
                <?php
                foreach ($prods as $item) {
                ?>
                    <div class="col-sm-4">
                        <img src="<?php echo "" . $item["Picture"]; ?>" class="img-responsive" style="width:100%" alt="Image">
                        <p class="text-danger"><?php echo $item["ProductName"]; ?></p>
                        <p class="text-info"><span class="hisprice"><?php echo $item["Price"]; ?></span></p>
                    </div>
                <?php } ?>
            </div>
    </div>
</div>
<?php include_once("footer.php"); ?>