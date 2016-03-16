package linksharingagain

class SubscriptionController {
    UserService userService

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def subscribeUser() {
        User currentUser = userService.getUserFromSession()
        Topic topic = Topic.get(params.topicId)
        Subscription subscription = new Subscription(topic: topic, seriousness: params.seriousness, subscriber: currentUser)
        if (subscription.validate()) {
            subscription.save(failOnError: true) ? (flash.message = "Now u r Subscribed to this Topic.......") : (flash.sorry = "Sorry, Some error occurs try after some time.")
            subscription.topic.resources.each {
                ReadingItem readingItem = new ReadingItem(user: currentUser, resource: it, isRead: false)
                it.addToReadingItems(readingItem)
                readingItem.save(flush: true)
            }
        }
        redirect(controller: "home", action: "dashboard", model: [user: currentUser])
    }

    def seriousnessChanged() {
        Subscription subscription = Subscription.get(params.ajaxSubscriptionId)
        subscription.seriousness = params.ajaxSelectedValue
        subscription.save(flush: true)
        render(true)
    }

    def viewAll() {
        def topics = Subscription.createCriteria().list(max: 3, offset: 0) {
            projections {
                property("topic")
            }
            eq("subscriber", userService.getUserFromSession())

        }
        def count = topics.totalCount
        [currentUser: userService.getUserFromSession(), topics: topics, total: count]
    }

    def paginateViewAll() {
        def topics = Subscription.createCriteria().list(max: params.max, offset: params.offset) {
            projections {
                property("topic")
            }
            eq("subscriber", userService.getUserFromSession())

        }
        def count = topics.totalCount
        render(template: '/subscription/viewAllSubscriptions', model: [offset: params.offset, topics: topics, total: count, currentUser: userService.getUserFromSession()])
    }

    def renderTopicPost() {
        Topic topic = Topic.get(params.ajaxTopicId)
        render(template: "/subscription/topicPost", model: [topic: topic, currentUser: userService.getUserFromSession()])
    }

}
