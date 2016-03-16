package linksharingagain

import grails.transaction.Transactional

@Transactional
class ResourceService {

    DocumentResource uploadDocument(DocumentResource documentResource, def file, String uploadFolderPath) {
        documentResource.fileName = file.originalFilename
        documentResource.filePath = uploadFolderPath + documentResource.fileName
        documentResource.contentType = ".txt"
        File f = new File(documentResource.filePath)
        file.transferTo(f)

        return documentResource
    }

    String uploadPhoto(def file, String uploadFolderPath) {
        if (!file.isEmpty()) {
            File f = new File(uploadFolderPath + file.originalFilename)
            file.transferTo(f)
            return f.path
        }
    }

    Double getResourceRatingAverage(Resource resource) {
        Double TotalScore = 0
        List<ResourceRating> resourceRatingList = ResourceRating.findAllByResources(resource)
        resourceRatingList.each {
            TotalScore += it.score
        }
        Double avg = TotalScore / resourceRatingList.size()
        return avg
    }
}



