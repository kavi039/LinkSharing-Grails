<%@ page import="linksharingagain.Resource" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Recent Shares<a style="float: right;margin-top:5px" data-toggle="collapse"
                                                data-parent="#accordion" id="toggle1"
                                                href="#collapseOne">
            <span class="caret"></span>
        </a></h3>
    </div>

    <div class="panel-body" id="collapseOne">
        <div class="media">
            <g:each in="${recentPost}" var="resource">
                <div style='border: outset;height:auto ;padding: 3px'>
                    <div class='media-left'>
                        <g:link controller="home" action="showUser" params="[userId: resource.createdBy.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: resource.createdBy.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>

                        </g:link>
                    </div>

                    <div class="media-body">
                        <br>
                        <b>${resource.createdBy.name}&nbsp;</b>@${resource.createdBy.firstName}
                        <p align="right"><g:link controller="home" action="topics"
                                                 params="[TopicId: resource.topic.id]">
                            ${resource.topic.topicName}
                        </g:link></p>
                        ${resource.description}
                        <br>
                        <a href="http://www.facebook.com"><asset:image src="facebook.jpg" width="15px"
                                                                       height="15px"/></a>
                        <a href="http://www.googleplus.com"><asset:image src="googlePlus.jpg" width="15px"
                                                                         height="15px"/></a>
                        <a href="http://www.twitter.com"><asset:image src="twitter.jpg" width="15px" height="15px"/></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        %{--<g:link controller="user" action="posts" align="right">View Post</g:link><br/>--}%
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</div>