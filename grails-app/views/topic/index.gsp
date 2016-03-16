
<%@ page import="linksharingagain.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="dashboardHeader">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-topic" class="content scaffold-list" role="main" style="margin:6%">
			<h1>TOPICS</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

                <table style="border: outset; width: 1000px">
			<thead style="border: outset; background-color: #abbf78">
					<tr>
					
						<g:sortableColumn property="topicName" title="${message(code: 'topic.topicName.label', default: 'Topic Name')}" />
					
						<g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />
					
						<th><g:message code="topic.createdBy.label" default="Created By" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'topic.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'topic.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "topicName")}</g:link></td>
					
						<td>${fieldValue(bean: topicInstance, field: "visibility")}</td>
					
						<td>${fieldValue(bean: topicInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${topicInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${topicInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
