<?php
include_once("header.php");
?>
<?php
if (isset($_SESSION['user']) != "") {
    # code...
    header("Location: index.php");
}
require_once("./entities/user.class.php");
if (isset($_POST['btn-signup'])) {
    # code...
    $u_name = $_POST['txtname'];
    $u_email = $_POST['txtemail'];
    $u_password = $_POST['txtpass'];
    $account = new User($u_name, $u_email, $u_password);
    $result = $account->save();
    if (!$result) {
        # code...
        echo '<script language="javascript">';
        echo 'alert("Có lỗi xảy ra, hãy kiểm tra dữ liệu")';
        echo '</script>';
    } else {
        # code...
        echo '<script language="javascript">';
        echo 'alert("Đăng ký thành công")';
        echo '</script>';
        $_SESSION['user'] = $u_name;
        header("Location: index.php");
    }
}

?>

<form method="post" style="width: 30%;">
    <div class="form-group row">
        <label for="txtName" class="col-sm-2 form-control-label">Username</label>
        <div class="col-sm-10">
            <input type="text" class="form-control " name="txtname" placeholder="User name">
        </div>
    </div>
    <div class="form-group row">
        <label for="txtEmail" class="col-sm-2 form-control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control " name="txtemail" placeholder="Email">
        </div>
    </div>
    <div class="form-group row">
        <label for="txtPassword" class="col-sm-2 form-control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control " name="txtpass" placeholder="Password">
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-success" name="btn-signup" value="Sign up">
        </div>
    </div>
</form>
<?php include_once("footer.php"); ?>