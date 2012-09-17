$("#addItem").click(function () {
    $.ajax({
        url: this.href,
        cache: false,
        success: function (html) { $("#editorRows").append(html); }
    });
    return false;
});

$("a.deleteRow").live("click", function () {
    $(this).parents("div.editorRow:first").remove();
    return false;
});

//$("#add").live('click', function () {
//    var gui = GetRandomGUI();
//    var htm = '<div class="editorRow">';
//    htm += '<input type="hidden" autoComplete = "off" name = "OrderLines.index" value = "' + gui + '"/>';
//    htm += 'Item: <input type = "text" name = "OrderLines[' + gui + '].ProductID" id = "xyzy" />';
//    htm += ' Quantity: <input type = "text" name = "OrderLines[' + gui + '].Quantity" size="4" id = "xyzy1" /> <a href="#" class="deleteRow">delete</a></div>';
//    $('#orderDetail').append(htm);
//    return false;
//});
$('#add').live('click', function () {
    obj = { randomNumber: GetRandomGUI() }
    $("#OrderLine").tmpl(obj).appendTo("#orderDetail");
    $.validator.unobtrusive.parseDynamicContent('div.editorRow:last');
    return false;
});
function GetRandomGUI() {
    var val = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
    return val;
}

/*------------------------------Validation Extension from Xhalent--------------------------------*/
//url:http://xhalent.wordpress.com/2011/01/24/applying-unobtrusive-validation-to-dynamic-content/


(function ($) {
    $.validator.unobtrusive.parseDynamicContent = function (selector) {
        //use the normal unobstrusive.parse method

        //$.validator.unobtrusive.parse(selector);
        $(selector).find('*[data-val = true]').each(function(){
        
            $.validator.unobtrusive.parseElement(this,false);
        });

        //get the relevant form
        var form = $(selector).first().closest('form');
        
        //get the collections of unobstrusive validators, and jquery validators
        //and compare the two
        var unobtrusiveValidation = form.data('unobtrusiveValidation');
        var validator = form.validate();
        $.each(unobtrusiveValidation.options.rules, function (elname, elrules) {
            if (validator.settings.rules[elname] == undefined) {
                var args = {};
                $.extend(args, elrules);
                args.messages = unobtrusiveValidation.options.messages[elname];
                //alert('here1');
                
                $('[name="' + elname + '"]').rules("add", args);
            } else {
                $.each(elrules, function (rulename, data) {
                    rulename = rulename;
                    data = data;
                    if (validator.settings.rules[elname][rulename] == undefined) {
                        var args = {};
                        args[rulename] = data;
                        args.messages = unobtrusiveValidation.options.messages[elname][rulename];
                        alert('here');
                        
                        $('[name="' + elname + '"]').rules("add", args);
                    }
                });
            }
        });
    }
})($);
/*--------------------------------------------------------------------------------------------------*/
