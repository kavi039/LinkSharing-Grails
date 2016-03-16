<%@ page import="enums.Seriousness" %>
<div class="media" id="dialog5" style="display: none">
    <div class="media-left">
        <g:link controller="home" action="showUser" params="[userId: topic.createdBy.id]">
            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: topic.createdBy.photoPath])}"
                 class="media-object" width="100px" height="100px"/>
        </g:link>
    </div>

    <div class="media-body">
        <g:form controller="subscription" action="subscribeUser" params="[topicId:topic.id]"><h4 class="media-heading">Subscribe Topic</h4>
            <g:textField name="topic" value="${topic.topicName}" required="true"/>
            <g:select name="seriousness" from="${Seriousness}"/>
            <input type="submit" value="subscribe"/>
        </g:form>

    </div>
</div>
<script type="text/javascript">
    $("#dialog5").dialog({
        resizable: false,
        modal: true,
        title: "Subscribe",
        draggable: false,
        height: 400,
        width: 500,
        position: ({
            my: "top",
            at: "top"
        })
    });
</script>