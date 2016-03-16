<%@ page import="enums.Seriousness; linksharingagain.Subscription" %>


<div class="media" id="paginateSubscription">
    <g:each in="${subscriptions}" var="subscription">
        <div id="delete-${subscription.topic.id}">
            <div class="editThis" style='border: outset;height:auto' >
                <div class='media-left'>
                    <g:link controller="home" action="showUser" params="[userId: subscription.subscriber.id]">
                        <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: subscription.subscriber.photoPath])}"
                             class="media-object" width="100px" height="100px"/>
                    </g:link>
                </div>

                <div class="media-body editName">
                    <h4 class="media-heading"></h4>

                    <div class="letsChangeName">
                        <g:link controller="home" action="topics" params="[TopicId: subscription.topic.id]">
                            ${subscription.topic.topicName}</g:link>
                    </div>
                    <h5 class="des-head">@${subscription.topic.createdBy.firstName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Subscriptions &nbsp;${subscription.topic.subscriptions.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Posts &nbsp;${subscription.topic.resources.size()}</h5>
                    <ls:isEditable userId="${currentUser.id}" subscriptionTopic="${subscription.topic}"/>
                    <a href="javascript:void(0)" class="ui-button ui-widget" id="invitation" width="40px"
                       height="40px">
                        <asset:image src="invite.png" width="30px" height="30px"/></a>
                    <g:select from="${Seriousness}" value="${subscription.seriousness}"
                              name='seriousness-${subscription.id}'
                              onchange="changeSeriousness('${createLink(controller: "subscription", action: "seriousnessChanged")}',${subscription.id});"/>

                </div>
            </div>
        </div>
    </g:each>
    <g:if test="${subscriptions}">
        <div class="pagination-steps">
            <util:remotePaginate max="3" offset="${offset ? offset : 0}" controller="home"
                                 action="paginateSubscription"
                                 update="paginateSubscription" total="${totalSubscription}"/>
        </div>
    </g:if>
</div>

