
<%@ page import="linksharingagain.ResourceRating" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resourceRating.label', default: 'ResourceRating')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-resourceRating" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-resourceRating" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="resourceRating.resources.label" default="Resources" /></th>
					
						<g:sortableColumn property="score" title="${message(code: 'resourceRating.score.label', default: 'Score')}" />
					
						<th><g:message code="resourceRating.users.label" default="Users" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resourceRatingInstanceList}" status="i" var="resourceRatingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resourceRatingInstance.id}">${fieldValue(bean: resourceRatingInstance, field: "resources")}</g:link></td>
					
						<td>${fieldValue(bean: resourceRatingInstance, field: "score")}</td>
					
						<td>${fieldValue(bean: resourceRatingInstance, field: "users")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resourceRatingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
