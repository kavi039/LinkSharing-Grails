<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="dashboardHeader"/>
</head>

<body>

<div class="row globalSearchDiv">
    <div class="col-md-6">
        <div class="panel panel-default " style=" height: auto" >
            <div class="panel-body">

                <div class="media">
                    <div class="media-left media-middle">
                        <g:link controller="home" action="showUser" params="[userId: currentUser.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: currentUser.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>
                        </g:link>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">${currentUser.name}</h4>
                        <h5 class="des-head">@Grails</h5>
                        <br>
                        <h5 class="des-head">Subscriptions &nbsp; ${currentUser.subscriptions.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Topics &nbsp;${currentUser.topics.size()}</h5>
                    </div>
                </div>
            </div>
        </div>

    <g:render template="userTopic"/>
    </div>

    <div class="col-md-6">
        <g:render template="profile"/>
    </div>
</div>
<g:render template="inviteDoc"/>
<g:render template="linkResource"/>
<g:render template="docResource"/>
<g:render template="createTopic" style="display: none"/>

</body>