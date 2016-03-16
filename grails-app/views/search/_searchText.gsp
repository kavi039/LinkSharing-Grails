<div class="row ">
    <div class="col-md-5">
        <div class="panel panel-default" style='height:auto;'>
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topics</h3>

            </div>
            <g:render template="/home/trendingTopic"/>
        </div>
        <g:render template="/login/topPosts"/>
    </div>

    <div class="col-md-6">
        <div class="searchDiv">
            <div class="panel panel-default ">
                <div class="panel-heading">
                    <h3 class="panel-title">Search for "${searchText}"</h3>
                </div>
                <g:if test="${resourcesList}">
                    <div class="media">
                        <g:each in="${resourcesList}" var="resource">
                            <div style='border: outset;height:auto ;'>
                                <div class='media-left'>
                                    <g:link controller="home" action="showUser"
                                            params="[userId: resource.createdBy.id]">
                                        <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: resource.createdBy.photoPath])}"
                                             class="media-object" width="100px" height="100px"/>
                                    </g:link>
                                </div>

                                <div class="media-body">
                                    <br>
                                    <b>${resource.createdBy.name}&nbsp;</b>@${resource.createdBy.firstName}
                                    <p align="right">${resource.topic.topicName}</p>
                                    <ls:checkDescriptionSize description="${resource.description}"/>
                                    <br>
                                    <a href="http://www.facebook.com"><asset:image src="facebook.jpg" width="15px"
                                                                                   height="15px"/></a>&nbsp;
                                    <a href="http://www.googleplus.com"><asset:image src="googlePlus.jpg" width="15px"
                                                                                     height="15px"/></a>&nbsp;
                                    <a href="http://www.twitter.com"><asset:image src="twitter.jpg" width="15px"
                                                                                  height="15px"/></a>
                                    &nbsp;&nbsp;
                                    <g:link controller="home" action="posts" align="right"
                                            params="[resourceId: resource.id]">View Post</g:link>
                                    <br/>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </g:if>
            </div>
        </div>
    </div>
</div>
