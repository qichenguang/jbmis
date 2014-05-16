$(document).ready(function(){
    //jqGrid setting 开始.//////////////////////////////////////////////////////////////////////////////////////////////

    function pro_id_format( cellvalue, options, rowObject ){
        return '<a href="/index.php/Home/AllInOne/allmodules/pro_id/' + cellvalue + '"  target="_blank" >' + cellvalue + '</a>';
    }
    function pro_id_unformat(cellvalue, options, cell){
        return $('a', cell).text();
    }

    var projectsearchListGrid = jQuery("#projectsearchlist").jqGrid({
        url:'/index.php/Home/Project/ajaxProjectSearchSearch',
        datatype: "json",
        mtype: 'POST',
        colNames:['ID','项目ID', '项目名称'],
        colModel:[
            {name:'id',index:'id',
                width:20,align:"right",
                sortable:true,
                editable:false,
                editoptions:{readonly:true,size:100}
            },
            {name:'pro_id',index:'pro_id',
                width:150,align:"right",
                sortable:true,
                editable:true, edittype:"text",editrules:{required:true},
                editoptions:{size:"20"},
                formatter:pro_id_format, unformat:pro_id_unformat,
            formoptions:{rowpos:1, label: "项目ID", elmprefix:"(*)"}
            },
            {name:'sc_pro_name',index:'sc_pro_name',
                width:150,align:"right",
                sortable:true,
                editable:true, edittype:"text",editrules:{required:true},
                editoptions:{size:"20"},
                formoptions:{rowpos:2, label: "项目名称", elmprefix:"(*)"}
            }
        ],
        hiddengrid: false,
        autowidth: true,
        rownumbers: true,
        rowNum:10,
        rowList:[10,20,30],
        pager: '#pprojectsearchlist',
        viewrecords: true,
        sortorder: "desc",
        forceFit : true,
        caption:"项目查询",
        onSelectRow: function(id){
/*            var rowid = jQuery("#projectsearchlist").jqGrid('getGridParam','selrow');
            if(rowid){
                var rowData = $("#projectsearchlist").jqGrid('getRowData',rowid);
                alert(rowData.pro_id);
            }*/
        }
    });

    //导航栏配置和CRUD函数
    jQuery("#projectsearchlist").jqGrid('navGrid','#pprojectsearchlist',
        {view:false,edit:false,add:false,del:false,search:false}
    );

    //其他配置
    jQuery("#projectsearchlist").jqGrid('gridResize',{minWidth:350,maxWidth:1000,minHeight:80, maxHeight:350});
    jQuery("#projectsearchlist").jqGrid('sortableRows');
    jQuery("#projectsearchlist").jqGrid('filterToolbar');
    jQuery("#projectsearchlist").jqGrid('navButtonAdd',"#pprojectsearchlist",{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s',
        onClickButton:function(){
            projectsearchListGrid[0].toggleToolbar();
        }
    });
    //jqGrid setting 结束///////////////////////////////////////////////////////////////////////////////////////////////
});