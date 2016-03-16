function changeVisibility(dataUrl, id) {

    var $visibleID = $("#visibility-" + id).val();
    $.ajax({
        url: dataUrl,
        data: {
            ajaxSelectedValue: $visibleID,
            ajaxTopicId: id
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