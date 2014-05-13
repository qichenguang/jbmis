$(document).ready(function() {
    //
    function hide_all_module(){
        $("#module_xmjbxx").accordion({ collapsible: true, autoHeight: true });
        $("#module_xmscfx").accordion({ collapsible: true, autoHeight: true });
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
    function allInOne_init(){
        //2.second show can use model.
        var dep_mod_arr = $("#dep_module").val().split(",");
        $.each(dep_mod_arr, function(key, val) {
            $('#' + val).show();
            // firebug console
            //console.log('index in arr:' + key + ", corresponding value:" + val);
            // 如果想退出循环
            // return false;
        });

        var dep_sx_arr = $("#dep_sx").val().split(",");
        var rec_json_str = $("#dep_rec_detail").val();
        //console.log(rec_json_str);
        var rec_obj = $.parseJSON(rec_json_str);
        //console.log(rec_obj['sc']);
        var depcode = $("#department").val();
        $(".module .jb_field").each(function() {
                var id = $(this).attr('id');
                //console.log($(this).attr('id'));

                var cur_dep_code = id.substring(0,2);
                //console.log(cur_dep_code,id);
                var cur_pos_2 = id.substring(2,3);
                //console.log(cur_dep_code,cur_pos_2);
                if($.inArray(cur_dep_code, dep_sx_arr) && cur_pos_2 == "_"){
                    //assign all ctl value
                    var curVal = "没有值";
                    if(rec_obj[cur_dep_code] === undefined || rec_obj[cur_dep_code] == null){
                        //
                    }else if(rec_obj[cur_dep_code][id] === undefined || rec_obj[cur_dep_code][id] == null){
                        //
                    }else{
                        curVal = rec_obj[cur_dep_code][id];
                        console.log(id,curVal);
                    }
                    $(this).val(curVal);
                    //judge dep and enable it.
                    $(this).attr("disabled",true);
                    if(id.substring(0,3) == (depcode + "_")){
                        $(this).attr("disabled",false);
                    }
                }
            }
        );
    };
    //1.
    hide_all_module();
    allInOne_init();
});
