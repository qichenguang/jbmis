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
        var result = eval('(' + xhr.responseText + ')');//动态页返回json格式的字符串，如{success:true/false}之类的，为false添加err属性什么的，成功则返回new_id
        //console.log(xhr);
        //console.log(result);
        //console.log(result.state);
        //console.log(result.msg);
        alert(result.state);
        alert(result.msg);
        alert(result.pro_id);
        //return [result.state,result.msg];
    }

    var privilegeOptions = {
        target:        '#privilegeResult',   // 用服务器返回的数据 更新 id为 result 的内容.
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
    $('#privilegeAddForm').ajaxForm(privilegeOptions);

});






