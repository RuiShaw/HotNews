<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/9/5
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
<link rel="stylesheet" href="nprogress/nprogress.css">
<script src="nprogress/nprogress.js"></script>
--%>

<div class="container center-block">

    <div class="panel panel-default">
        <div class="panel-heading">
            Blog
            <button class="btn btn-default btn-sm">
                <a href="blog_editor.do" target="_blank"><span class="glyphicon glyphicon-edit"></span>�½�����</a>
            </button>
        </div>

        <ul class="list-group">

            <c:forEach items="${blog_list}" var="blog">
                <!-- �����б� -->
                <li class="list-group-item title">
                    <a href="blog_view.do?id=${blog.getId()}" target="_blank">
                        ${blog.getTitle()}
                    </a>
                    <!-- �����1��ʾ����1���µ����ۣ�����n,����N������.-->
                    <span class="badge pull-right" title="������"><span class="glyphicon glyphicon-pencil"></span>${blog.getDiscuss_num()}</span>
                    <!-- ������ -->
                    <span class="badge pull-right" title="������"><span class="glyphicon glyphicon-thumbs-up"></span>${blog.getGood_num()}</span>
                </li>
            </c:forEach>

        </ul>
    </div>

</div>

<%--<script type="text/javascript">

    //TODO һ��ͨ�������̨
    $(document).ready(function () {

        $("#target").click(function() {

            NProgress.configure({
                parent: '#blogOne'
            });

            NProgress.start();
            $.ajax({
                type: "POST",
                url: "blogGet.do",
                data: "����id",
                success: function (content) {
                    console.log(content);
                    NProgress.done();
                    $("#flag").val("true");
                }
            });
        });

    });

</script>--%>

