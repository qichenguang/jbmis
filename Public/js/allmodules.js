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
        console.log(rec_json_str);
        var rec_obj = $.parseJSON(rec_json_str);
        console.log(rec_obj);
        var depcode = $("#department").val();
        $(".module [jb_field]").each(function() {
            var id = $(this).attr('id');
            //console.log($(this).attr('id'));
            var cur_dep_code = id.substring(0,2);
            //console.log(cur_dep_code,id);
            var cur_pos_2 = id.substring(2,3);
            //console.log(cur_dep_code,cur_pos_2);
            if(($.inArray(cur_dep_code, dep_sx_arr) >=0) && cur_pos_2 == "_"){
                var curVal = "没有值";
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
                    if("没有值" == curVal){
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
        noneSelectedText: "请选择一项",
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
    var textareaOptions = {
        'maxCharacterSize': 50,
        'originalStyle': 'originalTextareaInfo',
        'warningStyle' : 'warningTextareaInfo',
        'warningNumber': 10,
        'displayFormat' : '#left Left / #max'
    };
    $('.module textarea').each(function(){
        $(this).textareaCount(textareaOptions);
    });
    $('.module textarea').elastic();
    //4.
    froozen_all_modules(true);
    froozen_all_modules(false);
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
            var depcode = $("#department").val();
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
            var depcode = $("#department").val();
            var id = ctl.attr("id");
            if(id.substring(0,3) == (depcode + "_")){
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
                    }
                    //console.log(data);
                }).fail(function(jqXHR) {
                        jAlert("fail:" + jqXHR.status + jqXHR.responseText);
                    });
            }
        }
    });

    function setVoJqGrid(domTableId,domPageId,cur_pos_id){
        console.log(cur_pos_id);
        var $gridobj = jQuery(domTableId).jqGrid({
            url:'/index.php/Home/AllInOne/ajaxCustomervomngSearch',
            datatype: "json",
            mtype: 'POST',
            postData: {pos_id:cur_pos_id},
            colNames:['ID','类型','描述','原因'],
            colModel:[
                {name:'id',index:'id',
                    width:20,align:"right",
                    sortable:true,
                    editable:false,
                    readonly:true,
                    editoptions:{readonly:true,size:100}
                },
                {name:'vo_type',index:'vo_type',
                    width:30, align:"center",
                    sortable:true,
                    stype:'select',//查询类型
                    editable:true,edittype:"select",
                    editoptions:{value:{
                        '0':"全部",
                        'zx':"装修",
                        'dq':"电气",
                        'kt':"空调",
                        'xf':"消防",
                        'jps':"给排水",
                        'it':"IT",
                        'sec':"SEC",
                        'av':"AV"
                    },defaultValue:"zx"},
                    editrules:{required:true},
                    formoptions:{ rowpos:1,label: "类型",elmprefix:"(*)"}
                },
                {name:'vo_desc',index:'vo_desc',
                    width:150,align:"right",
                    sortable:true,
                    editable:true, edittype:"text",editrules:{required:true},
                    editoptions:{size:150},
/*                    editable:true, edittype:"textarea",editrules:{required:true},
                    editoptions:{rows:"3",cols:"30"},*/
                    formoptions:{rowpos:2, label: "描述", elmprefix:"(*)"}
                },
                {name:'vo_reson',index:'vo_reson',
                    width:30, align:"center",
                    sortable:true,
                    stype:'select',//查询类型
                    editable:true,edittype:"select",
                    editoptions:{value:{
                        '0':"全部",
                        'A': "客户变更",
                        'B': "范围变更",
                        'C': "代客户采购",
                        'D': "设计公司变更",
                        'E': "大厦或消防要求",
                        'F': "现场条件不符",
                        'G': "其它"
                    },defaultValue:"A"},
                    editrules:{required:true},
                    formoptions:{ rowpos:3,label: "原因",elmprefix:"(*)"}
                }
            ],
            hiddengrid: false,
            autowidth: true,
            rownumbers: true,
            rowNum:10,
            rowList:[10,20,30],
            pager: domPageId,
            viewrecords: true,
            sortorder: "desc",
            forceFit : true,
            editurl: '/index.php/Home/AllInOne/ajaxCustomervomngSave',
            caption:"",
            onSelectRow: function(id){
            }
        });

        //导航栏配置和CRUD函数
        jQuery(domTableId).jqGrid('navGrid',domPageId,
            {view:false,search:false,edit:false,add:false,del:true}
        );
        //
        var addparameters = {
            rowID : "new_row",
            initdata : {},
            position :"first",
            useDefValues : false,
            useFormatter : false,
            addRowParams : {extraparam:{pro_id:cur_pos_id}}
        }
        //
        var editparameters = {
            "keys" : false,
            "oneditfunc" : null,
            "successfunc" : function(xhr){
                //alert("successfunc");
                //console.log(xhr);
                var result = eval('(' + xhr.responseText + ')');
                if(true == result.state){
                    //alert(result.msg);
                    return true;
                }else{
                    jAlert(result.msg);
                    return true;
                }
            },
            "url" : null,
            "extraparam" : {pro_id:cur_pos_id},
            "aftersavefunc" : null,
            "errorfunc": null,
            "afterrestorefunc" : null,
            "restoreAfterError" : true,
            "mtype" : "POST"
        }
        var parameters = {
            edit: true,
            editicon: "ui-icon-pencil",
            add: true,
            addicon:"ui-icon-plus",
            save: true,
            saveicon:"ui-icon-disk",
            cancel: true,
            cancelicon:"ui-icon-cancel",
            addParams : addparameters,
            editParams : editparameters
        }
        jQuery(domTableId).jqGrid('inlineNav',domPageId,parameters);


        //其他配置
        jQuery(domTableId).jqGrid('gridResize',{minWidth:350,maxWidth:1000,minHeight:80, maxHeight:350});
        jQuery(domTableId).jqGrid('sortableRows');
        jQuery(domTableId).jqGrid('filterToolbar');
        if($(domPageId + ":contains(Toggle)").length < 1){
            jQuery(domTableId).jqGrid('navButtonAdd',domPageId,{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s',
                onClickButton:function(){
                    $gridobj[0].toggleToolbar();
                }
            });
        }
    }
    function showVOJqGriddialog(domDialogId){
        var dialogOpts = {
            title: "VO",
            bgiframe: true,
            resizable: true,
            width: 800,
            height:500,
            modal: true,
            overlay: {
                backgroundColor: '#000',
                opacity: 0.5
            },
            open: function() {
                setVoJqGrid("#testdq","#testpdq",$("#pro_id").val());
            },
            buttons: {
                "Ok": function() {
                    $(this).dialog('close');
                } ,
                "Cancel": function() {
                    $(this).dialog('close');
                }
            }
        }
        $(domDialogId).dialog(dialogOpts);
    }
    $('.module').on('click','[jb_field=jb_multi_save]',function(event){
        showVOJqGriddialog("#testdialog");
        return false;
    })
});
