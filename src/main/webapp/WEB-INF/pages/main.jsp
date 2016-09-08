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
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/reset_password.js"></script>

    <script type="text/javascript">
        $(document).tooltip({
            //support html
            content: function () {
                return $(this).prop('title');
            }
        });

        //ÿ�����һ��
        setInterval(setTime, 1000);

        function setTime() {
            if ($("#time").css("display") == "none") {
                $("#time").css("display", "block");
            }
            $("#time").text(currentTime());
        }

        //get current time
        function currentTime() {
            var now = new Date();

            var year = now.getFullYear();       //��
            var month = now.getMonth() + 1;     //��
            var day = now.getDate();            //��

            var hh = now.getHours();            //ʱ
            var mm = now.getMinutes();          //��
            var sec = now.getSeconds();         //��

            var clock = year + "-";

            if (month < 10) clock += "0";
            clock += month + "-";

            if (day < 10) clock += "0";
            clock += day + " ";

            if (hh < 10) clock += "0";
            clock += hh + ":";

            if (mm < 10) clock += '0';
            clock += mm + ":";

            if (sec < 10) clock += '0';
            clock += sec;

            return (clock);
        }

    </script>
</head>
<body>

    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">

            <div class="navbar-header">
                <img class="navbar-brand" src="favicon.ico" title="��ӭ<b style='color: red;'>${nickname}</b>����HotNews!">
            </div>


            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active">
                        <a id="blog_link" href="#blog" data-toggle="tab">Blog</a>
                    </li>

                    <li>
                        <a id="news_link" href="#news" data-toggle="tab">News</a>
                    </li>

                    <li>
                        <a href="https://github.com/RuiShaw"  target="_blank">GitHub</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <!-- mp3 player -->
                    <li>
                        <div class="container" style="height: 50px;">
                            111
                        </div>
                    </li>

                    <!-- time to show -->
                    <li style="padding-top:10px; padding-right:10px;">
                        <div id="time" style="padding: .2em .6em .3em;text-align: center;border-radius: .25em; background-color: #5cb85c; color: #fff; display: none;"></div>
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

    <div class="tab-content" style="padding-top: 50px;">
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
                    <h3 align="center">�����޸�</h3>
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
            <div class="well center-block" style="max-width: 400px;">

            </div>
        </div>
    </div>

</body>
</html>
