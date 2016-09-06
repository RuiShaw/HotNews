(function ($) {
    $(document).ready(function () {

        jQuery.validator.setDefaults({
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success has-feedback').addClass('has-error has-feedback');
                $(element).closest('.form-group').find('i.fa').remove();
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error has-feedback').addClass('has-success has-feedback');
                $(element).closest('.form-group').find('i.fa').remove();
            }
        });

        //���ԭ�����Ƿ���ȷ
        $.validator.addMethod("isCorrect", function(value, element) {
            var flag = false;
            $.ajax({
                method: "POST",
                url: "check_password.do",
                async: false,
                data: {password: value},
                success: function(data) {
                    if (data == "true") {
                        flag = true;
                    }
                }
            });
            return flag;
        }, "�����ԭʼ�������!");

        $("#reset_password").validate({
            rules: {
                s_password: {
                    required: true,
                    minlength: 8,
                    maxlength: 12,
                    isCorrect: true
                },
                n_password: {
                    required: true,
                    minlength: 8,
                    maxlength: 12
                },
                repeat_n_password: {
                    required: true,
                    minlength: 8,
                    maxlength: 12,
                    equalTo: "#n_password"
                }
            },
            messages: {
                s_password: {
                    required: "����������!",
                    minlength: "���������С��8λ!",
                    maxlength: "������������12λ!"
                },
                n_password: {
                    required: "����������!",
                    minlength: "���������С��8λ!",
                    maxlength: "������������12λ!"
                },
                repeat_n_password: {
                    required: "�������벻ƥ�䡣�Ƿ�����?",
                    minlength: "���������С��8λ!",
                    maxlength: "���������С��12λ!",
                    equalTo: "�������벻ƥ�䡣�Ƿ�����?"
                }
            }
        });
    });
})(jQuery);