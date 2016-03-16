<div class="panel panel-default" id="dialog" style="display: none">

    <div class="panel-body">
        <g:form class="form-box" controller="home" method="post">
            <div class="popupHeadingDiv">
                <label style=" width:100px">Email Id *</label>
                <g:textField name="to" required="true"/>
            </div>
            <br>

            <div class="popupHeadingDiv">
                <label style=" width:100px">Topic *</label>
                <g:select from="${currentUser.subscriptions.topic.asList()}" optionKey="id" optionValue="topicName" name="body"/>
            </div>
            <br>

            <g:actionSubmit class=" loginButton" value="Invite" action="myMail"/>
        </g:form>
    </div>

</div>
