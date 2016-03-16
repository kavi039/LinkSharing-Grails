<%@ page import="enums.Seriousness; linksharingagain.Topic" %>

<div class="panel-body " id="collapseOne">
    <div class="media" id="paginateTrending">
        <g:each in="${trendingTopic}" var="topic">
            <div id="delete-${topic.id}">
                <div style='border: outset;height:auto'>
                    <div class="media-left media-middle">
                        <g:link controller="home" action="showUser" params="[userId: topic.createdBy.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: topic.createdBy.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>
                        </g:link>
                    </div>
                    <g:render template="/home/renderTrendingTopic" model="[topic: topic, currentUser: currentUser]"/>
                </div>
            </div>
        </g:each>
        <g:if test="${flag}">

            <div class="pagination-steps">
                <util:remotePaginate max="3" offset="${offset}" controller="topic" action="paginateShowAllTopics"
                                     update="paginateTrending" pageSizes="[3, 6, 10]" total="${total}"/>
            </div>
        </g:if>
    </div>

</div>


<div id="subscribeUserModalDiv"></div>