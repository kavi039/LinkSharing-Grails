<g:each in="${resources}" var="resource">
    <div id="deleteResource-${resource.id}">
        <div style='border: outset;height:auto'>
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
                <ls:avgScore resource="${resource}"/>
                <h5 class="des-head">@${resource.createdBy.firstName}</h5>
                ${resource.description}
                <br><br>
                <a href="http://www.facebook.com"><asset:image src="facebook.jpg" width="30px"
                                                               height="30px"/></a>
                <a href="http://www.googleplus.com"><asset:image src="googlePlus.jpg" width="30px"
                                                                 height="30px"/></a>
                <a href="http://www.twitter.com"><asset:image src="twitter.jpg" width="30px"
                                                              height="30px"/></a>
                <g:if test="${currentUser}">
                    <ls:editResource resource="${resource}" checkAction="${checkAction}"/>
                </g:if>
                <ls:resourceType resource="${resource}"/>
            </div>
        </div>
    </div>
</g:each>
<g:if test="${resources}">
    <div class="pagination-steps">
        <util:remotePaginate max="3" offset="${offset ? offset : 0}" controller="user"
                             action="paginateShowAllPost"
                             update="paginatePost" pageSizes="[3, 6, 10]" total="${total}"/>
    </div>
</g:if>

