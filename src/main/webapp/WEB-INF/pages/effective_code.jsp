<%--
  title: ��Чcodeҳ��
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/9/2
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>��������</title>
    <meta charset="GBK">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/signin.css">

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

    <!--
        TODO ���ύ��������ɹ���,��̨��Ҫ��reset_code����Ϊnull.
     -->

    <div class="container">
        <form id="effective_code" action="effective_code.do" method="post" class="form-signin">
            <input id="email" name="email" type="hidden" value="${email}">
            <input id="reset_code" name="reset_code" type="hidden" value="${reset_code}">

            <div class="form-group">
                <input id="password" type="password" name="password" class="form-control" placeholder="����" maxlength="12">
            </div>

            <div class="form-group">
                <input id="repeatPassword" type="password" name="repeatPassword" class="form-control" placeholder="ȷ������" maxlength="12">
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-lg btn-primary btn-block" value="�޸�">
            </div>
        </form>
    </div>

</body>
</html>