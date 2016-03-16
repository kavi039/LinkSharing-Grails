package linksharingagain

import enums.Seriousness
import enums.Visibility

class Topic {
    String topicName
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions: Subscription, resources: Resource]

    static belongsTo = [createdBy: User]

    static constraints = {

    }

    def afterInsert = {
        addToSubscriptions(subscriber: createdBy, topic: this, seriousness: Seriousness.Serious)
    }

}
