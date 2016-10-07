<%--
  Created by IntelliJ IDEA.
  User: Xr
  Date: 2016/9/5
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="sweetalert/sweetalert.css">
<script src="sweetalert/sweetalert.min.js"></script>

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

                    <!-- ֻ���Լ��Ĳ��Ͳ��ܱ༭��ɾ�� -->
                    <c:if test="${blog.getFlag() eq 'true'}">
                        <div class="btn-group btn-group-xs pull-right">
                            <button id="editor" type="button" class="btn btn-default">�༭</button>
                            <input id="blog_id" type="hidden" value="${blog.getId()}">
                            <button id="delete" type="button" class="btn btn-default">ɾ��</button>
                        </div>
                    </c:if>
                </li>
            </c:forEach>

        </ul>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#delete").click(function () {
            swal({
                title: "ȷ��Ҫɾ��?",
                text: "�㽫Ҫɾ����ƪ����!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "ȷ��",
                cancelButtonText: "ȡ��",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                    if (isConfirm) {
                        var blog_id = $("#blog_id").val();
                        if ("" != blog_id) {
                            $.ajax({
                                url: "blog_delete.do",
                                type: "POST",
                                data: "blog_id=" + blog_id,
                                success: function (data) {
                                    $("#blog").html(data);
                                    swal("ɾ���ɹ�!", "", "success");
                                }
                            });
                        }
                    } else {
                        swal("ȡ��ɾ��!", "", "error");
                    }
                }
            );
        });
    });
</script>

