<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/8/25
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>Join Hot News!</title>
    <link rel="shortcut icon" href="favicon.ico">
    <meta charset="GBK">

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/signin.css">

    <script src="js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">

        <form action="register.do" method="POST" class="form-signin">

            <h2 class="form-signin-heading" align="center">ע��</h2>

            <div class="form-group">
                <input type="text" name="nickname" class="form-control" placeholder="�ǳ�" maxlength="10" required autofocus>
            </div>

            <div class="form-group">
                <input type="email" name="username" class="form-control" placeholder="����" required>
            </div>

            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="����" maxlength="10" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-lg btn-primary btn-block" value="ע��">
            </div>

            <div class="form-group" align="center">
                <a href="javascript:history.go(-1)">������һҳ</a>
            </div>

        </form>
    </div>

</body>
</html>
