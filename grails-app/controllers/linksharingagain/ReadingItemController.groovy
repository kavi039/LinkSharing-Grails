package linksharingagain

class ReadingItemController {
    static scaffold = true
    UserService userService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    ReadingItem markAsReadUnread(User currentUser, Long resourceId) {
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(Resource.get(resourceId), currentUser)
        if (readingItem) {
            readingItem.isRead = !readingItem.isRead
            readingItem.save(flush: true)
            return readingItem
        }
    }

    def renderReadUnreadUser() {
        ReadingItem readingItem = markAsReadUnread(userService.getUserFromSession(), params.ajaxResourceId.toLong())
        render(template: "readUnreadUserResources", model: [resource: readingItem.resource])
    }

}
