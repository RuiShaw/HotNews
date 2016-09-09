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

        //ÿ�����һ��
        setInterval(setTime, 1000);

        //ʱ����ʾ
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

    <!-- ������ -->
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

                    <!-- time to show -->
                    <li style="padding-top:10px; padding-right:10px;">
                        <div id="time" title="��ǰʱ��" style="padding: .2em .6em .3em;text-align: center;border-radius: .25em; background-color: #5cb85c; color: #fff; display: none;"></div>
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

    <!-- music player -->
    <div class="container" style="position:relative;z-index:1031;top:-35px;">
        <div align="center">
            <div id="bar-ui" class="sm2-bar-ui">

                <!-- ���ֲ��ſ��� -->
                <div class="bd sm2-main-controls">

                    <!-- ����/��ͣ -->
                    <div class="sm2-inline-element sm2-button-element">
                        <div class="sm2-button-bd">
                            <a href="#play" title="����/��ͣ" class="sm2-inline-button play-pause">Play / pause</a>
                        </div>
                    </div>

                    <!-- ����״̬ -->
                    <div class="sm2-inline-element sm2-inline-status">

                        <!-- ��ʾ���ڲ��ŵĸ��������� -->
                        <div class="sm2-playlist">
                            <div class="sm2-playlist-target">
                                <noscript><p>JavaScript is required.</p></noscript>
                            </div>
                        </div>

                        <!-- �������Ž��� -->
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

                    <!-- �������� -->
                    <div class="sm2-inline-element sm2-button-element sm2-volume">
                        <div class="sm2-button-bd">
                            <span class="sm2-inline-button sm2-volume-control volume-shade"></span>
                            <a href="#volume" title="����" class="sm2-inline-button sm2-volume-control">volume</a>
                        </div>
                    </div>

                    <!-- ��һ�װ�ť  -->
                    <div class="sm2-inline-element sm2-button-element">
                        <div class="sm2-button-bd">
                            <a href="#prev" title="��һ��" class="sm2-inline-button previous">&lt; ��һ��</a>
                        </div>
                    </div>

                    <!-- ��һ�װ�ť -->
                    <div class="sm2-inline-element sm2-button-element">
                        <div class="sm2-button-bd">
                            <a href="#next" title="��һ��" class="sm2-inline-button next">&gt; ��һ��</a>
                        </div>
                    </div>

                    <!-- �����б� -->
                    <div class="sm2-inline-element sm2-button-element sm2-menu">
                        <div class="sm2-button-bd">
                            <a id="menu" href="#menu" title="�˵�" class="sm2-inline-button menu">�˵�</a>
                        </div>
                    </div>

                </div>

                <!-- ���ֲ˵������� -->
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

                            <!-- TODO д������ץ�ٶ��������� -->
                            <!-- standard one-line items -->
                            <li><a href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20People%20Asking.mp3"><b>SonReal</b> - People Asking <span class="label">Explicit</span></a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20Already%20There%20Remix%20ft.%20Rich%20Kidd%2C%20Saukrates.mp3"><b>SonReal</b> - Already There Remix ft. Rich Kidd, Saukrates <span class="label">Explicit</span></a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/The%20Fugitives%20-%20Graffiti%20Sex.mp3"><b>The Fugitives</b> - Graffiti Sex</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/Adrian%20Glynn%20-%20Seven%20Or%20Eight%20Days.mp3"><b>Adrian Glynn</b> - Seven Or Eight Days</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20I%20Tried.mp3"><b>SonReal</b> - I Tried</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/gong-192kbps.mp3">32" Gong Sounds (rubber + standard mallets)</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/mpc/20060826%20-%20Armstrong.mp3">Armstrong Beat</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/mpc/20090119%20-%20Untitled%20Groove.mp3">Untitled Groove</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/birds-in-kauai-128kbps-aac-lc.mp4">Birds In Kaua'i (AAC)</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/20130320%20-%20Po%27ipu%20Beach%20Waves.ogg">Po'ipu Beach Waves (OGG)</a></li>
                            <li><a href="http://freshly-ground.com/data/audio/sm2/bottle-pop.wav">A corked beer bottle (WAV)</a></li>
                            <%--<li><a href="../../demo/_mp3/rain.mp3">Rain</a></li>--%>

                        </ul>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- ���������� -->
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
