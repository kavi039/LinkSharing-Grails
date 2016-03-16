<%@ page import="enums.UserList" contentType="text/html;charset=UTF-8" %>
    <g:each in="${userList}" status="i" var="userInstance">
        <tr>
            <td>${userInstance.firstName}</td>
            <td>${userInstance.lastName}</td>
            <td>${userInstance.email}</td>
            <td>${userInstance.password}</td>
            <td><g:formatDate date="${userInstance.dateCreated}"/></td>
            <td id="active"><g:formatBoolean boolean="${userInstance.active}"/></td>
            <ls:markActivateOrDeactivate userInstance="${userInstance}"/>
        </tr>
    </g:each>
