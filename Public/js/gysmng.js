$(document).ready(function(){
    //jqGrid setting 开始.//////////////////////////////////////////////////////////////////////////////////////////////
    //供应商管理
    function setGysmngCommJqGrid(domTableId,domPageId,cur_user_id){
        var search_url = '/index.php/Home/Gys/ajaxGysmngSearch';
        var save_url = '/index.php/Home/Gys/ajaxGysmngSave';
        var colNames = ['ID','供应商名称','供应商类型','联系人姓名','联系人电话','邮箱地址','状态'];
        var caption_str = "供应商管理";
        var $gyscommgridobj = jQuery(domTableId).jqGrid({
            url: search_url,
            datatype: "json",
            mtype: 'POST',
            postData: {user_id:cur_user_id},
            colNames: colNames,
            colModel:[
                {name:'id',index:'id',
                    width:20,align:"right",
                    sortable:true,
                    editable:false,
                    editoptions:{readonly:true,size:20}
                },
                {name:'gys_name',index:'gys_name',
                    width:100,align:"right",
                    sortable:true,
                    editable:true, edittype:"text",editrules:{required:true},
                    editoptions:{size:"100"},
                    formoptions:{rowpos:2, label: "供应商名称", elmprefix:"(*)"}
                },
                {name:'gys_type',index:'gys_type',
                    width:30, align:"center",
                    sortable:true,
                    stype:'select',//查询类型
                    editable:true,edittype:"select",
                    editoptions:{
                        value:{
                            '0':"全部",
                            'zx':"装修",
                            'jd':"机电"
                        },
                        defaultValue:"0"
                    },
                    editrules:{required:true},
                    formoptions:{ rowpos:3,label: "供应商类型",elmprefix:"(*)"}
                },
                {name:'lxr_name',index:'lxr_name',
                    width:30,align:"right",
                    sortable:true,
                    editable:true, edittype:"text",editrules:{required:true},
                    editoptions:{size:"30"},
                    formoptions:{rowpos:4, label: "联系人姓名", elmprefix:"(*)"}
                },
                {name:'lxr_phone',index:'lxr_phone',
                    width:30,align:"right",
                    sortable:true,
                    editable:true, edittype:"text",editrules:{required:true},
                    editoptions:{size:"30"},
                    formoptions:{rowpos:5, label: "联系人电话", elmprefix:"(*)"}
                },
                {name:'email',index:'email',
                    width:30, align:"right",
                    sortable:true,
                    editable:true, edittype:"text", editrules:{email:true},
                    editoptions:{size:"30",maxlength:"30"},
                    formoptions:{ rowpos:6,label: "邮箱地址",elmprefix:"(*)"}
                },
                {name:'status',index:'status',
                    width:30, align:"center",
                    sortable:true,
                    stype:'select',//查询类型
                    editable:true,edittype:"select",
                    editoptions:{value:{
                        '0':"全部",
                        '1':"新增(待审核)",
                        '2':"正常(已审核)",
                        '3':"注销(已删除)"},defaultValue:"0"},
                    editrules:{required:true},
                    formoptions:{ rowpos:7,label: "状态",elmprefix:"(*)"}
                }
            ],
            hiddengrid: false,
            autowidth: true,
            rownumbers: true,
            rowNum:20,
            rowList:[20,30,50],
            pager: domPageId,
            viewrecords: true,
            sortorder: "desc",
            forceFit : true,
            editurl: save_url,
            caption:caption_str,
            onSelectRow: function(id){
                //
            },
            onCellSelect: function(rowid,iCol,cellcontent,e){
                //alert("cellselect" + cellcontent);
            },
            afterInsertRow:function(rowid,rowdata,rowelem){
                //alert(rowid);
            }
        });

        //导航栏配置和CRUD函数
        jQuery(domTableId).jqGrid('navGrid',domPageId,
            {view:true,search:false,edit:false,add:false,del:true,alerttext:"请选择需要操作的数据行!"}
        );
        //
        var addparameters = {
            //
            rowID : "new_row",
            initdata : {},
            position :"first",
            useDefValues : false,
            useFormatter : false,
            addRowParams : {
                extraparam:{user_id:cur_user_id},
                successfunc : function(xhr){
                    var result = eval('(' + xhr.responseText + ')');
                    if(true == result.state){
                        jQuery(domTableId).trigger("reloadGrid");
                        return true;
                    }else{
                        jAlert(result.msg);
                        jQuery(domTableId).trigger("reloadGrid");
                        return true;
                    }
                }
            }
        }
        //
        var editparameters = {
            "keys" : false,
            oneditfunc: null,
            "successfunc" : function(xhr){
                var result = eval('(' + xhr.responseText + ')');
                if(true == result.state){
                    return true;
                }else{
                    jAlert(result.msg);
                    return true;
                }
            },
            "url" : null,
            "extraparam" : {user_id:cur_user_id},
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
        jQuery(domTableId).jqGrid('gridResize',{minWidth:1500,maxWidth:2000,minHeight:500, maxHeight:1000});
        jQuery(domTableId).jqGrid('sortableRows');

         jQuery(domTableId).jqGrid('filterToolbar');
         if($(domPageId + ":contains(Toggle)").length < 1){
             jQuery(domTableId).jqGrid('navButtonAdd',domPageId,{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s',
                 onClickButton:function(){
                     $gyscommgridobj[0].toggleToolbar();
                 }
             });
         }
    }
    setGysmngCommJqGrid("#gysmnglist","#pgysmnglist",$("#user_id").val());

    //------------------------------------------------------------------------------------------------------------------
    //jqGrid setting 结束///////////////////////////////////////////////////////////////////////////////////////////////
});