<%@ page import="enums.Visibility" %>
<div class="panel panel-default " id="dialog1" style="display: none">
    <div class="panel-body " style="align-content: center">

        <g:form controller="topic" class="form-box">
            <div class="popupHeadingDiv">
                <label style="width: 100px">Topic name</label>
                <g:textField name="topicInstance.topicName" required="true"/>
            </div>
            <br>

            <div class="popupHeadingDiv">
                <label style="width: 100px">Visibility*</label>
                <g:select name="topicInstance.visibility" from="${Visibility}"/>
            </div><br>
                <g:actionSubmit class=" loginButton" value="save" align="center" action="save"/>
        </g:form>

    </div>
</div>
