$(document).ready(function() {
    //1.first hide all.
    //2.second show can use model.
    $(".f_field").hide();
    var set_field = $("#set_field").val();
    var set_field_class = "f_" + set_field;
    $('#' + set_field_class).show();

    //check rule
    //console.dir(default_rules);

    $("#signupForm").validate({
        rules: {
            sc_cus_name: {
                required: true,
                minlength: 2
            },
            sc_mag_company: {
                required: true,
                minlength: 6
            }
        },
        messages: {
            sc_cus_name: {
                required: '请输入客户姓名'
            },
            sc_mag_company: {
                required: '请输入管理公司名称'
            }
        },
        errorElement: "em",				//用来创建错误提示信息标签
        success: function(label) {			//验证成功后的执行的回调函数
            //label指向上面那个错误提示信息标签em
            label.text(" ")				//清空错误提示消息
                .addClass("success");	//加上自定义的success类
        }
    });

    var options = {
        target:        '#result',   // 用服务器返回的数据 更新 id为 result 的内容.
        beforeSubmit:  showRequest,  // 提交前
        success:       showResponse,  // 提交后
        //另外的一些属性:
        //url:       url         // 默认是form的action，如果写的话，会覆盖from的action.
        //type:      type        // 默认是form的method，如果写的话，会覆盖from的method.('get' or 'post').
        //dataType:  null        // 'xml', 'script', or 'json' (接受服务端返回的类型.)
        //clearForm: true        // 成功提交后，清除所有的表单元素的值.
        resetForm: false,        // 成功提交后，重置所有的表单元素的值.
        //由于某种原因,提交陷入无限等待之中,timeout参数就是用来限制请求的时间,
        //当请求大于3秒后，跳出请求.
        timeout:   3000
    };
    //'ajaxForm' 方式的表单 .
    $('#signupForm').ajaxForm(options);
});

// 提交前
function showRequest(formData, jqForm, options) {
    // formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
    var queryString = $.param(formData); //组装数据，插件会自动提交数据
    alert(queryString); //类似 ： name=1&add=2
    return true;
}
//  提交后
function showResponse(responseText, statusText , xhr , $form)  {
    alert('状态: ' + statusText + '\n 返回的内容是: \n' + responseText);
}
