<div class="panel panel-default" id="dialog2" style="display: none">

    <div class="panel-body">
        <g:form class="form-box" controller="documentResource" enctype="multipart/form-data">
            <div class="popupHeadingDiv">
                <label>Select Document  </label>
                <input type="file" name="doc" required="true"/>
            </div>
            <br>
            <div class="popupHeadingDiv" style="height: auto">
                <label style="width: 100px">Description*</label>
                <g:textArea name="documentResourceInstance.description" required="true"/>
                <br>
            </div>
            <br>
            <div class="popupHeadingDiv">
                <label style="width: 100px">Topic*</label>
                <g:select from="${currentUser.subscriptions.topic.asList()}" optionKey="id" optionValue="topicName"
                          name="documentResourceInstance.topic.id"/>
            </div><br>
                <g:actionSubmit class="loginButton" value="share" action="save"/>
        </g:form>
    </div>
</div>
