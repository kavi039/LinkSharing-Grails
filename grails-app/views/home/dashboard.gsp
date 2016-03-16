<%@ page import="linksharingagain.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="dashboardHeader"/>
</head>

<body>

<div class="row globalSearchDiv">
    <div class="col-md-5">

        <div class="panel panel-default" style="margin-left: 5px;height:auto">
            <div class="panel-body">

                <div class="media">
                    <div class="media-left media-middle">
                        <g:link controller="home" action="showUser" params="[userId: currentUser.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: currentUser.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>
                        </g:link>
                    </div>

                    <div class="media-body">
                        <g:link controller="home" action="showUser" params="[userId: currentUser.id]">
                            <h4 class="media-heading">${currentUser.firstName}</h4></g:link>
                        <h5 class="des-head">@Grails</h5>
                        <br>
                        <h5 class="des-head">
                            <g:link controller="subscription" action="viewAll">Subscriptions</g:link>
                        &nbsp;${currentUser.subscriptions.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:link controller="topic" action="showCurrentUserTopics">Topics</g:link>
                        &nbsp;${currentUser.topics.size()}</h5>
                    </div>
                </div>

            </div>
        </div>

        <div id="one" class="panel panel-default " style='height:auto;margin-left: 5px'>
            <div class="panel-heading">
                <h3 class="panel-title">SUBSCRIPTIONS <div style="float: right"><g:link controller="subscription"
                                                                                        action="viewAll">ViewAll</g:link></div>
                </h3>
            </div>

            <div class="panel-body">

                <g:render template="subscription"/>
            </div>
        </div>

        <div class="panel panel-default" style='height:auto;margin-left: 5px'>
            <div class="panel-heading">
                <h3 class="panel-title">TRENDING TOPICS
                    <a  style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle1"
                       href="#collapseOne">
                        <span class="caret"></span>
                    </a></h3>

            </div>

            <g:render template="trendingTopic"/>
        </div>
        <g:render template="inviteDoc"/>
    </div>

    <div class="col-md-7">
        <div class="panel panel-default" style="height:auto;margin-right: 5px">
            <div class="panel-heading">
                <h3 class="panel-title">INBOX
                    <input type="text" class="searchInbox form-control" placeholder="Search"
                           onkeyup="searchInbox('${createLink(controller: "search", action: "searchText")}');"
                           style="float:right;width:150px;height: 25px;"></h3>
            </div>

            <div class="inboxSearchDiv">
                <g:render template="inbox"/>
            </div>

        </div>
        <g:render template="linkResource"/>
        <g:render template="docResource"/>
        <g:render template="createTopic" style="display: none"/>
    </div>
</div>
</body>
</html>


