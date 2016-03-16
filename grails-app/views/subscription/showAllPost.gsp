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
    <div class="col-md-3"></div>

    <div class="col-md-6">
        <div class="panel panel-default" style='height:auto;margin-left: 5px'>

            <div class="panel-heading">
                <h3 class="panel-title">ALL Post</h3>
            </div>

            <div class="panel-body" id="paginatePost">

                <g:render template="/subscription/showPostPagination"
                          model="[resources: resources, currentUser: currentUser, total: total,checkAction:checkAction]"/>
            </div>

        </div>
    </div>
</div>
<g:render template="/home/inviteDoc"/>

<g:render template="/home/linkResource"/>
<g:render template="/home/docResource"/>
<g:render template="/home/createTopic" style="display: none"/>
<div id="deleteResourceDiv"></div>

</body>
</html>