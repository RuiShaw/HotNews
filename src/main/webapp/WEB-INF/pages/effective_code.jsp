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
    <title>�����޸�</title>
    <jsp:include page="include.jsp"></jsp:include>
    <script src="js/effective_code.js"></script>
</head>
<body>
    <div class="container">
        <form id="effective_code" action="effective_code.do" method="post" class="form-signin">
            <h3 class="form-signin-heading" align="center">�����޸�</h3>
            <input id="email" name="email" type="hidden" value="${email}">
            <input id="reset_code" name="reset_code" type="hidden" value="${reset_code}">

            <div class="form-group">
                <input id="password" type="password" name="password" class="form-control" placeholder="����" maxlength="12" autofocus>
            </div>

            <div class="form-group">
                <input id="repeatPassword" type="password" name="repeatPassword" class="form-control" placeholder="ȷ������" maxlength="12">
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-lg btn-primary btn-block" value="�޸�">
                <div align="center" style="margin-top: 1%;">
                    <a href="index.do">������ҳ</a>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
