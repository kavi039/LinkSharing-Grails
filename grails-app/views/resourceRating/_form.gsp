<%@ page import="linksharingagain.ResourceRating" %>



<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'resources', 'error')} required">
	<label for="resources">
		<g:message code="resourceRating.resources.label" default="Resources" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resources" name="resources.id" from="${linksharingagain.Resource.list()}" optionKey="id" required="" value="${resourceRatingInstance?.resources?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="resourceRating.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${resourceRatingInstance.score}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'users', 'error')} required">
	<label for="users">
		<g:message code="resourceRating.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="users" name="users.id" from="${linksharingagain.User.list()}" optionKey="id" required="" value="${resourceRatingInstance?.users?.id}" class="many-to-one"/>

</div>

