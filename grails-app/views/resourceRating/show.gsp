
<%@ page import="linksharingagain.ResourceRating" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resourceRating.label', default: 'ResourceRating')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-resourceRating" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-resourceRating" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list resourceRating">
			
				<g:if test="${resourceRatingInstance?.resources}">
				<li class="fieldcontain">
					<span id="resources-label" class="property-label"><g:message code="resourceRating.resources.label" default="Resources" /></span>
					
						<span class="property-value" aria-labelledby="resources-label"><g:link controller="resource" action="show" id="${resourceRatingInstance?.resources?.id}">${resourceRatingInstance?.resources?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceRatingInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="resourceRating.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${resourceRatingInstance}" field="score"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceRatingInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="resourceRating.users.label" default="Users" /></span>
					
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${resourceRatingInstance?.users?.id}">${resourceRatingInstance?.users?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:resourceRatingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${resourceRatingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
