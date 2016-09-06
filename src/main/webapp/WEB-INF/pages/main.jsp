<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/8/24
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hot News</title>
    <jsp:include page="include.jsp"></jsp:include>
    <script type="text/javascript">
        $(function () {
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                // ��ȡ�Ѽ���ı�ǩҳ������
                var activeTab = $(e.target).text();
                // ��ȡǰһ������ı�ǩҳ������
                var previousTab = $(e.relatedTarget).text();
                $(".active-tab span").html(activeTab);
                $(".previous-tab span").html(previousTab);
            });
        });
    </script>
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">

            <div class="navbar-header" style="margin-top: 5px;">
                <img src="favicon.ico" alt="HotNews"><strong style="font-weight: bold; color: red;">${nickname}</strong>,�����ڿ�!
            </div>

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">

                    <li class="active">
                        <a href="#blog" data-toggle="tab">Blog</a>
                    </li>

                    <li>
                        <a href="#news" data-toggle="tab">News</a>
                    </li>

                    <li>
                        <a href="https://github.com/RuiShaw"  target="_blank">GitHub</a>
                    </li>

                    <li class="dropdown">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Profile
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="reset_password_jump.do">�����޸�</a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="#" data-toggle="tab">����</a>
                            </li>
                        </ul>

                    </li>

                    <li>
                        <a href="logout.do">�ǳ�</a>
                    </li>

                </ul>
            </div>

        </div>
    </nav>

    <div class="tab-content">
        <div class="tab-pane fade in active" id="blog">
            <iframe class="container center-block" name="forms" src="blog.do" scrolling="auto" frameborder="0" style="height: 90%;"></iframe>
        </div>

        <div class="tab-pane fade" id="news">
            <iframe class="container center-block" name="forms" src="news.do" scrolling="auto" frameborder="0" style="height: 90%;"></iframe>
        </div>

        <%--<div class="tab-pane fade" id="reset">
            <iframe class="container center-block" name="forms" src="reset_password_jump.do" scrolling="auto" frameborder="0" style="height: 90%;"></iframe>
        </div>--%>
    </div>

</body>
</html>
