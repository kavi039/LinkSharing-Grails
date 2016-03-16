<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.css"/>
    <asset:stylesheet src="linkShare.css"/>
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="jquery-ui.css"/>

    <asset:javascript src="jquery-2.1.3.min.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="jquery-ui.js"/>

    <asset:javascript src="dashboard.js"/>
    %{--<asset:javascript src="login.js"/>--}%
    <asset:javascript src="subscription.js"/>
    <asset:javascript src="topic.js"/>

    <title><g:layoutTitle/></title>

    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <div class="navbar-header">
            <asset:image src="link.png" style="width: 30px;height: 30px ;margin-top: 8px"/>

            <a class="navbar-brand home" href="${createLink(uri: '/')}">LinkSharing</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <g:form class="navbar-form navbar-right form-box" role="search">
                <div class="form-group">
                    <g:if test="${currentUser}">
                        <a href="javascript:void(0)" class="ui-button ui-widget" id="create" width="40px"
                           height="40px"><asset:image
                                src="create.png" width="40px"
                                height="40px"/></a>
                        <a href="javascript:void(0)" class="ui-button ui-widget" id="link" width="40px"
                           height="40px"><asset:image
                                src="shareLink.png" width="40px"
                                height="40px"/></a>
                        <a href="javascript:void(0)" class="ui-button ui-widget" id="doc" width="40px"
                           height="40px"><asset:image
                                src="doc.png" width="40px"
                                height="40px"/></a>
                        <a href="javascript:void(0)" class="ui-button ui-widget" id="invitation" width="40px"
                           height="40px"><asset:image
                                src="invite.png" width="40px"
                                height="40px"/></a>
                    </g:if>
                    <input type="text" class="form-control" id="searchGlobalText" placeholder="Search"
                           onkeyup="searchGlobal('${createLink(controller: "search", action: "searchGlobal")}');"
                           style="float:right">
                </div>

                <div class="form-group" style="margin-left: 20px">
                    <ls:displayLoggedInUserDetails currentUser="${currentUser}"/>
                </div>
            </g:form>

        </div>

    </div>

</nav>

<g:if test="${flash.message}">
    <div class="well well-lg" style="color:#8dfffd" role="status">${flash.message}</div>

</g:if>
<g:if test="${flash.sorry}">
    <div class="well well-lg"  style="color: red;" role="status">${flash.sorry}</div>

</g:if>

<g:layoutBody/>
</body>
</html>