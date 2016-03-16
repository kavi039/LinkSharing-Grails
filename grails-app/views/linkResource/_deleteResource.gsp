<div id="dialog6">
    <h4> Please Confirm U Want To Delete This Post</h4>
    <br>
    <g:link controller="linkResource" action="deleteLinkOrDocumentResource" style="margin-left: 35%"
            params="[ajaxResourceId: resource.id]"><asset:image src="delete.jpeg" width="70px" height="70px"/></g:link>

</div>

<script type="text/javascript">
    $("#dialog6").dialog({
        resizable: false,
        modal: true,
        title: "Delete Resource",
        draggable: false,
        height: 200,
        width: 500,
        position: ({
            my: "top",
            at: "top"
        })
    });
</script>