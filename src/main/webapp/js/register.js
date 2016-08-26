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

        $("#register").validate({
            rules: {
                nickname: {
                    required: true,
                    maxlength: 10
                },
                email: {
                    required: true
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
                email: "��������Ч�ĵ��������ַ!",
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

        $("#nickname").popover({
            content: '�����ʹ�����ĺ�Ӣ��.',
            placement: 'left'
        });

        $("#email").popover({
            content: '����: example@mail.com',
            placement: 'left'
        });

        $("#password").popover({
            title: '����ǿ��:',
            content: '������ʹ�� 8 ���ַ�.',
            placement: 'left'
        });

        $("#nickname").mouseleave(function () {
            $("#nickname").popover('hide');
        });

        $("#email").mouseleave(function () {
            $("#email").popover('hide');
        });

        $("#password").mouseleave(function () {
            $("#password").popover('hide');
        });

    });
})(jQuery)