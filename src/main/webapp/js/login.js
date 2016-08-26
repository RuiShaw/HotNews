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

        $("#singinForm").validate({
            rules: {
                email: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 12
                }
            },
            messages: {
                email: "��������Ч�ĵ��������ַ.",
                password: {
                    required: "��������������.",
                    minlength: "���������С��6λ.",
                    maxlength: "������������12λ."
                }
            }

        });
    });
})(jQuery)