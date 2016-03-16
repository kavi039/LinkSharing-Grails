<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="dashboardHeader"/>
    <title></title>
</head>

<body>
<div class="row globalSearchDiv">
    <div class="col-md-5">
        <div class="panel panel-default ">
            <div class="panel-heading">
                <h3 class="panel-title">Topic: ${topic.topicName}</h3>
            </div>

            <div class="panel-body">
                <div class="media">
                    <div class="media-left media-middle">
                        <g:link controller="home" action="showUser" params="[userId: topic.createdBy.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: topic.createdBy.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>
                        </g:link>
                    </div>

                    <div class="media-body editName">
                        <div class="letsChangeName">
                            <h2 class="des-head">${topic.topicName}</h2>
                        </div>
                        (${topic.visibility})
                        <h4 class="media-heading">@${topic.createdBy.name}</h4>
                        <h5 class="des-head">Subscriptions &nbsp; ${topic.subscriptions.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Post &nbsp;${topic.resources.size()}</h5>

                        <ls:isSubscribe topic="${topic}"/>
                        <ls:isNotSubscribe topic="${topic}"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default ">
            <div class="panel-heading">
                <h3 class="panel-title">User: ${topic.topicName}  <a  style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle2"
                                                                      href="#collapseTwo">
                    <span class="caret"></span></a></h3>
            </div>

            <div class="panel-body" id="collapseTwo">
                <g:each in="${topic.subscriptions}" var="subscription">
                    <div style="width:400px; height:120px; border: outset;padding: 3px;">
                        <div class="media-left">
                            <g:link controller="home" action="showUser" params="[userId: subscription.subscriber.id]">
                                <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: subscription.subscriber.photoPath])}"
                                     class="media-object" width="100px" height="100px"/>
                            </g:link>
                        </div>

                        <div class="media-body">
                            <g:link controller="home" action="showUser" params="[userId: subscription.subscriber.id]">
                                <h4 class="media-heading">${subscription.subscriber.name}</h4></g:link>
                            @${subscription.subscriber.firstName}
                            <br>
                            <h5 class="des-head">Subscriptions &nbsp; ${subscription.subscriber.subscriptions.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Posts &nbsp;${subscription.subscriber.resources.size()}</h5>
                        </div>
                    </div>
                </g:each>
            </div><!-- panel default -->
        </div><!-- pa-->
    </div>

    <div class="col-md-7">
        <div class="panel panel-default ">
            <div class="panel-heading">
                <h3 class="panel-title">Post: ${topic.topicName}
                    <a  style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle1"
                                                                     href="#collapseOne">
                    <span class="caret"></span>
                </a></h3>
            </div>

            <div class="panel-body" id="collapseOne">
                <g:each in="${resourcesList}" var="resource">
                    <div class="userResources">
                        <g:render template="/readingItem/readUnreadUserResources" model="[resource: resource]"/>
                    </div>
                </g:each>
            </div>
        </div>
    </div>
</div>
<g:if test="${currentUser}">
    <g:render template="inviteDoc"/>
    <g:render template="linkResource"/>
    <g:render template="docResource"/>
    <g:render template="createTopic" style="display: none"/>
</g:if>
<div id="subscribeUserModalDiv"></div>

</body>
</html>