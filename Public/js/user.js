$(document).ready(function() {
    $("#userAddForm").validate({
        rules: {
            user_name: {
                required: true,
                minlength: 2
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 6
            },
            confirm_password: {
                required: true,
                minlength: 6,
                equalTo: "#password"
            }
        },
        messages: {
            user_name: {
                required: '请输入姓名'
            }
        },
        errorElement: "em",				//用来创建错误提示信息标签
        success: function(label) {			//验证成功后的执行的回调函数
            //label指向上面那个错误提示信息标签em
            label.text(" ")				//清空错误提示消息
                .addClass("success");	//加上自定义的success类
        }
    });

    $("#userLoginForm").validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 6
            }
        },

        errorElement: "em",				//用来创建错误提示信息标签
        success: function(label) {			//验证成功后的执行的回调函数
            //label指向上面那个错误提示信息标签em
            label.text(" ")				//清空错误提示消息
                .addClass("success");	//加上自定义的success类
        }
    });

    //JqGrid

});
