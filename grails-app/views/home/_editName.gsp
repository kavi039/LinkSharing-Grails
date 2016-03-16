<g:textField name="newNameof"/>
<input type="button" name='newName-${topicId}'
       data-ajax-url="${createLink(controller: 'topic', action: 'changeItsName', params: [TopicId: topicId])}"
       data-topic-id="${topicId}" class="newNameBtnClass" value="ChangeName"/>
