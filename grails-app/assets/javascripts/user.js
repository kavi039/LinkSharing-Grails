function callSortUsers(dataUrl) {
    $.ajax({
        url: dataUrl,
        data: "ajaxSelectedValue=" + $("#users").val(),
        success: function (data) {
            $("#userDetails").html(data);
        },
        error: function () {
            var errorData = "There are some errors try after Some time";
            alert(errorData);
        }
    });
}

function searchUser(dataUrl) {
    console.log(dataUrl)
    $.ajax({
        url: dataUrl,
        data: "ajaxSearchIt=" + $(".search-User").val(),
        success: function (data) {
            var successData = "successfullyDone";
            $("#userDetails").html(data);
        },
        error: function () {
            var errorData = "Please Enter Some Text To Search";
            alert(errorData);
        }
    });

}