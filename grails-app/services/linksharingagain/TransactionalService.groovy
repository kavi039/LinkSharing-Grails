package linksharingagain

import enums.Seriousness
import enums.Visibility
import grails.transaction.Transactional

@Transactional
class TransactionalService {

    Topic createTopic(User user, int it) {

        Topic topic = new Topic(topicName: "t${it}", visibility: Visibility.Public)
        user.addToTopics(topic)
        if (topic.validate()) {
            topic.save(flush: true)
            user.save(flush: true)
            return topic
        }
    }

    Subscription subscribeTopic(User user, Topic topic) {
        Subscription subscription = new Subscription(seriousness: Seriousness.casual, subscriber: user)
        topic.addToSubscriptions(subscription)

        if (subscription.validate()) {
            subscription.save(flush: true)
            subscription
            topic.save(flush: true)
        }
    }

}
