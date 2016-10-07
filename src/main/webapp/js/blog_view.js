(function ($) {
    $(document).ready(function () {
        var blog_id = $("#blog_id").val();

        if (blog_id != '' && blog_id != null) {
            $("#good").click(function () {
                $.ajax({
                    url: "blog_good.do",
                    data: "blog_id=" + blog_id,
                    type: "POST",
                    success: function (data) {
                        if ("" != data) {
                            if (data == "100") {
                                //�Ѿ������
                                $("#good").attr("disabled", "disabled");
                                $("#good_warn").html("<p style='color: red;'>���Ѿ��������!</p>");
                            } else if (data == "200") {
                                //���޳ɹ�
                                $("#good").attr("disabled", "disabled");
                                $("#good_warn").html("<p style='color: red;'>���޳ɹ�!</p>");
                            } else {
                                //����ʧ��
                                $("#good_warn").html("<p style='color: red;'>����ʧ��!</p>");
                            }
                        }
                    }
                });
            });
        }
    });
})(jQuery);