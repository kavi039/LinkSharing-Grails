<%@ page import="enums.TopPostContent" %>
<div class="panel panel-default ">

    <div class="panel-heading">
        <h3 class="panel-title">Top Posts
            <g:select name="topPostContent" style="float: right" value="Today" from="${TopPostContent}" onchange="callTopPost('${createLink(controller: "login", action: "topPost")}');"/>
        </h3>
    </div>

    <div class="topPostContentDiv">
        <g:render template="/login/topPostContentDiv"/>
    </div>
</div>

