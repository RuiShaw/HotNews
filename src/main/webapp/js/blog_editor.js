(function ($) {
    $(document).ready(function () {
        $("#blog_editor").validate({
            rules: {
                title: {
                    required: true,
                    maxlength: 10
                }
            },
            messages: {
                title: {
                    required: "<strong style='color: red;'>���������!</strong>",
                    maxlength: "<strong style='color: red;'>������ı��ⳬ��10���ַ�!</strong>"
                }
            }
        });
    });

})(jQuery);