
    <div class="media-body editName trendingTopic">
        &nbsp;
        <div class="letsChangeName">
            <h4 class="media-heading">

                <g:link controller="home" action="topics" params="[TopicId: topic.id]">
                    ${topic.topicName}
                </g:link>
            </h4>
        </div>
        @${topic.createdBy.firstName}

        <ls:isSubscribe user="${currentUser}" topic="${topic}"/>
        <ls:isNotSubscribe user="${currentUser}" topic="${topic}"/>

        <h5 class="des-head">Subscriptions &nbsp; ${topic.subscriptions.size()}
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Posts &nbsp;${topic.resources.size()}</h5>

    </div>
