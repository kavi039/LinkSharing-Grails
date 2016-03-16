package linksharingagain

class DocumentResourceController {
    UserService userService
    ResourceService resourceService

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def download() {
        DocumentResource documentResource = Resource.findById(params.resourceId)

println(">>>>>>>>>>>>>>>>>>>.....................................Download"+documentResource)
        if (documentResource == null) {
            flash.message = "Document not found."
            redirect(controller: "home", action: "index")
        } else {
            File file = new File(documentResource.filePath)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentResource.fileName}\"")
            def outputStream = response.getOutputStream()
            outputStream << file.getBytes()
            outputStream.flush()
            outputStream.close()
        }
    }

    DocumentResource save(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            return
        }

        if (userService.getUserFromSession()) {
            documentResourceInstance.createdBy = userService.getUserFromSession()
            documentResourceInstance = resourceService.uploadDocument(documentResourceInstance, params.doc, grailsApplication.config.upload.documentResources.toString())
        }

        if (documentResourceInstance.validate()) {
            documentResourceInstance.save(failOnError: true ,flush: true) ? (flash.message = "Document Shared.......") : (flash.sorry = "Sorry, Some error occurs try after some time.")
        }

        redirect(controller: 'home', action: 'dashboard')
    }

}

