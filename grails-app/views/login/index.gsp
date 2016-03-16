<%@ page import="enums.TopPostContent" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.css"/>
    <asset:stylesheet src="jquery-ui.css"/>
    <asset:stylesheet src="linkShare.css"/>

    <asset:javascript src="jquery-2.1.3.min.js"/>
    <asset:javascript src="jquery-ui.js"/>
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="bootstrap.js"/>

    <asset:javascript src="login.js"/>
    <asset:javascript src="dashboard.js"/>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">

                <li style="font-family: 'Lucida Grande', Verdana, sans-serif; font-size: large">
                    <a class="navbar-brand home" href="${createLink(uri: '/')}">LinkSharing</a>
                    <asset:image src="link.png" style="width: 30px;height: 30px ;margin-top: 8px"/>
                </li>
            </ul>

            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" id="searchGlobalText" placeholder="search"
                           onkeyup="searchGlobal('${createLink(controller: "search", action: "searchGlobal")}');"
                           style="float:right">
                </div>
            </form>
        </div>

    </div>
</nav>
<g:if test="${flash.success}">
    <div class="well well-lg" style="color: #8dfffd" role="status">${flash.success}</div>

</g:if>
<g:if test="${flash.error}">
    <div class="well well-lg"  style="color: #ff0000" role="status">${flash.error}</div>
</g:if>
<g:if test="${flash.fail}">
    <div class="well well-lg" style="color: #ff0000" role="status">${flash.fail}</div>
</g:if>


<div class="row globalSearchDiv">
    <div class="col-md-7">
        <g:render template="RecentShare"/>
        <g:render template="topPosts"/>
    </div>

    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel-heading  heading">
                <h3 class="panel-title" style='${false ? "color: red" :"color: cyan"}'>Login</h3>
            </div>

            <div class="panel-body loginDetails" style="padding-left: 47px ;background-color: #e6e7ff">
                <g:form name="loginForm" id="loginForm" controller="login"
                        data-ajax-url="${createLink(controller: 'login', action: 'remoteValidateLoginForm')}">
                    <label>Enter Email</label><g:textField name="userEmail"/>
                    <br>
                    <label>Enter Password</label><g:passwordField
                        name="password"/>
                    <br>
                    <br>
                    <a class="forget" style="font-size: 11px" href=javascript:void(0)
                       data-ajax-forget-url="${createLink(controller: 'login', action: 'renderForgetTemplate')}">Forgot your password?</a>

                    <g:actionSubmit value="Login"  action="loginHandler" class="loginButton"/>
                    <br>
                   </g:form>
            </div>
        </div>
        <g:render template="register"/>
    </div>
</div>
</body>
</html>