<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="dashboardHeader"/>
    <title></title>
</head>

<body>

<div class="row globalSearchDiv">
    <div class="col-md-5">

        <div class="panel panel-default ">
            <div class="panel-body">

                <div class="media">
                    <div class="media-left media-middle">
                        <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: user.photoPath])}"
                             class="media-object" width="100px" height="100px"/>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">${user.name}</h4>
                        <h5 class="des-head">@Grails</h5>
                        <br>
                        <h5 class="des-head">Subscriptions &nbsp; ${user.resources.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Topics &nbsp;${user.topics.size()}</h5>
                    </div>
                </div>
            </div>
        </div>
        %{--SUBSCRIBED TOPICS OF USER --}%

        <div class="panel panel-default profile ">
            <div class="panel-heading">
                <h3 class="panel-title">Topics<a  style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle2"
                                                  href="#collapseTwo">
                    <span class="caret"></span></a></h3>
            </div>

            <div class="panel-body" id="collapseTwo">
                <g:each in="${topicList}" var="itTopic">
                    <div style=" height:auto; border: outset;padding: 3px;" class="editName" id="delete-${itTopic.id}">
                                                <div class="letsChangeName">
                    <g:link controller="home" action="topics" params="[TopicId: itTopic.id]">
                            ${itTopic.topicName}
                        </g:link>
                    </div>
                        <h5 class="des-head">Subscriptions &nbsp; ${itTopic.subscriptions.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Posts &nbsp;${itTopic.resources.size()}</h5>
                        <ls:isSubscribe topic="${itTopic}"/>
                        <ls:isNotSubscribe topic="${itTopic}"/>
                    </div>
                </g:each>
            </div>
        </div>
    </div>

    %{--RESOURCES ADDED BY USER --}%
    <div class="col-md-7">
        <div class="panel panel-default profile1 ">
            <div class="panel-heading">
                <h3 class="panel-title">Posts <a  style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle1"
                                                  href="#collapseOne">
                    <span class="caret"></span>
                </a></h3>
            </div>

            <div class="panel-body" id="collapseOne">
                <g:each in="${postList}" var="resource">
                    <div class="userResources">
                        <g:render template="/readingItem/readUnreadUserResources" model="[resource: resource]"/>
                    </div>
                </g:each>
            </div>
        </div>
    </div>
    <g:if test="${currentUser}">
    <g:render template="inviteDoc"/>
    <g:render template="linkResource"/>
    <g:render template="docResource"/>
    <g:render template="createTopic" style="display: none"/>
    </g:if>

</body>
</html>