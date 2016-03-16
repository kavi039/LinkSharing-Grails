package linksharingagain

class LinkResourceController {
    static scaffold = true
    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def deleteLinkOrDocumentResource() {
        Resource.get(params.ajaxResourceId).delete flush: true
        if (params.ajaxCheckAction) {
            render true
        } else {
            redirect(controller: 'home', action: 'dashboard')
        }

    }

    def renderDeleteResource() {

        render(template: 'deleteResource', model: [resource: Resource.get(params.resourceId)])
    }

    def save(LinkResource linkResourceInstance) {
        if (linkResourceInstance == null) {
            return
        }
        User currentUser = userService.getUserFromSession()

        if (currentUser) {
            linkResourceInstance.createdBy = currentUser
        }

        if (linkResourceInstance.validate()) {
            linkResourceInstance.save(failOnError: true, flush: true) ? (flash.message = "Link Shared......") : (flash.sorry = "Sorry, Some error occurs try after some time.")
        }
        else{
            flash.sorry = "Please Enter The Right Information"
        }
        redirect(controller: 'home', action: 'dashboard')
    }


}
