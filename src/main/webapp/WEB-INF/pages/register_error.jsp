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
    <title>ע��ʧ��</title>
    <meta charset="GBK">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/signin.css">
    <script type="text/javascript">
        var time = 9;
        setInterval(refer, 1000);
        function refer() {
            if (time == 0) {
                window.location.href = "registerJump.do";
            } else {
                document.getElementById("show").innerHTML = time + "�����ת��<span style='font-weight: bold;'>ע�����</span>!"
            }
            time--;
        }
    </script>
</head>
<body>
    <div align="center" style="margin-top: 15%;">
        <h3><span style='color:red; font-weight: bold;'>ע��ʧ��</span></h3>
        <p id="show">10�����ת��<span style='font-weight: bold;'>ע�����</span>!</p>
        <a href="registerJump.do">������ת</a>
    </div>
</body>
</html>
