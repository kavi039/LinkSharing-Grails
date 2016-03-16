<%@ page import="linksharingagain.Topic" %>
<div class="panel panel-default" id="dialog3" style="display: none">

    <div class="panel-body">
        <g:form class="form-box" controller="linkResource">
            <div class="popupHeadingDiv">
                <label style="width: 100px">Link*</label>
            <input type="url" name="linkResourceInstance.url" required="true"/>
            </div>
            <br>

            <div class="popupHeadingDiv" style="height: auto">
                <label style="width: 100px">Description*</label>
                <g:textArea name="linkResourceInstance.description" required="true"/>
                <br>
            </div>

            <br>

            <div class="popupHeadingDiv">
                <label style="width: 100px">Topic*</label>
                <g:select from="${currentUser.subscriptions.topic.asList()}" optionKey="id" optionValue="topicName"
                          name="linkResourceInstance.topic.id"/>
            </div>

            <br>
            <g:actionSubmit class="loginButton" value="share" action="save"/>
        </g:form>
    </div>
</div>
