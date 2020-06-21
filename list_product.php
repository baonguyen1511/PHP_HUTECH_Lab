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
    <div class="col-sm-3 panel panel-danger">
        <h3 class="panel-heading">Danh mục</h3>
        <ul class="list-group">
            <?php
            foreach ($cates as $item) {
                echo "<li class='list-group-item'><a href=./list_product.php?cateid=" . $item["CateID"] . ">" . $item["CategoryName"] . "</a></li>";
            }
            ?>
        </ul>
    </div>
    <div class="col-sm-9 panel panel-info">
        <h3 class="panel-heading">Danh sách tất cả sản phẩm</h3>
        <div style="overflow-x:auto;">
            <table class="product">
                <tr>
                    <th>MSP</th>
                    <th class="image">Hình ảnh</th>
                    <th class="name">Tên</th>
                    <th>Loại</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th class="descript">Mô tả</th>
                    <th></th>
                    <th></th>
                </tr>
                <?php
                foreach ($prods as $item) {
                ?>
                    <tr>
                        <td><?php echo $item["ProductID"]; ?></td>
                        <td><a href="./product_detail.php?id=<?php echo $item["ProductID"]; ?>"><img src="<?php echo $item["Picture"]; ?>" classs="img-responsive" alt="<?php echo $item["ProductName"]; ?>" style="width:100px"></a></td>
                        <td><a href="./product_detail.php?id=<?php echo $item["ProductID"]; ?>"><?php echo $item["ProductName"]; ?></a></td>
                        <td><?php echo $item["CateID"]; ?></td>
                        <td><?php echo $item["Price"]; ?></td>
                        <td><?php echo $item["Quantity"]; ?></td>
                        <td>
                            <p><?php echo substr($item["Description"], 0, 120) . "..."; ?></p>
                        </td>
                        <td>
                            <a role=" button" class="btn btn-success" href="<?php echo "./edit_product.php?id=" . $item["ProductID"]; ?>">Sửa</a>

                        </td>
                        <td>
                            <a role="button" class="btn btn-danger" href="delete.php?ProductID=<?php echo $item['ProductID']; ?>">Xóa</a>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    </div>
</div>
<?php include_once("footer.php"); ?>