<%@ page import="enums.Seriousness" %>
<a id='invitation' class='ui-button ui-widget' href='javascript:void(0)'>
    <asset:image src="invite.png" width="30px" height="30px"/></a>
<g:select from="${Seriousness}" value="${subscription.seriousness}"  name='seriousness-${subscription.id}' onchange="changeSeriousness('${createLink(controller: "subscription", action: "seriousnessChanged")}',${subscription.id});"/>
