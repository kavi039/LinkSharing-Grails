<g:if test="${checkAction}">
    <a class='deletePost' href=javascript:void(0)
       data-resource-id="${resource.id}"
       data-ajax-url=" ${createLink(controller: 'linkResource', action: 'deleteLinkOrDocumentResource')}"><asset:image src="del.png" width="30px" height="30px"/></a>
</g:if>
<g:else>
    <a class='deleteResource' class='ui-button ui-widget' href=javascript:void(0)
       data-ajax-url="${createLink(controller: 'linkResource', action: 'renderDeleteResource', params: [resourceId: resource.id])}"><asset:image
            src="del.png" width="30px" height="30px"/></a>
    &nbsp;
</g:else>

