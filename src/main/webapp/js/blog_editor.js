(function ($) {
    $("#blog_editor").validate({
        rules: {
            blog_title: {
                required: true,
                maxlength: 10
            }
        },
        messages: {
            blog_title: {
                required: "�������ǳ�!",
                maxlength: "��������ǳƳ���10���ַ�!"
            }
        }
    });

})(jQuery);