$(document).ready(function() {

    var mygrid = jQuery("#crud").jqGrid({
        url:'http://127.0.0.1:8088/Application/Jqgrid/search.php?q=1',
        datatype: "json",

        colNames:[' ','Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
        colModel:[
            {name: 'myac', width:80, fixed:true, sortable:false, resize:false, formatter:'actions',formatoptions:{keys:true}},
            {name:'id',index:'id', width:55},
            {name:'invdate',index:'invdate', width:90,editable:true},
            {name:'name',index:'name asc, invdate', width:100,editoptions:{size:"20",maxlength:"30"}},
            {name:'amount',index:'amount', width:80, align:"right",editable:true,editoptions:{size:"20",maxlength:"30"},editrules:{number:true}},
            {name:'tax',index:'tax', width:80, align:"right",editable:true,edittype:"select",editoptions:{value:"sc:市场部;IN:计划表;TN:TNT;AR:ARAMEX"}},
            {name:'total',index:'total', width:80,align:"right",editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"}},
            {name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}}
        ],
/*        rowNum:10,
        rowTotal: 50,
        rowList:[10,20,30],
        pager: '#pcrud',
        sortname: 'id',
        loadonce: true,
        viewrecords: true,
        sortorder: "desc",
        editurl: 'server.php', // this is dummy existing url
        caption:"CRUD on Local Data"*/
        rownumbers: true,
        rowNum:10,
        rowList:[10,20,30],
        pager: '#pcrud',
        sortname: 'id',
        //loadonce: true,
        viewrecords: true,
        sortorder: "asc",
        editurl: 'http://127.0.0.1:8088/Application/Jqgrid/search.php?q=1', // this is dummy existing url
        caption:"Cell Edit Example",
        forceFit : true,
        cellEdit: true,
        cellsubmit: 'clientArray',

        hiddengrid: false,
        multiselect: true,
        gridComplete: function() {
            $("#_empty","#crud").addClass("nodrag nodrop");
            jQuery("#crud").tableDnDUpdate();
        },
        afterEditCell: function (id,name,val,iRow,iCol){
            if(name=='invdate') {
                jQuery("#"+iRow+"_invdate","#crud").datepicker({dateFormat:"yy-mm-dd"});
            }
        },
        afterSaveCell : function(rowid,name,val,iRow,iCol) {
            if(name == 'amount') {
                var taxval = jQuery("#crud").jqGrid('getCell',rowid,iCol+1);
                jQuery("#crud").jqGrid('setRowData',rowid,{total:parseFloat(val)+parseFloat(taxval)});
            }
            if(name == 'tax') {
                var amtval = jQuery("#crud").jqGrid('getCell',rowid,iCol-1);
                jQuery("#crud").jqGrid('setRowData',rowid,{total:parseFloat(val)+parseFloat(amtval)});
            }
        }
    });
    jQuery("#crud").jqGrid('navGrid','#pcrud',{});
    jQuery("#crud").jqGrid('gridResize',{minWidth:350,maxWidth:1000,minHeight:80, maxHeight:350});
    jQuery("#crud").jqGrid('sortableRows');
    jQuery("#crud").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    jQuery("#crud").jqGrid('navButtonAdd',"#pcrud",{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s',
        onClickButton:function(){
            mygrid[0].toggleToolbar()
        }
    });
    jQuery("#crud").jqGrid('navButtonAdd',"#pcrud",{caption:"Clear",title:"Clear Search",buttonicon :'ui-icon-refresh',
        onClickButton:function(){
            mygrid[0].clearToolbar()
        }
    });
;
    jQuery("#crud").jqGrid('navButtonAdd','#pcrud',{caption:"测试按钮",
        onClickButton:function(){
            var gsr = jQuery("#crud").jqGrid('getGridParam','selrow');
            if(gsr){
                alert('您选择了第'+gsr+'行数据');
                //var rowData = $("#crud").getRowData(gsr);
                //alert(rowData.name);//显示选中行的电子邮件列
            }else{
                alert("请选择一行数据");
            }
        }
    });
});



