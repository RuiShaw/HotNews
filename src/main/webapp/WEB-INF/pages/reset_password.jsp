<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/9/6
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>�����޸�</title>
    <jsp:include page="include.jsp"></jsp:include>
    <script src="js/reset_password.js"></script>
</head>
<body>
    <div class="container center-block">
        <form id="reset_password" action="reset_password.do" method="post" class="form-signin">

            <div class="form-group">
                <input id="s_password" name="s_password" type="password" class="form-control" placeholder="ԭ����" autofocus>
            </div>

            <div class="form-group">
                <input id="n_password" name="n_password" type="password" class="form-control" placeholder="������" required>
            </div>

            <div class="form-group">
                <input id="repeat_n_password" name="repeat_n_password" type="password" class="form-control" placeholder="�ظ�������">
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-primary btn-lg btn-block" value="�޸�">
            </div>

            <div align="center">
                <strong style="color: red;">${msg}</strong>
            </div>

        </form>
    </div>
</body>
</html>
