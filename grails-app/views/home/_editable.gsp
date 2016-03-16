<%@ page import="enums.Visibility" %>
<br>
<g:select name='visibility-${topic.id}' from="${Visibility}" value="${topic.visibility}"
          onchange="changeVisibility('${createLink(controller: "topic", action: "visibilityChanged")}',${topic.id});"/>
<a class='editThisTopic' href=javascript:void(0) data-topic-id="${topic.id}"
   data-ajax-url="${createLink(controller: 'topic', action: 'renderEditNameDiv', params: [TopicId: topic.id])}"><asset:image
        src="EditBlock.png" width="30px" height="30px"/></a>
&nbsp;
<g:if test="${checkAction}">
    <g:link controller="topic" action="deleteTopic" params="[ajaxDeleteTopicId: topic.id]"><asset:image src="del.png"
                                                                                                        width="30px"
                                                                                                        height="30px"/></g:link>
</g:if>
<g:else>
    <a class='deleteThisTopic' href=javascript:void(0) data-topic-id="${topic.id}"
       data-ajax-url="${createLink(controller: 'topic', action: 'deleteTopic')}"><asset:image src="del.png" width="30px"
                                                                                              height="30px"/></a>

</g:else>