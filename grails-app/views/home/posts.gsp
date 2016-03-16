<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="dashboardHeader"/>
    <asset:stylesheet src="jquery.raty.css"/>
    <asset:javascript src="jquery.raty.js"/>
    <asset:javascript src="postRatings.js"/>
</head>

<body>

<div class="row globalSearchDiv">
    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel-body">

                <div class="media-left media-middle">
                    <g:link controller="home" action="showUser" params="[userId: resource.createdBy.id]">
                        <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: resource.createdBy.photoPath])}"
                             class="media-object" width="100px" height="100px"/>
                    </g:link>
                </div>

                <div class="media-body">
                    <g:link controller="home" action="showUser" params="[userId: resource.createdBy.id]">
                        <h4 class="media-heading">${resource.createdBy.name}</h4></g:link>
                    <g:link controller="home" action="topics"
                            params="[TopicId: resource.topic.id]">
                        ${resource.topic.topicName}
                    </g:link>
                    <g:if test="${currentUser}">
                        ${averageScore}
                        <div id="ratings-${resource.id}" class="rating-divs" data-avg-score="${averageScore}"
                             data-rating-url="${g.createLink(controller: "resourceRating", action: "rateResource", params: [resourceId: resource.id, currentUser: currentUser])}"></div>
                    </g:if>
                    <h5 class="des-head">@${resource.createdBy.firstName}</h5>
                    <ls:checkDescriptionSize description="${resource.description}"/>
                    <br><br>
                    <a href="http://www.facebook.com"><asset:image src="facebook.jpg" width="30px" height="30px"/></a>
                    <a href="http://www.googleplus.com"><asset:image src="googlePlus.jpg" width="30px"
                                                                     height="30px"/></a>
                    <a href="http://www.twitter.com"><asset:image src="twitter.jpg" width="30px" height="30px"/></a>
                    <g:if test="${currentUser}">
                        <ls:editResource resource="${resource}"/>
                    </g:if>
                    <ls:resourceType resource="${resource}"/>
                </div>
            </div>
        </div>

    </div>

    <div id="deleteResourceDiv"></div>

    <div class="col-md-7">
        <div class="panel panel-default" style='height:auto;margin-left: 5px'>
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topics
                    <a  style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle1"
                                                             href="#collapseOne">
                    <span class="caret"></span>
                </a></h3>
            </div>

            <g:render template="/home/trendingTopic"/>
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