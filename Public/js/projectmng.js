$(document).ready(function() {

    var projectListGrid = jQuery("#projectlist").jqGrid({
        url:'/index.php/Home/Project/search/q/1',
        datatype: "json",
        //mtype: 'POST',
        colNames:['ID','项目ID', '项目名称','项目状态'],
        colModel:[
            {name:'id',index:'id',
                width:100,align:"right",
                sortable:true,
                editable:false,
                editoptions:{readonly:true,size:100}
            },
            {name:'pro_id',index:'pro_id',
                width:150,align:"right",
                sortable:true,
                editable:true, edittype:"text",editrules:{required:true},
                editoptions:{size:"20"},
                formoptions:{rowpos:1, label: "项目ID", elmprefix:"(*)"}
            },
            {name:'sc_pro_name',index:'sc_pro_name',
                width:150,align:"right",
                sortable:true,
                editable:true, edittype:"text",editrules:{required:true},
                editoptions:{size:"20"},
                formoptions:{rowpos:2, label: "项目名称", elmprefix:"(*)"}
            },
            {name:'status',index:'status',
                width:150, align:"center",
                sortable:true,
                stype:'select',//查询类型
                editable:true,edittype:"select",
                //editoptions:{value:"sc:市场部;IN:计划表;TN:TNT",defaultValue:"IN"},
                //editoptions:{dataUrl : '/index.php/Home/User/search/q/2',defaultValue:"IN"},
                editoptions:{value:{
                    '0':"全部",
                    '1':"新增(待审核)",
                    '2':"正常(已审核)",
                    '3':"注销(已删除)"},defaultValue:"0"},
                editrules:{required:true},
                formoptions:{ rowpos:3,label: "项目状态",elmprefix:"(*)"}
            }
        ],
        hiddengrid: false,
        autowidth: true,
        rownumbers: true,
        rowNum:10,
        rowList:[10,20,30],
        pager: '#pprojectlist',
        //sortname: 'id',
        viewrecords: true,
        sortorder: "desc",
        forceFit : true,
        //cellEdit: true,
        //cellsubmit: 'clientArray',
        //cellurl : '/url/to/handling/the/changed/cell/value'
        editurl: '/index.php/Home/Project/ajaxSave', // this is dummy existing url
        caption:"项目管理"
    });

    //导航栏配置和CRUD函数
    jQuery("#projectlist").jqGrid('navGrid','#pprojectlist',
        {view:false,search:false}, //导航栏 按钮 是否显示 options
        {   // edit options begin
            mtype:'GET',
            height:290,
            modal: true, //模态显示
            drag: true,  //窗体是否可以拖动
            //addCaption: "新建公司简介",
            //bSubmit: "保存",
            //bCancel: "取消",
            topinfo:"(*) 为必填字段",
            bottominfo:"带 (*) 表示是必填字段",
            processData: "数据保存中...",
            jqModal:true,
            reloadAfterSubmit:true,
            closeOnEscape:true,
            closeAfterEdit:true,
            onclickSubmit: function(params, postdata) {//fires after the submit button is clicked and the postdata is constructed
                //alert('onclickSubmit!');
                postdata.id = jQuery("#projectlist").jqGrid('getGridParam','selrow'); //opt.actRowid;    // 确保能取到master grid的rowid!
                return postdata;
            },
            afterSubmit: function(xhr, postdata) {//fires after response has been received from server
                //alert('afterSubmit!');
                //[success, message, new_id];
                var result = eval('(' + xhr.responseText + ')');//动态页返回json格式的字符串，如{success:true/false}之类的，为false添加err属性什么的，成功则返回new_id
                //console.log(xhr);
                //console.log(result);
                //console.log(result.state);
                //console.log(result.msg);
                return [result.state,result.msg];
            },
            afterComplete: function(response, postdata, formid) {//This event fires immediately after all actions and events are completed and the row is inserted or updated in the grid.
                //alert('afterComplete!');
                //jQuery("#userlist").trigger('reloadGrid');
            }

        }, // edit options end
        {  // add options begin
            mtype:'GET',
            height:290,
            modal: true, //模态显示
            drag: true,  //窗体是否可以拖动
            //addCaption: "新建公司简介",
            //bSubmit: "保存",
            //bCancel: "取消",
            topinfo:"(*) 为必填字段",
            bottominfo:"带 (*) 表示是必填字段",
            processData: "数据保存中...",
            jqModal:true,
            reloadAfterSubmit:true,
            closeOnEscape:true,
            clearAfterAdd:true,
            closeAfterAdd:true,
            onclickSubmit: function(params, postdata) {//fires after the submit button is clicked and the postdata is constructed
                //alert('onclickSubmit!');
                return postdata;
            },
            afterSubmit: function(xhr, postdata) {//fires after response has been received from server
                //alert('afterSubmit!');
                var result = eval('(' + xhr.responseText + ')');//动态页返回json格式的字符串，如{success:true/false}之类的，为false添加err属性什么的，成功则返回new_id
                //console.log(xhr);
                //console.log(result);
                //console.log(result.state);
                //console.log(result.msg);
                return [result.state,result.msg,result.id];
            },
            afterComplete: function(response, postdata, formid) {//This event fires immediately after all actions and events are completed and the row is inserted or updated in the grid.
                //alert('afterComplete!');
                //jQuery("#userlist").trigger('reloadGrid');
            }

        }, // add options end
        {mtype:'GET',reloadAfterSubmit:false,jqModal:false, closeOnEscape:true}, // del options
        {closeOnEscape:true}, // search options
        {height:250,jqModal:false,closeOnEscape:true} // view options
    );

    //其他配置
    jQuery("#projectlist").jqGrid('gridResize',{minWidth:350,maxWidth:1000,minHeight:80, maxHeight:350});
    jQuery("#projectlist").jqGrid('sortableRows');
    jQuery("#projectlist").jqGrid('filterToolbar');
    jQuery("#projectlist").jqGrid('navButtonAdd',"#pprojectlist",{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s',
        onClickButton:function(){
            projectListGrid[0].toggleToolbar();
        }
    });
    jQuery("#projectlist").jqGrid('navButtonAdd',"#pprojectlist",{caption:"授权",title:"项目授权",
        onClickButton: function(){
            var gsr = jQuery("#projectlist").jqGrid('getGridParam','selrow');
            if(gsr){
                alert('您选择了第'+gsr+'行数据');
                var rowData = $("#projectlist").jqGrid('getRowData',gsr);
                alert(rowData.pro_id);//显示选中行的电子邮件列
                initMyZtree(rowData.pro_id);
            }else{
                alert("请选择一行数据");
            }
        },
        position:"last"
    });
});