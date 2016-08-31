(function ($) {
    $(document).ready(function () {

        $.validator.addMethod("isExists", function(value, element) {
            var flag = true;
            if (validateEmail(value)) {
                $.ajax({
                    method: "POST",
                    url: "check.do",
                    async: false, //Ϊ�˸�ֵflag������ֵ
                    data: {email: value},
                    success: function(data) {
                        if (data == "true") {
                            //�������
                            flag = false;
                        }
                    }
                });
            }
            return flag;
        }, "���û���������ʹ��.���������û���?");

        $.validator.addMethod("regex", function(value, element) {
            return validateEmail(value);
        }, "��������Ч�ĵ��������ַ!");

        //validate email
        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }

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

        $("#register").validate({
            rules: {
                nickname: {
                    required: true,
                    maxlength: 10
                },
                email: {
                    required: true,
                    regex: true,
                    isExists: true
                },
                password: {
                    required: true,
                    minlength: 8,
                    maxlength: 12
                },
                repeatPassword: {
                    required: true,
                    minlength: 8,
                    maxlength: 12,
                    equalTo: "#password"
                }
            },
            messages: {
                nickname: {
                    required: "�������ǳ�!",
                    maxlength: "��������ǳƳ���10���ַ�!"
                },
                email: {
                    required: "��������Ч�ĵ��������ַ!"
                },
                password: {
                    required: "����������!",
                    minlength: "���������С��8λ!",
                    maxlength: "������������12λ!"
                },
                repeatPassword: {
                    required: "�������벻ƥ�䡣�Ƿ�����?",
                    minlength: "���������С��8λ!",
                    maxlength: "���������С��12λ!",
                    equalTo: "�������벻ƥ�䡣�Ƿ�����?"
                }
            }
        });

        /*$("#nickname").popover({
            content: '�����ʹ�����ĺ�Ӣ��.',
            placement: 'left',
            trigger: 'focus'
        });

        $("#email").popover({
            content: '����: example@mail.com',
            placement: 'left',
            trigger: 'focus'
        });

        $("#password").popover({
            title: '����ǿ��:',
            content: '������ʹ�� 8 ���ַ�.',
            placement: 'left',
            trigger: 'focus'
        });*/
    });
})(jQuery);