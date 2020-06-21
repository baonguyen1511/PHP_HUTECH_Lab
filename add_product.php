<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Tech shop | Thêm sản phẩm</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
    -->
    <link rel="stylesheet" href="css/custom.css">
</head>

<body>
    <?php
    require_once("./entities/product.class.php");
    require_once("./entities/category.class.php");

    if (isset($_POST["btnsubmit"])) {
        # code...
        $productName = $_POST["txtName"];
        $cateID = $_POST["txtCateID"];
        $price = $_POST["txtprice"];
        $quantity = $_POST["txtquantity"];
        $description = $_POST["txtdesc"];
        $picture = $_FILES["txtpic"];

        $newProduct = new Product($productName, $cateID, $price, $quantity, $description, $picture);

        $result = $newProduct->save();
        if (!$result) {
            header("Location: add_product.php?failure");
        } else {
            // header("Location: list_product.php?inserted");
            header("Location: add_product.php?inserted");
        }
    }
    if (!isset($_GET["cateid"])) {
        $prods = Product::list_product();
    } else {
        $cateid = $_GET["cateid"];
        $prods = Product::list_product_by_cateid($cateid);
    }
    $cates = Category::list_category();
    ?>
    <?php
    if (isset($_GET["failure"])) {
        echo '<script language="javascript">';
        echo 'alert("Thêm sản phẩm thất bại")';
        echo '</script>';
    }
    if (isset($_GET["inserted"])) {
        echo '<script language="javascript">';
        echo 'alert("Thêm sản phẩm thành công")';
        echo '</script>';
    }
    ?>
    <nav class="navbar navbar-expand-xl">
        <div class="container h-100">
            <div id="preloader-active">
                <div class="preloader d-flex align-items-center justify-content-center">
                    <div class="preloader-inner position-relative">
                        <div class="preloader-circle"></div>
                        <div class="preloader-img pere-text">
                            <a href="home.php"><br>
                                <img src="assets/img/logo/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div><br>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto h-100">
                    <li class="nav-item">
                        <a class="nav-link" href="list_product.php"> Danh sách sản phẩm
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="add_product.php">Thêm sản phẩm
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title d-inline-block">THÊM SẢN PHẨM</h2>
                        </div>
                    </div>
                    <div class="row tm-edit-product-row">
                        <div class="col-xl-6 col-lg-6 col-md-12">


                            <form class="tm-edit-product-form" method="post" enctype="multipart/form-data">
                                <div class="form-group mb-3">
                                    <label> Tên sản phẩm </lable>
                                        <input type="text" name="txtName" class="form-control validate" value="<?php echo isset($_POST["txtName"]) ? $_POST["txtName"] : ""; ?>" />
                                </div>
                                <div class="form-group mb-3">
                                    <label> Mô tả sản phẩm</lable>
                                        <textarea class="form-control validate" name="txtdesc" cols="21" rows="10" value="<?php echo isset($_POST["txtdesc"]) ? $_POST["txtdesc"] : ""; ?>"> </textarea>
                                </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                            <div class="form-group mb-3">
                                <label> Số lượng</lable>
                                    <input class="form-control validate" type="number" name="txtquantity" value="<?php echo isset($_POST["txtquantity"]) ? $_POST["txtquantity"] : ""; ?>" />
                            </div>
                            <div class="form-group mb-3">
                                <label> Giá tiền</lable>
                                    <input class="form-control validate" type="number" name="txtprice" value="<?php echo isset($_POST["txtprice"]) ? $_POST["txtprice"] : ""; ?>" />
                            </div>
                            <div class="form-group mb-3">
                                <label> Chọn loại sản phẩm</label>
                                <select class="custom-select tm-select-accounts" name="txtCateID">
                                    <option value="" selected>Chọn loại </option>
                                    <?php
                                    $cates = Category::list_category();
                                    foreach ($cates as $item) {
                                        echo "<option value='" . $item["CateID"] . "'>" . $item["CategoryName"] . "</option>";
                                    }
                                    ?>
                                </select>
                            </div>

                            <div class="form-group mb-3">
                                <label> Tải ảnh sản phẩm</lable>
                                    <input type="file" class="btn btn-primary btn-block mx-auto" name="txtpic" accept=".PNG,.GIF,.JPG" value="<?php echo isset($_POST["txtpic"]) ? $_POST["txtpic"] : ""; ?>" />
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <input type="submit" class="btn btn-primary btn-block text-uppercase" name="btnsubmit" value="Thêm sản phẩm" />
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>


    <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 mx-auto">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h3 style="color: white;" class="text-center">Danh sách tất cả sản phẩm</h3>
            <div style="overflow-x:auto;">
                <table class="product">
                    <tr>
                        <th>Mã sản phẩm</th>
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
                                <a role="button" class="btn btn-danger" onclick="del()">Xóa</a>
                            </td>
                        </tr>
                    <?php } ?>
                </table>
            </div>
        </div>
    </div>


    <?php include_once("footer.php"); ?>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->

    <script>
        function del() {
            if (confirm("Bạn có thật sự muốn xóa")) { 
                $(location).attr('href', 'delete.php?ProductID=<?php echo $item['ProductID']; ?>')
            }
        }
    </script>
</body>

</html>