$(document).ready(function() {

    //
    function hide_all_modules(){
        $("#module_xmjbxx").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_xmscfx").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_khbyd").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_xmrlzygl").accordion({ collapsible: true, autoHeight: true ,clearStyle: true,fillSpace:true,heightStyle:"content" });
        $("#module_xmsjgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_xmcbgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_xmzjlgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_gysgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_ygjxgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_gczcgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        $("#module_dxmgl").accordion({ collapsible: true, autoHeight: true,clearStyle: true,fillSpace:true,heightStyle:"content"  });
        //1.first hide all.
        $(".module").hide();
    };
    //
    function show_dep_modules(){
        //2.second show can use model.
        var dep_mod_arr = $("#dep_module").val().split(",");
        $.each(dep_mod_arr, function(key, val) {
            $('#' + val).show();
            // firebug console
            //console.log('index in arr:' + key + ", corresponding value:" + val);
            // 如果想退出循环
            // return false;
        });
    }

    function froozen_all_modules(lock){
        var dep_sx_arr = $("#dep_sx").val().split(",");
        var rec_json_str = $("#project_rec_detail").val();
        //console.log(rec_json_str);
        var rec_obj = $.parseJSON(rec_json_str);
        //console.log(rec_obj);
        //var zb_flag = rec_obj.sc_zb_flag;
        //alert(zb_flag);
        var depcode = $("#user_department").val();
        $(".module [jb_field]").each(function() {
            var id = $(this).attr('id');
            //console.log($(this).attr('id'));
            var cur_dep_code = id.substring(0,2);
            //console.log(cur_dep_code,id);
            var cur_pos_2 = id.substring(2,3);
            //console.log(cur_dep_code,cur_pos_2);
            if(($.inArray(cur_dep_code, dep_sx_arr) >=0) && cur_pos_2 == "_"){
                var curVal = "";
                if(rec_obj[id] === undefined || rec_obj[id] == null){
                    //
                }else{
                    curVal = rec_obj[id];
                    //console.log(id,curVal);
                }
                $(this).val(curVal);
                if($(this).attr("jb_field") == "multiple" || $(this).attr("jb_field") == "single"){
                    //alert(curVal);
                    //var result = eval('[' + curVal + ']');
                    if("" == curVal){
                        curVal = "[]";
                    }
                    //alert(curVal);
                    //if it is single, add [" "]
                    if(curVal.indexOf("[") == -1){
                        curVal = "[\"" + curVal + "\"]";
                    }
                    var result = eval(curVal);
                    //alert(result);
                    $(this).val(result);
                    $(this).multiselect("refresh");
                }
                //judge dep and enable it.
                $(this).attr("disabled",true);
                $(this).addClass("ui-state-disabled");
                //
                if($(this).attr("jb_field") == "multiple" || $(this).attr("jb_field") == "single"){
                    $(this).multiselect("disable");
                }
                if(false == lock){
                    if(id.substring(0,3) == (depcode + "_")){
                        $(this).attr("disabled",false);
                        $(this).removeClass("ui-state-disabled");
                        //
                        if($(this).attr("jb_field") == "multiple" || $(this).attr("jb_field") == "single"){
                            $(this).multiselect("enable");
                        }
                    }
                }
            }
        });
    }

    //1.
    hide_all_modules();
    //2.
    show_dep_modules();
    //3.初始化控件
    $('.module [jb_field=multiple]').multiselect({
        multiple: true,
        header: true,
        noneSelectedText: "请选择至少一项",
        selectedList: 8
    });
    $('.module [jb_field=single]').multiselect({
        multiple: false,
        header: "请选择一项",
        noneSelectedText: "请选择一项",
        selectedList: 8
    });
    $(".module [jb_time_field]" ).datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat:"yy-mm-dd",
        showButtonPanel: true
    });
    //3.1 初始化控件 选择用户
    $(".module select[jb_dep]").each(function(){
        var dep = $(this).attr("jb_dep");
        //alert(dep);
        var all_dep_str = $("#all_dep_username").val();
        var dep_obj = $.parseJSON(all_dep_str);
        if(dep_obj[dep] === undefined || dep_obj[dep] == null){
            //error dep
        }else{
            var $curSelectObj = $(this);
            $(this).empty();
            var head="请选择";
            var ui = "<option value='0' selected='selected' >" + head + "</option>";
            $(this).append(ui);
            $.each(dep_obj[dep],function(i,item){
                var ui="<option value='"+ item['id'] +"'>" + item['user_name'] + "</option>"
                $curSelectObj.append(ui);
            })
        }
    });
    //3.2   初始化控件 textarea
/*    var textareaOptions = {
        'maxCharacterSize': 50,
        'originalStyle': 'originalTextareaInfo',
        'warningStyle' : 'warningTextareaInfo',
        'warningNumber': 10,
        'displayFormat' : '#left Left / #max'
    };
    $('.module textarea').each(function(){
        $(this).textareaCount(textareaOptions);
    });
    $('.module textarea').elastic();*/

    //4.
    froozen_all_modules(true);
    froozen_all_modules(false);
    //------------------------------------------------------------------------------------------------------------------
    $(".module textarea").each(function(index,elem){
        $(this).attr({placeholder:"请输入:",maxlength:"500",cols:"50", rows:"1"});
        $(this).css({overflow:"visible"});
        $(this).on("input propertychange",function(){
            this.style.posHeight = this.scrollHeight;
        });
        this.style.height = this.scrollHeight + 1 + 'px';
    });
    $(".module input").each(function(index,elem){
        $(this).attr({placeholder:"请输入:",maxlength:"50"});
        var id = $(this).attr("id");
        //alert(id.substring(0,3));
        var dep = id.substring(0,3);
        if(dep == "sc_" || dep == "ys_" || dep == "sj_" || dep == "jd_" || dep == "ht_" || dep == "sh_" || dep == "hr_"
            || dep == "cg_" || dep == "gc_" || dep == "zj_"){
            $(this).addClass("recurly");
        }
    });
    $(".module table[jb_table]").each(function(index,elem){
        var cls = $(this).attr("jb_table");
        //alert(cls); bordered table1
        $(this).addClass("bordered");
    });
/*    $(".module select").each(function(index,elem){
        //alert(cls); bordered table1
        $(this).addClass("dropdown");
    });*/
    //------------------------------------------------------------------------------------------------------------------
    //5.
    if($("#lock").length >= 1){
        $("#lock").button().click(function(event){
            froozen_all_modules(true);
        });
    }
    if($("#unlock").length >= 1){
        $("#unlock").button().click(function(event){
            froozen_all_modules(false);
        });
    }
    //6.
    $('.module [jb_field=jb_select_save]').darkTooltip({
        animation:'flipIn',
        gravity:'west',
        //trigger:'click',
        confirm:true,
        theme:'light',
        content:'存盘?',
        onYes:function(ctl){
            //alert(ctl.attr("id"));
            var depcode = $("#user_department").val();
            var id = ctl.attr("id");
            if(id.substring(0,3) == (depcode + "_")){
                //alert(ctl.val());
                var ot_id = id + "_ot";
                var $ot_ctl = $("#" + ot_id);
                var ot_value = $ot_ctl.val();
                var requestData = {pro_id: $("#pro_id").val(),fieldname: ot_id,fieldvalue:ot_value};
                //console.log(requestData);
                $.get('/index.php/Home/AllInOne/ajaxSingleFieldSave', requestData, function(data) {
                    //alert("save ok");
                    //alert(data);
                    //alert(data.state + "," + data.msg);
                    if(false == data.state){
                        //jAlert(data.msg);
                        $ot_ctl.addClass("ui-state-error");
                    }else{
                        $ot_ctl.removeClass("ui-state-error");
                        $ot_ctl.css("background","#bbffaa");
                    }
                    //console.log(data);
                }).fail(function(jqXHR) {
                        jAlert("fail:" + jqXHR.status + jqXHR.responseText);
                    });
                //
                var base_id = id + "_base";
                var $base_ctl = $("#" + base_id);
                var base_value = $base_ctl.val();
                requestData = {pro_id: $("#pro_id").val(),fieldname: base_id,fieldvalue:base_value};
                $.get('/index.php/Home/AllInOne/ajaxSingleFieldSave', requestData, function(data) {
                    //alert("save ok");
                    //alert(data);
                    //alert(data.state + "," + data.msg);
                    if(false == data.state){
                        //jAlert(data.msg);
                        $base_ctl.addClass("ui-state-error");
                    }else{
                        $base_ctl.removeClass("ui-state-error");
                        $base_ctl.css("background","#bbffaa");
                    }
                    //console.log(data);
                }).fail(function(jqXHR) {
                        jAlert("fail:" + jqXHR.status + jqXHR.responseText);
                    });
            }
        }
    });

    $('.module [jb_field=jb_single_save]').darkTooltip({
        animation:'flipIn',
        gravity:'west',
        confirm:true,
        theme:'light',
        content:'存盘?',
        onYes:function(ctl){
            //alert(ctl.attr("id"));
            var depcode = $("#user_department").val();
            var id = ctl.attr("id");
            var zb_flag = $("#cur_project_sc_zb_flag").val();
            //落标后可以存其他部门字段
            if(id.substring(0,3) == (depcode + "_") || "A" == zb_flag){
                //alert(ctl.val());
                var requestData = {pro_id: $("#pro_id").val(),fieldname: ctl.attr("id"),fieldvalue:ctl.val()};
                //console.log(requestData);
                $.get('/index.php/Home/AllInOne/ajaxSingleFieldSave', requestData, function(data) {
                    //alert("save ok");
                    //alert(data);
                    //alert(data.state + "," + data.msg);
                    if(false == data.state){
                        jAlert(data.msg);
                        ctl.addClass("ui-state-error");
                    }else{
                        ctl.removeClass("ui-state-error");
                        ctl.css("background","#bbffaa");
                        if("sc_zb_flag" == id){
                            jAlert("请按 F5 刷新页面");
                        }
                    }
                    //console.log(data);
                }).fail(function(jqXHR) {
                        jAlert("fail:" + jqXHR.status + jqXHR.responseText);
                    });
            }
        }
    });


});
