package linksharingagain

import grails.transaction.Transactional

@Transactional
class BootstrapService {
    TransactionalService transactionalService

    void create() {
        User.withTransaction { status ->
            2.times { count = 0 ->
                count++
                User user = new User(firstName: "k" + count, password: "abcde" + count, lastName: "c" + count, username: "kc" + count, email: "k" + count + "@intelligrape.com", admin: true, active: true)
                if (user.validate()) {

                    user.save(flush: true)

                    5.times {
                        Topic t1 = transactionalService.createTopic(user, it)
                        5.times {
                            createLinkResource(user, t1, it)
                        }
                        5.times {
                            createDocumentResource(user, t1, it)
                        }
                    }
                }
            }
        }
    }

    LinkResource createLinkResource(User user, Topic topic, int it) {

        LinkResource linkResource = new LinkResource(createdBy: user, description: "linkSharing$it", url: "http://www.google$it" + ".com")

        topic.addToResources(linkResource)
        if (linkResource.validate()) {
            linkResource.save(flush: true)
            topic.save(flush: true)

            linkResource
        }
    }

    DocumentResource createDocumentResource(User user, Topic topic, int it) {

        DocumentResource documentResource = new DocumentResource(createdBy: user, description: "PDFdocument$it", filePath: "home/projects/$it", contentType: ".pdf", fileName: "file$it")
        topic.addToResources(documentResource)
        if (documentResource.validate()) {
            documentResource.save(flush: true)
            topic.save(flush: true)

            documentResource
        }
    }

    ReadingItem createReadingItem(User user, Resource resource) {
        ReadingItem readingItem = new ReadingItem(user: user, isRead: false)
        resource.addToReadingItems(readingItem)
        if (readingItem.validate()) {
            readingItem.save(flush: true)
            resource.save(flush: true)
            readingItem
        }
    }

    ResourceRating resourceRating(User user, Resource resource, Double it) {
        ResourceRating resourceRating = new ResourceRating(score: it)
        user.addToResourceRatings(resourceRating)
        resource.addToResourceRatings(resourceRating)
        if (resourceRating.validate()) {
            resourceRating.save(flush: true)
            user.save(flush: true)

            resourceRating
        }

    }
}