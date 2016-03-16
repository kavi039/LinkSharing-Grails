<%@ page import="enums.UserList" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardHeader">
    <asset:javascript src="user.js"/>
</head>

<body>
<div class="globalSearchDiv">
<div id="list-user" class="content " role="main" style="margin:6%">
    <h1>USER LIST</h1>

    <table style="border: outset;width: 1040px">
        <thead style="border: outset #12405a ; background-color:#12405a ;color: #bcd2c9">
        <tr>
            <th colspan="7">
                <g:select name="users" from="${enums.UserList}"
                          onchange="callSortUsers('${createLink(controller: "user", action: "sortUser")}');"/>

                <input class="search-User" type="text" placeholder="Search"
                       onkeyup="searchUser('${createLink(controller: "search", action: "searchUser")}');"
                       style="float:right">
            </th>
        </tr>

        <tr>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Email</th>
            <th>Password</th>
            <th>DateCreated</th>
            <th>Active</th>

            <th>Manage</th>
        </tr>
        </thead>
        <tbody id="userDetails" style="background-color: #e6e7ff">
        <g:render template="userTable" model="[userList: userList]"/>
        </tbody>
    </table>
</div>
</div>
<div class="pagination">
    <g:paginate total="${userCount ?: 0}"/>
</div>
</body>
</html>