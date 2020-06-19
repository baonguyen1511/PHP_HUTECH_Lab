<?php require_once("./entities/product.class.php"); ?>
<?php
include_once("header.php");
$prods = Product::list_product();
?>

<?php include_once("header.php") ?>
<div style="overflow-x:auto;">
  <table class="product">
    <tr>
      <th>ID</th>
      <th class="image">Hình ảnh</th>
      <th class="name">Tên</th>
      <th>Loại</th>
      <th>Giá</th>
      <th>Số lượng</th>
      <th class="descript">Mô tả</th>
      <th></th>
    </tr>
    <?php
    foreach ($prods as $item) {
    ?>
      <tr>
        <td><?php echo $item["ProductID"]; ?></td>
        <td><img src="<?php echo $item["Picture"]; ?>" classs="img-responsive" alt="<?php echo $item["ProductName"]; ?>" style="width:100px"></td>
        <td><?php echo $item["ProductName"]; ?></td>
        <td><?php echo $item["CateID"]; ?></td>
        <td><?php echo $item["Price"]; ?></td>
        <td><?php echo $item["Quantity"]; ?></td>
        <td>
          <p><?php echo substr($item["Description"], 0, 120) . "..."; ?></p>
        </td>
        <td>
          <a class="navbar-brand" href="<?php echo "./edit_product.php?id=" . $item["ProductID"]; ?>">Sửa</a>
          <a class="navbar-brand" href="delete.php?ProductID=<?php echo $item['ProductID']; ?>">Xóa</a>
        </td>
      </tr>
    <?php } ?>
  </table>
</div>
<?php include_once("footer.php"); ?>