<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/8/24
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hot News</title>
    <jsp:include page="include.jsp"></jsp:include>
    <script src="js/reset_password.js"></script>
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
                        <a id="blog_link" href="#blog" data-toggle="tab">Blog</a>
                    </li>

                    <li>
                        <a id="news_link" href="#news" data-toggle="tab">News</a>
                    </li>

                    <li>
                        <a href="https://github.com/RuiShaw"  target="_blank">GitHub</a>
                    </li>

                    <li class="dropdown">

                        <a href="#" id="dropdown" class="dropdown-toggle" data-toggle="dropdown">
                            Profile
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdown">
                            <li>
                                <a href="#reset" data-toggle="tab">�����޸�</a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="#author" data-toggle="tab">�˽�����</a>
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

    <br/>
    <br/>

    <div class="tab-content">
        <!-- blog -->
        <div class="tab-pane fade in active" id="blog">
            <jsp:include page="/blog.do"></jsp:include>
        </div>

        <!-- news -->
        <div class="tab-pane fade" id="news">
            <jsp:include page="/news.do"></jsp:include>
        </div>

        <!-- reset -->
        <div class="tab-pane fade" id="reset">
            <div class="container center-block">
                <form id="reset_password" action="reset_password.do" method="post" class="form-signin">

                    <div class="form-group">
                        <input id="s_password" name="s_password" type="password" class="form-control" placeholder="ԭ����" autofocus>
                    </div>

                    <div class="form-group">
                        <input id="n_password" name="n_password" type="password" class="form-control" placeholder="������" required>
                    </div>

                    <div class="form-group">
                        <input id="repeat_n_password" name="repeat_n_password" type="password" class="form-control" placeholder="�ظ�������" required>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="�޸�">
                    </div>

                    <div align="center">
                        <strong style="color: red;">${msg}</strong>
                    </div>

                </form>
            </div>
        </div>

        <!-- about author -->
        <div class="tab-pane fade" id="author">
            <div class="container">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">��������</h3>
                    </div>
                    <div class="panel-body">
                        Name: Rui Shawn
                    </div>

                    <div class="panel-body">
                        Email: Xiaorui0629@gmail.com
                    </div>

                    <div class="panel-body">
                        WebSite: https://www.ruixiao.org
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>
</html>
