
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Register</h3>
    </div>

    <div class="panel-body" style="padding-left: 47px">
        <g:form class="form" method="post" name="registerForm"  controller="login" action="register"  data-ajax-url="${createLink(controller: 'login', action: 'remoteValidateRegistrationForm')}" enctype="multipart/form-data">
            <label>First Name *</label>
           <g:textField name="firstName"/><br>
            <label>Last Name *</label>
            <g:textField name="lastName"/><br>
            <label>User Name *</label>
            <g:textField name="username"/><br>
            <label>Email *</label>
           <g:textField name="email" /><br>
            <label >Password *</label>
            <g:passwordField name="password"/><br>
            <label>Confirm Password *</label>
            <g:passwordField name="confirmPassword" /><br>
            <label >Photos:</label>
            <input type="file" name="image" /><br>
            <input type="submit" name="register" value="Register" class="loginButton">
        </g:form>

    </div>
</div>
