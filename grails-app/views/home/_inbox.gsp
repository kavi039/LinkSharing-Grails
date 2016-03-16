<div class="panel-body" id="paginateInbox">
    <div class="media">
        <g:each in="${resourcesList}" var="resource">
            <div class="userResources">
                <div style="height:auto; border: outset;padding: 3px;">
                    <div class="media-left">
                        <g:link controller="home" action="showUser" params="[userId: resource.createdBy.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: resource.createdBy.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>
                        </g:link></div>

                    <div class="media-body">
                        <h4 class="media-heading">${resource.createdBy.name} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>

                        <p class="des-head">@${resource.createdBy.firstName}</p>
                        <ls:checkDescriptionSize description="${resource.description}"/>
                        <br>
                        <br>
                        <a href="http://www.facebook.com"><asset:image src="facebook.jpg" width="15px"
                                                                       height="15px"/></a>&nbsp;
                        <a href="http://www.googleplus.com"><asset:image src="googlePlus.jpg" width="15px"
                                                                         height="15px"/></a>&nbsp;
                        <a href="http://www.twitter.com"><asset:image src="twitter.jpg" width="15px"
                                                                      height="15px"/></a>
                        &nbsp;&nbsp;
                        <g:link controller="home" action="posts" params="[resourceId: resource.id]">View Post</g:link>
                        <div style="float: right">
                            <ls:readUnread resource="${resource}" anchorClass="markReadUnRead-inbox"/>&nbsp
                            <ls:resourceType resource="${resource}"/>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>

    </div>
    <g:if test="${resourcesList}">

        <div class="pagination-steps">
            <util:remotePaginate max="3" offset="${offset ? offset : 0}" controller="home" action="paginateInbox"
                                 update="paginateInbox" pageSizes="[3, 6, 10]" total="${total}"/>
        </div>
    </g:if>

</div>