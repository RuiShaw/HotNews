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
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="nprogress/nprogress.css">
    <script src="js/jquery.min.js"></script>
    <script src="nprogress/nprogress.js"></script>

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
                        <h2>�ջ�ǰһƪ����</h2>

                        <!-- TODO �������� -->
                        <p>дǰһƪ���µ�ʱ��ͷ�ԱȽ��ȡ�������������Ҳ��֪���Լ�Ϊʲô��˵�������Ļ�����Ϊʲô�����������뷨����������Ǽ٣�����һЩ���Ʒ�Ͳ¼ɣ���һ���Եĵ��˳�����</p>

                        <p>����ص���˾������ manager �Ͽҵ����񣬱�һȺ�͵���ͬ����Χ�ƣ���ȡ�Ҷ�ĳЩ���ߵı�Թ�͸Ľ���������ұ�ʾ��Ǹ�����Ͳ���ȷ����Ҫ�Ľ��ĵط����ҷ��֣���ͷ��Թ����ʱȫû�ˡ�����һȺͦ�ɰ���ͬ�¡���</p>

                        <p>Ҳ���Ǿ�������ô������������˼ʹ�ϵ֮�󣬺��Ѳ��¼������˵��뷨�ɣ����������ɵ����������һ������ҧ��ʮ���¾�������Щ���鲻˵������ͱ��������ˡ��˺��˵��˽���Ҫʱ�䣬���������£�������ô��Ϥ��������Ϊ�����ϵĲ����������ᡣ���˵���˷�պ�ѹ�ֵĻ����ǿ��������Լ��ɡ�����������ʵͦ�����������Լ�û�п�����</p>

                        <p>ʵ��˵�������������棬������������΢��ĺܶ෽�棬�����Լ������������ʱ���Ǻܶ࣬�����������ڵ������˾Ͷ�����˵�õķ��档���Ҫ�����������������������˾�ĵ�һӡ�������뵽�������־��ǣ����졣���ܸо�������������һЩ�˻��Ǻܺõ����ѡ�</p>

                        <p>��˵����ô�໰������Ͳ�����˼��˵�ˡ�</p>

                        <p>�������ڹ����ǲ����쵼������ѹ�������ԸĿ��ˡ�����������ô�����𣿻�˵����쵼�������ѹ�������һ����������ˡ����ֲ���΢����ڷ����� :P �������ľ����Լ�̫��̫�嶯�ˣ�����������ʵ��ԭ�����Բų��صġ���</p>

                    </div>
                </div>

                <div class="col-md-3">

                    <!-- ������ -->
                    <div  id="comment" style="padding: 2% 8% 5% 8%; border: 1px solid LightGrey; border-radius: 4px; overflow:auto">
                        <h3>����</h3>

                        <%--<div class="form-group">
                            <label for="comment">Comment:</label>
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>--%>

                        <!-- TODO �������� -->
                        <div class="col-md-12">
                            <div class="col-md-8 pull-left">
                                <input id="comments" type="text" class="form-control" placeholder="��������" maxlength="50">
                            </div>
                            <div class="col-md-4 pull-right">
                                <button id="commentSub" type="button" class="btn btn-defualt" style="background-color: white; border-color: #ccc;">����</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <br/>

        <!-- ������ -->
        <div class="row">
            <div class="col-md-12" align="center">
                <!-- TODO ����֤(�����ظ���) -->
                <button type="button" class="btn btn-default btn-lg" disabled="disabled">
                    <span class="glyphicon glyphicon-thumbs-up"></span>
                </button>
            </div>
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
