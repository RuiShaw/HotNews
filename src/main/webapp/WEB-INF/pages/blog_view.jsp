<%@ page import="org.jsoup.Connection" %>
<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/9/28
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>���Ͳ鿴</title>
    <meta charset="GBK" http-equiv="Content-Type">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="nprogress/nprogress.css">
    <script src="js/jquery.min.js"></script>
    <script src="nprogress/nprogress.js"></script>
    <script src="js/blog_view.js" charset="GBK"></script>

    <style>
        H2 {
            font-family: "Palatino Linotype", "Book Antiqua", Palatino, Helvetica, STKaiti, SimSun, serif;
            font-weight: bold;
            margin-bottom: 60px;
            margin-bottom: 40px;
            padding: 5px;
            border-bottom: 2px LightGrey solid;
            width: 98%;
            line-height: 150%;
            color: #666666;
        }

        H3 {
            font-family: "Palatino Linotype", "Book Antiqua", Palatino, Helvetica, STKaiti, SimSun, serif;
            font-weight: bold;
            margin-top: 40px;
            margin-bottom: 30px;
            border-bottom: 1px LightGrey solid;
            width: 98%;
            line-height: 150%;
            color: #666666;
        }

    </style>
</head>
<body>
    <br/>

    <div class="container">
        <div class="row">
            <div class="col-md-12" role="main">
                <div class="col-md-9">
                    <!-- ������ -->
                    <div id="content" style="padding: 2% 8% 5% 8%; border: 1px solid LightGrey; border-radius: 4px;">
                        <h2>${title}</h2>
                        <input id="blog_id" name="blog_id" type="hidden" value="${id}">
                        <!-- TODO �������� -->
                        ${content}
                    </div>
                </div>

                <div class="col-md-3">
                    <!-- ������ -->
                    <div  id="comment" style="padding: 2% 8% 5% 8%; border: 1px solid LightGrey; border-radius: 4px; overflow:auto">
                        <h3>����</h3>
                        <!-- TODO ��ȡ�����б� -->


                        <textarea  id="comments" class="form-control" placeholder="��������" maxlength="100"></textarea>
                        <br/>
                        <div align="center">
                            <button id="commentSub" type="button" class="btn btn-defualt" style="background-color: white; border-color: #ccc;">����</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br/>

        <!-- ������ -->
        <div class="row">
            <div id="good_area" class="col-md-12" align="center">
                <!-- ����֤(�����ظ���) -->
                ${good}
            </div>
            <div id="good_warn" class="col-md-12" align="center"></div>
        </div>
    </div>

    <script type="text/javascript">
        //���������������߶�ͬ��
        $("#comment").css("height", $("#content").css("height"));

        NProgress.start();

        $(document).ready(function () {
            NProgress.done();
        });
    </script>

</body>
</html>
