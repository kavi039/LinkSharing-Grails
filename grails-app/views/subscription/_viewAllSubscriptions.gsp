<div class="panel-body" id="paginateViewAll">
    <div class="media ">
        <g:each in="${topics}" var="topic">
            <div id="delete-${topic.id}">
                <div style='border: outset;'>
                    <div class="media-left media-middle">
                        <g:link controller="home" action="showUser" params="[userId: topic.createdBy.id]">
                            <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: topic.createdBy.photoPath])}"
                                 class="media-object" width="100px" height="100px"/>
                        </g:link>
                    </div>

                    <div class="media-body editName">
                        <div class="letsChangeName">

                            <h4 class="media-heading">
                                <a class='openTopicPost' href=javascript:void(0) data-topic-id='${topic.id}'
                                   data-ajax-url="${createLink(controller: 'subscription', action: 'renderTopicPost')}">${topic.topicName}</a>
                            </h4>
                        </div>
                        @${topic.createdBy.firstName}
                        <ls:isSubscribe user="${currentUser}" topic="${topic}"/>
                        <ls:isNotSubscribe user="${currentUser}" topic="${topic}"/>
                        <h5 class="des-head">Subscriptions &nbsp; ${topic.subscriptions.size()}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Posts &nbsp;${topic.resources.size()}</h5>

                    </div>
                </div>
            </div>
        </g:each>

    </div>
    <g:if test="${topics}">
        <div class="pagination-steps">
            <util:remotePaginate max="3" offset="${offset ? offset : 0}" controller="subscription"
                                 action="paginateViewAll"
                                 update="paginateViewAll" pageSizes="[3, 6, 10]" total="${total}"/>
        </div>
    </g:if>
</div>
