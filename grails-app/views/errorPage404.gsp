
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sorry Page Not Found</title>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.css"/>
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>

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
        </div>

    </div>
</nav>

<g:if env="development">
    <g:renderException exception="${exception}"/>
</g:if>

    <ul class="errors">
        <li><h3>Oops Page Not Found :(</h3></li>
    </ul>

</body>
</html>