<div class="panel panel-default" style=" height: auto">
    <div class="panel-heading">
        <h3 class="panel-title">Topics
            <a style="float: right;margin-top:5px" data-toggle="collapse" data-parent="#accordion" id="toggle1"
               href="#collapseOne">
                <span class="caret"></span>
            </a></h3>
    </div>

    <div class="panel-body" id="collapseOne">
        <div class="media">
            <g:each in="${currentUser.topics}" var="topic">
                <div id="delete-${topic.id}">
                    <div style='border: outset;height:auto' id="delete-${topic.id}">
                        <div class="media-left media-middle">
                            <g:link controller="home" action="showUser" params="[userId: topic.createdBy.id]">
                                <img src="${createLink(controller: 'home', action: 'renderImage', params: [path: topic.createdBy.photoPath])}"
                                     class="media-object" width="100px" height="100px"/>
                            </g:link>
                        </div>

                        <div class="media-body editName">
                            &nbsp;
                            <div class="letsChangeName">
                                <h4 class="media-heading">
                                    <g:link controller="home" action="topics"
                                            params="[TopicId: topic.id]">
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
                    </div>
                </div>
            </g:each>           %{--<ls:topic/>--}%
        </div>
    </div>
</div>

