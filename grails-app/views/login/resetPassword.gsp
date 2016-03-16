<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="dashboardHeader"/>
    <title></title>
</head>

<body>

<div class="panel panel-default ">
    <div class="panel-heading">
        <h3 class="panel-title">Reset Password</h3>
    </div>

    <div class="panel-body">
        <g:form name="resetForm" id="resetForm" controller="login" action="resetPassword" params="[token: token]">
            <label Style="width:130px">Password :</label>
            <g:passwordField name="password"/><br>
            <label>Confirm Password :</label>
            <g:passwordField name="confirmPassword"/><br>
            <input type="submit" name="reset" value="Reset Password">
        </g:form>
    </div>
</div>
</body>
</html>