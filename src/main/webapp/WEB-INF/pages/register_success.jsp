<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/8/27
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>ע��ɹ�</title>
    <meta charset="GBK">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/signin.css">
    <script type="text/javascript">
        setInterval(refer, 1000);
        var time = 9;
        function refer() {
            if (time == 0) {
                window.location.href = "index.jsp";
            } else {
                document.getElementById("show").innerHTML = time + "�����ת��<span style='font-weight: bold;'>��½����</span>!";
            }
            time--;
        }
    </script>
</head>
<body>
    <div align="center" style="margin-top: 10%;">
        <h3><span style='color:red; font-weight: bold;'>ע��ɹ�</span></h3>
        <p id="show">10�����ת��<span style='font-weight: bold;'>��½����</span>!</p>
        <a href="index.jsp">������ת</a>
    </div>
</body>
</html>
