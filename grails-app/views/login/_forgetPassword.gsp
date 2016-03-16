<g:form id="forgetForm" name="forgetForm"
        data-ajax-url="${createLink(controller: 'login', action: 'remoteValidateLoginForm')}">
    <label>Enter Your Email*:</label>
    <g:textField name="emailId" onkeyup="validateForgetForm()"/>
    <br>
    <g:actionSubmit value="sendMail" action="sendMailToResetPassword"/>
</g:form>