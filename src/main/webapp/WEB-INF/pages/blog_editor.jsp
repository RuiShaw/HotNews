<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/9/28
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>����׫д</title>
    <link rel="shortcut icon" href="favicon.ico">
    <!-- �༭����ʽ -->
    <link href="umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">

    <link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="js/jquery.min.js"></script>

    <!--�༭��js -->
    <script type="text/javascript" charset="gbk" src="umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="gbk" src="umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>

    <!-- ����js -->
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/blog_editor.js"></script>
</head>
<body>
    <br/><br/><br/>
    <div class="container">
        <div id="content" style="padding: 2% 8% 5% 8%; border: 1px solid LightGrey; border-radius: 4px;">
            <form id="blog_editor" action="blog_create.do" method="post">
                <div class="form-group">
                    <label for="title">���ͱ���:</label>
                    <input id="title" name="title" type="text" class="form-control" placeholder="����" maxlength="10" autofocus required>
                </div>

                <div class="form-group">
                    <label for="sel">����Ȩ��:</label>
                    <select class="form-control" id="sel" name="authority">
                        <option value="private">˽��</option>
                        <option value="public">����</option>
                    </select>
                </div>

                <br/>
                <!-- editor(�༭��) -->
                <script id="container" name="content" type="text/plain" style="width:956px;height:240px;"><p>���벩������.</p></script>

                <br/>

                <input type="submit" class="btn btn-primary btn-block bt-lg" value="������">

            </form>


            <div align="center">
                <p>Notes: ÿ�η����ͺ�,������ˢ����ҳ��,���ܿ������·���Ĳ���!</p>
                <br/>
                <p style="color: red;">${msg}</p>
            </div>

        </div>
    </div>

    <!-- init -->
    <script type="text/javascript">
        var um = UM.getEditor('container');
    </script>
</body>
</html>
