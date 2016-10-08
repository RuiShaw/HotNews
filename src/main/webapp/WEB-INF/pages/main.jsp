<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/8/24
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hot News</title>
    <jsp:include page="include.jsp"></jsp:include>
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/reset_password.js"></script>

    <link rel="stylesheet" href="bar-ui/bar-ui.css">
    <script src="bar-ui/soundmanager2-jsmin.js"></script>
    <script src="bar-ui/bar-ui.js"></script>

    <script type="text/javascript">
        $(document).tooltip({
            //support html for tooltip
            content: function () {
                return $(this).prop('title');
            }
        });

        //每秒调用一次
        setInterval(setTime, 1000);

        //时间显示
        function setTime() {
            if ($("#time").css("display") == "none") {
                $("#time").css("display", "block");
            }
            $("#time").text(currentTime());
        }

        //get current time
        function currentTime() {
            var now = new Date();

            var year = now.getFullYear();       //年
            var month = now.getMonth() + 1;     //月
            var day = now.getDate();            //日

            var hh = now.getHours();            //时
            var mm = now.getMinutes();          //分
            var sec = now.getSeconds();         //秒

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


        $(document).ready(function () {
            //处理页面tab切换的active
            $('a[data-toggle="tab"]').click(function () {
                //console.log(this);
                var attr = $(this).attr("href");
                $("body").find('a[data-toggle="tab"]').each(function (i, n) {
                    var href = $(n).attr("href");
                    if (href != attr) {
                        //console.log($(n).attr("href"));
                        $(n).parent().removeClass("active");
                        if (href != "#author" || href != "#reset") {
                            $("#dropdownList").removeClass("active");
                        } else {
                            $(n).parent().removeClass("active");
                        }
                    }
                });
            });

        });

    </script>
</head>
<body>

    <!-- 导航栏 -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">

            <div class="navbar-header">
                <img class="navbar-brand" src="favicon.ico" title="欢迎<b style='color: red;'>${nickname}</b>来到HotNews!">
            </div>

            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav">
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
                    <!-- time to show -->
                    <li style="padding-top:10px; padding-right:10px;">
                        <div id="time" title="当前时间" style="padding: .2em .6em .3em;text-align: center;border-radius: .25em; background-color: #5cb85c; color: #fff; display: none;"></div>
                    </li>

                    <li id="dropdownList" class="dropdown">
                        <a href="#" id="dropdown" class="dropdown-toggle" data-toggle="dropdown">
                            Profile
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdown">
                            <li>
                                <a href="#reset" data-toggle="tab">密码修改</a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="#author" data-toggle="tab">了解作者</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="logout.do">登出</a>
                    </li>
                </ul>

            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <!-- music player -->
    <div class="container" style="position: relative; z-index: 1031; width:420px; height:42px; top: -35px;">
        <div id="bar-ui" class="sm2-bar-ui">
            <!-- 音乐播放控制 -->
            <div class="bd sm2-main-controls">

                <!-- 播放/暂停 -->
                <div class="sm2-inline-element sm2-button-element">
                    <div class="sm2-button-bd">
                        <a href="#play" title="播放/暂停" class="sm2-inline-button play-pause">Play / pause</a>
                    </div>
                </div>

                <!-- 播放状态 -->
                <div class="sm2-inline-element sm2-inline-status">

                    <!-- 显示正在播放的歌名及歌手 -->
                    <div class="sm2-playlist">
                        <div class="sm2-playlist-target">
                            <noscript><p>JavaScript is required.</p></noscript>
                        </div>
                    </div>

                    <!-- 歌曲播放进度 -->
                    <div class="sm2-progress">
                        <div class="sm2-row">
                            <div class="sm2-inline-time">0:00</div>
                            <div class="sm2-progress-bd">
                                <div class="sm2-progress-track">
                                    <div class="sm2-progress-bar"></div>
                                    <div class="sm2-progress-ball">
                                        <div class="icon-overlay"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="sm2-inline-duration">0:00</div>
                        </div>
                    </div>

                </div>

                <!-- 音量调节 -->
                <div class="sm2-inline-element sm2-button-element sm2-volume">
                    <div class="sm2-button-bd">
                        <span class="sm2-inline-button sm2-volume-control volume-shade"></span>
                        <a href="#volume" title="音量" class="sm2-inline-button sm2-volume-control">volume</a>
                    </div>
                </div>

                <!-- 上一首按钮  -->
                <div class="sm2-inline-element sm2-button-element">
                    <div class="sm2-button-bd">
                        <a href="#prev" title="上一首" class="sm2-inline-button previous">&lt; 上一首</a>
                    </div>
                </div>

                <!-- 下一首按钮 -->
                <div class="sm2-inline-element sm2-button-element">
                    <div class="sm2-button-bd">
                        <a href="#next" title="下一首" class="sm2-inline-button next">&gt; 下一首</a>
                    </div>
                </div>

                <!-- 播放列表 -->
                <div class="sm2-inline-element sm2-button-element sm2-menu">
                    <div class="sm2-button-bd">
                        <a id="menu" href="#menu" title="菜单" class="sm2-inline-button menu">菜单</a>
                    </div>
                </div>

            </div>

            <!-- 音乐菜单下拉表 -->
            <div id="music_list" class="bd sm2-playlist-drawer sm2-element">

                <div class="sm2-inline-texture">
                    <div class="sm2-box-shadow"></div>
                </div>

                <!-- playlist content is mirrored here -->

                <div class="sm2-playlist-wrapper">

                    <ul class="sm2-playlist-bd">

                        <!-- item with "download" link -->
                        <li>
                            <div class="sm2-row">
                                <div class="sm2-col sm2-wide">
                                    <a href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20LA%20%28Prod%20Chin%20Injetti%29.mp3"><b>SonReal</b> - LA<span class="label">Explicit</span></a>
                                </div>
                                <div class="sm2-col">
                                    <a href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20LA%20%28Prod%20Chin%20Injetti%29.mp3" target="_blank" title="Download &quot;LA&quot;" class="sm2-icon sm2-music sm2-exclude">Download this track</a>
                                </div>
                            </div>
                        </li>

                        <!-- TODO 可以写个爬虫抓百度音乐数据 -->
                        <!-- online mp3 -->
                        <li><a href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20People%20Asking.mp3"><b>SonReal</b> - People Asking <span class="label">Explicit</span></a></li>
                        <!-- local mp3 -->
                        <li><a href="audios/DJ Snake,Justin Bieber - Let Me Love You.mp3"><b>DJ Snake,Justin Bieber</b> - Let Me Love You</a></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 导航栏内容 -->
    <div style="position: relative; z-index: 1029;">
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
                        <h3 align="center">密码修改</h3>
                        <div class="form-group">
                            <input id="s_password" name="s_password" type="password" class="form-control" placeholder="原密码" autofocus>
                        </div>

                        <div class="form-group">
                            <input id="n_password" name="n_password" type="password" class="form-control" placeholder="新密码" required>
                        </div>

                        <div class="form-group">
                            <input id="repeat_n_password" name="repeat_n_password" type="password" class="form-control" placeholder="重复新密码" required>
                        </div>

                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="修改">
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
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input type="text" class="form-control" placeholder="Rui Shaw" readonly>
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                        <input type="text" class="form-control" placeholder="Xiaorui0629@gmail.com" readonly>
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-link"></span></span>
                        <input type="text" class="form-control" placeholder="https://www.ruixiao.org" readonly>
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon"><img src="github.ico" width="14px;" height="16px;"></span>
                        <input type="text" class="form-control" placeholder="https://github.com/RuiShaw" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
