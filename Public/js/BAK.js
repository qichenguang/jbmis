$(document).ready(function() {

/*    $(":input").focus(function(){
        $(this).addClass("focus");
    }).blur(function(){
            $(this).removeClass("focus");
    });*/

    $.validator.addMethod(
        "formula", //验证方法名称
        function(value, element, param) {//验证规则
            return value == eval(param);
        },
        '请正确输入数学公式计算后的结果'//验证提示信息
    );
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
            },
            pro_id: {
                required: true,
                minlength: 2
            },
            sc_pro_name: {
                required: true,
                minlength: 2
            }
        },
        /*,
         messages: {
         firstname: "Please enter your firstname",
         lastname: "Please enter your lastname",
         username: {
         required: "Please enter a username",
         minlength: "Your username must consist of at least 2 characters"
         },
         password: {
         required: "Please provide a password",
         minlength: "Your password must be at least 5 characters long"
         },
         confirm_password: {
         required: "Please provide a password",
         minlength: "Your password must be at least 5 characters long",
         equalTo: "Please enter the same password as above"
         },
         email: "Please enter a valid email address",
         agree: "Please accept our policy"
         }*/
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
});


$(document).ready(function() {
    //提交前
    function showRequest(formData, jqForm, options) {
        // formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
        var queryString = $.param(formData); //组装数据，插件会自动提交数据
        alert(queryString); //类似 ： name=1&add=2
        return true;
    }
    //提交后
    function showResponse(responseText, statusText , xhr , $form)  {
        //alert('状态: ' + statusText + '\n 返回的内容是: \n' + responseText);
        //alert('状态: ' + statusText + '\n 返回的内容是: \n' + "ok");
        /*        if($.isArray(responseText)){
         alert('状态: ' + statusText + '\n 返回的内容是: \n' + "ok");
         }

         alert('状态: ' + statusText + '\n 返回的内容是: \n' + $.type(responseText));*/

        /*        htmlstr = "<table>"
         $.each(responseText,function(entryindex,entry){
         htmlstr += '<tr><td>' + entry.pro_id + '</td></tr>';
         });
         htmlstr += "</table>";
         $("#sub_list").html(htmlstr);*/
    }
    $("#signupForm").validate({
        rules: {
            search: {
                required: false,
                minlength: 0
            }
        },
        messages: {
            search: {
                required: '请输入项目ID或名称'
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
        target:        '#sub_page',   // 用服务器返回的数据 更新 id为 result 的内容.
        //beforeSubmit:  showRequest,  // 提交前
        //success:       showResponse,  // 提交后
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


$(document).ready(function() {
    $('a .pro_id').click(function(){
        $.ajax({
            url: $(this).attr('href'),
            dataType: "html",
            type: "POST",
            cache: false,
            async:true,
            success: function(html){
                //$("#{$this->target}").empty();
                //$("#{$this->target}").remove();
                $("#sub_all_in_one").html(html);
                return false;
            }
        });
        return false;
    });
});


$(document).ready(function() {
    //提交前
    function showRequest(formData, jqForm, options) {
        // formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
        var queryString = $.param(formData); //组装数据，插件会自动提交数据
        alert(queryString); //类似 ： name=1&add=2
        return true;
    }
    //提交后
    function showResponse(responseText, statusText , xhr , $form)  {
        //alert('状态: ' + statusText + '\n 返回的内容是: \n' + responseText);
        /*        if($.isArray(responseText)){
         alert('状态: ' + statusText + '\n 返回的内容是: \n' + "ok");
         }

         alert('状态: ' + statusText + '\n 返回的内容是: \n' + $.type(responseText));*/

        /*        htmlstr = "<table>"
         $.each(responseText,function(entryindex,entry){
         htmlstr += '<tr><td>' + entry.pro_id + '</td></tr>';
         });
         htmlstr += "</table>";
         $("#sub_list").html(htmlstr);*/
    }

    var pageOptions = {
        target:        '#projectListAndAjaxPage',   // 用服务器返回的数据 更新 id为 result 的内容.
        //beforeSubmit:  showRequest,  // 提交前
        //success:       showResponse,  // 提交后
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
    $('#projectSearchForm').ajaxForm(pageOptions);

    //
    function hide_all_module(){
        $("#module_xmjbxx").accordion({ collapsible: true, autoHeight: true });
        $("#module_xmscfx").accordion({ collapsible: true, autoHeight: false });
        $("#module_khbyd").accordion({ collapsible: true, autoHeight: true });
        $("#module_xmrlzygl").accordion({ collapsible: true, autoHeight: true });
        $("#module_xmsjgl").accordion({ collapsible: true, autoHeight: true });
        $("#module_xmcbgl").accordion({ collapsible: true, autoHeight: true });
        $("#module_xmzjlgl").accordion({ collapsible: true, autoHeight: true });
        $("#module_gysgl").accordion({ collapsible: true, autoHeight: true });
        $("#module_ygjxgl").accordion({ collapsible: true, autoHeight: true });
        $("#module_gczcgl").accordion({ collapsible: true, autoHeight: true });
        $("#module_dxmgl").accordion({ collapsible: true, autoHeight: true });
        //1.first hide all.
        $(".module").hide();
    };
    //
    //hide_all_module();
    //$("#projectAllInOne").hide();
    //

});


$(document).ready(function() {
    $(".pro_id").livequery('click',function(event){
        event.preventDefault();
        //$("#projectAllInOne").show();

        $.ajax({
            url: $(this).attr('href'),
            dataType: "html",
            type: "GET",
            cache: false,
            async:true,
            success: function(html){
                //$("#{$this->target}").empty();
                //$("#{$this->target}").remove();
                $("#projectAllInOne").html(html);

                return false;
            }
        });
        return false;
    });
});


<script src="__PUBLIC__/js/Lib/jquery.livequery.js" type="text/javascript"></script>