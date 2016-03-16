function changeSeriousness(dataUrl,id) {
    var $seriousID= $("#seriousness-"+id).val()
    $.ajax({
        url: dataUrl,
        data: {
            ajaxSelectedValue: $seriousID,
            ajaxSubscriptionId: id
        },
        success: function (data) {
            console.log(data)
        },
        error: function () {
            var errorData = "There are some errors try after Some time";
            alert(errorData);
        }
    });
}