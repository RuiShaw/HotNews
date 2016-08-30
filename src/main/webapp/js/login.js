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

        $("#login").validate({
            rules: {
                email: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 8,
                    maxlength: 12
                }
            },
            messages: {
                email: "��������Ч�ĵ��������ַ!",
                password: {
                    required: "��������������!",
                    minlength: "���������С��8λ!",
                    maxlength: "������������12λ!"
                }
            }

        });

        //jquery email�������ƥ����֤
        $.validator.methods.email = function(value, element) {
            return this.optional(element) || validateEmail(value)
        };

        //validate email
        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
    });
})(jQuery);