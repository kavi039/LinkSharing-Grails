<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="dashboardHeader"/>
    <title></title>
</head>

<body>
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default " style=" height: auto">
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
            </div><!-- panel default -->
        </div><!-- panel body -->
        <div class="panel panel-default " style=" height: auto">
            <g:if test="flag">
                <div class="panel-heading">
                    <h3 class="panel-title">Topics</h3>
                </div>
            </g:if>
            <g:else>
                <div class="panel-heading">
                    <h3 class="panel-title">Subscriptions</h3>
                </div>
            </g:else>
            <g:render template="/subscription/viewAllSubscriptions"/>
        </div>
    </div>


    <div class="col-md-6">

        <div class="topicClickPost">
            %{--<g:render template="topicPost"/>--}%
        </div>
    </div>
</div>

</body>
</html>