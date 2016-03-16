$(document).ready(function () {
    var $doc = $(document);
    $doc.on("click", '#invitation', function () {
        openDialog("dialog", 450, 350, "Invite Document");
    });

    $('#create').click(function () {
        openDialog("dialog1", 450, 400, "Create a new Topic");
    });

    $('#link').click(function () {
        openDialog("dialog3", 450, 480, "Create a Link Resource");
    });

    $('#doc').click(function () {
        openDialog("dialog2", 450, 480, "Create a Document Resource");
    });

    $doc.on("click", ".subscribe", function () {
        $.ajax({
            url: $(this).attr("data-ajax-url"),
            success: function (data) {
                var successData = "successfullyDone";
                $("#subscribeUserModalDiv").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".deleteResource", function () {
        $.ajax({
            url: $(this).attr("data-ajax-url"),
            success: function (data) {
                var successData = "successfullyDone";
                $("#deleteResourceDiv").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".deletePost", function () {
        var $resourceId = $(this).attr('data-resource-id');
        $.ajax({
            url: $(this).attr("data-ajax-url"),
            data:{
                ajaxResourceId: $resourceId,
                ajaxCheckAction:true
            },
            success: function () {
                $("#deleteResource-" + $resourceId).hide(250);
                location.reload()
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".unSubscribe", function () {
        var closestDiv = $(this).closest(".trendingTopic");
        $.ajax({
            url: $(this).attr("data-ajax-url"),
            success: function (data) {
                var successData = "successfullyDone";
                closestDiv.html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", "#toggle1", function () {
        $('#collapseOne').collapse('toggle')
    });

    $doc.on("click", "#toggle2", function () {
        $('#collapseTwo').collapse('toggle')
    });

    $doc.on("click", ".openTopicPost", function () {
        $.ajax({
            url: $(this).attr("data-ajax-url"),
            data: "ajaxTopicId=" + $(this).attr('data-topic-id'),
            success: function (data) {
                $(".topicClickPost").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".editThisTopic", function () {
        var $element = $(this);
        $.ajax({
            url: $element.attr("data-ajax-url"),
            data: "ajaxEditTopicId=" + $(this).attr('data-topic-id'),
            success: function (data) {
                $element.closest(".editName").find(".letsChangeName").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".deleteThisTopic", function () {
        var $element = $(this);
        var $topicId = $(this).attr('data-topic-id');
        console.log($topicId)
        $.ajax({
            url: $element.attr("data-ajax-url"),
            data: {
                ajaxDeleteTopicId: $topicId,
                ajaxCheckAction:true
            },
            success: function (data) {
                $("#delete-" + $topicId).hide(250).empty()
                location.reload()
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".markReadUnRead-user", function () {
        var $element = $(this), successHandler = function (data) {
            $element.closest(".userResources").html(data);
            var successData = "successfullyDone";
        };
        markAsReadUnread($element, successHandler);
    });

    $doc.on("click", ".markReadUnRead-inbox", function () {
        console.log("from inbox read");
        var $element = $(this), successHandler = function (data) {
            $element.closest(".userResources").hide(250).empty();
            var successData = "successfullyDone";
        };
        markAsReadUnread($element, successHandler);
    });

    $doc.on("click", ".newName", function () {
        var $element = $(this);
        var $textBoxID = $("#newNameof").val();
        $.ajax({
            url: $element.data("ajax-url"),
            data: {
                ajaxTextBoxValue: $textBoxID
            },
            success: function (data) {
                $element.closest(".letsChangeName").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });

    $doc.on("click", ".newNameBtnClass", function () {
        var $element = $(this);
        var $textBoxID = $("#newNameof").val();
        console.log($textBoxID)
        $.ajax({
            url: $element.attr("data-ajax-url"),
            data: {
                ajaxTopicId: $element.attr("data-topic-id"),
                ajaxTextBoxValue: $textBoxID
            },
            success: function (data) {
                $element.closest(".letsChangeName").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });
});


function openDialog(elementId, w, h, title) {
    $("#" + elementId).dialog({
        resizable: false,
        modal: true,
        title: title,
        draggable: false,
        height: h,
        width: w,
        position: ({
            my: "center",
            at: "top"
        })
    });
}

function markAsReadUnread($element, successHandler) {

    $.ajax({
        url: $element.attr("data-ajax-url"),
        data: "ajaxResourceId=" + $element.attr('data-resource-id'),
        success: successHandler,
        error: function () {
            var errorData = "There are some errors try after Some time";
            alert(errorData);
        }
    });
}

function callTopPost(dataUrl) {
    $.ajax({
        url: dataUrl,
        data: "ajaxSelectedValue=" + $("#topPostContent").val(),
        success: function (data) {
            $(".topPostContentDiv").html(data);
        },
        error: function () {
            var errorData = "There are some errors try after Some time";
            alert(errorData);
        }
    });
}
function searchGlobal(dataUrl) {
    $.ajax({
        url: dataUrl,
        data: "ajaxSearchIt=" + $("#searchGlobalText").val(),
        success: function (data) {
            var successData = "successfullyDone";
            $(".globalSearchDiv").html(data);
        },
        error: function () {
            var errorData = "Please Enter Some Text To Search";
            alert(errorData);
        }
    });
}

function searchInbox(dataUrl) {
    $.ajax({
        url: dataUrl,
        data: "ajaxSearchIt=" + $(".searchInbox").val(),
        success: function (data) {
            var successData = "successfullyDone";
            $(".inboxSearchDiv").html(data);
        },
        error: function () {
            var errorData = "Please Enter Some Text To Search";
            alert(errorData);
        }
    });

}
