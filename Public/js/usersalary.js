$(document).ready(function(){
    //jqGrid setting 开始.//////////////////////////////////////////////////////////////////////////////////////////////
    //用户工资管理
    function setUserSalaryCommJqGrid(domTableId,domPageId,cur_user_id){
        var search_url = '/index.php/Home/User/ajaxUserSalarySearch';
        var save_url = '/index.php/Home/User/ajaxUserSalarySave';
        var colNames = ['ID','用户名称', '邮件地址', '部门','工资'];
        var caption_str = "工资管理";
        var $usersalarygridobj = jQuery(domTableId).jqGrid({
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
                {name:'user_name',index:'user_name',
                    width:30,align:"right",
                    sortable:true,
                    editable:false, edittype:"text",editrules:{required:false},
                    editoptions:{size:"30"},
                    formoptions:{rowpos:2, label: "用户姓名", elmprefix:"(*)"}
                },
                {name:'email',index:'email',
                    width:50, align:"right",
                    sortable:true,
                    editable:false, edittype:"text", editrules:{email:true,required:false},
                    editoptions:{size:"50",maxlength:"150"},
                    formoptions:{ rowpos:3,label: "邮箱地址",elmprefix:"(*)"}
                },
                {name:'department',index:'department',
                    width:20, align:"center",
                    sortable:true,
                    stype:'select',//查询类型
                    editable:false,edittype:"select",
                    editoptions:{
                        value:{
                            'all':"全部",
                            'cg':"采购管理部",
                            'sh':"售后服务部",
                            'hr':"行政人事部",
                            'gc':"工程管理部",
                            'jd':"机电管理部",
                            'sj':"设计管理部",
                            'sc':"市场管理部",
                            'ys':"预算管理部",
                            'ht':"合同管理部",
                            'gl':"管理部"
                        },
                        defaultValue:"all"
                    },
                    editrules:{required:true},
                    formoptions:{ rowpos:4,label: "所属部门",elmprefix:"(*)"}
                },
                {name:'salary',index:'salary',
                    width:30,align:"right",
                    sortable:true,
                    editable:true, edittype:"text",editrules:{required:true},
                    editoptions:{size:"30"},
                    formoptions:{rowpos:5, label: "工资", elmprefix:"(*)"}
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
            {view:true,search:false,edit:false,add:false,del:false,alerttext:"请选择需要操作的数据行!"}
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
            add: false,
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
                     $usersalarygridobj[0].toggleToolbar();
                 }
             });
         }
    }
    setUserSalaryCommJqGrid("#usersalarylist","#pusersalarylist",$("#user_id").val());
    //------------------------------------------------------------------------------------------------------------------
    //jqGrid setting 结束///////////////////////////////////////////////////////////////////////////////////////////////
});