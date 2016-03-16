package linksharingagain

abstract class Resource {
    String description
    Date dateCreated
    Date lastUpdated
    User createdBy


    static hasMany = [readingItems: ReadingItem, resourceRatings: ResourceRating]

    static belongsTo = [topic: Topic]

    static constraints = {
        description maxSize: 1024
    }

    static mapping = {
        tablePerHierarchy(false)
        description type: 'text'
    }

    def afterInsert = {

        addToReadingItems(isRead: true, user: createdBy, resource: this)
        List<Subscription> subscriptions = topic.subscriptions.findAll {
            it.subscriber != createdBy
        } as List<Subscription>
        subscriptions.each {
            this.addToReadingItems(isRead: false, user: it.subscriber, resource: this)
        }
    }
}
