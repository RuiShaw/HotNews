(function ($){
    $(document).ready(function() {

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

        //������֤����
        $.validator.addMethod("regex", function(value, element) {
            return validateEmail(value);
        }, "��������Ч�ĵ��������ַ!");

        //��֤�����Ƿ����
        $.validator.addMethod("isExists", function(value, element) {
            var flag = false;
            if (validateEmail(value)) {
                $.ajax({
                    method: "POST",
                    url: "check.do",
                    async: false, //Ϊ�˸�ֵflag������ֵ
                    data: {email: value},
                    success: function(data) {
                        if (data == "true") {
                            //�������
                            flag = true;
                        }
                    }
                });
            }
            return flag;
        }, "�Ҳ�������Email�ʻ�,������.");


        //validate email
        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }

        $("#forgot").validate({
            rules: {
                email: {
                    required: true,
                    regex: true,
                    isExists: true
                }
            },
            messages: {
                email: {
                    required: "��������Ч�ĵ��������ַ!"
                }
            }
        });

    });
})(jQuery);