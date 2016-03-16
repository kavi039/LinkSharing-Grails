package linksharingagain

class TopicController {
    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    UserService userService

    def visibilityChanged() {
        Topic topic = Topic.get(params.ajaxTopicId)
        topic.visibility = params.ajaxSelectedValue
        topic.save(flush: true)
        render(true)
    }

    def deleteTopic() {
        Topic.get(params.ajaxDeleteTopicId).delete flush: true
        if (params.ajaxCheckAction) {
            render(true)
        } else {
            redirect(controller: "home", action: "dashboard")
        }
    }

    def renderEditNameDiv() {
        render(template: "/home/editName", model: [topicId: params.ajaxEditTopicId])
    }

    def changeItsName() {
        Topic topic = Topic.findById(params.ajaxTopicId)
        topic.topicName = params.ajaxTextBoxValue
        if (topic.save(flush: true)) {
            render(template: "/home/topicLink", model: [currentUser: userService.userFromSession, topic: topic])
        } else {
            render(false)
        }
    }

    def save(Topic topicInstance) {

        if (topicInstance == null) {
            println("if topic instance is null")
            return
        }
        User currentUser = userService.getUserFromSession()
        if (currentUser) {
            topicInstance.createdBy = currentUser
        }
        if (topicInstance.validate()) {
            topicInstance.save(failOnError: true, flush: true) ? (flash.message = "Topic Created.......") : (flash.sorry = "Sorry, Some error occurs try after some time.")
        }
        redirect(controller: 'home', action: 'dashboard')
    }

    def showCurrentUserTopics() {
        def topics = Topic.createCriteria().list(max: 3, offset: 0) {
            eq("createdBy", userService.userFromSession)
        }
        def count = topics.totalCount
        render(view: "/subscription/viewAll", model: [flag: 1, currentUser: userService.getUserFromSession(), topics: topics, total: count])

    }

    def showAllTopics() {
        def topics = Topic.createCriteria().list(max: 3, offset: 0) {
        }
        def count = topics.totalCount
        render(view: "/topic/showAllTopics", model: [currentUser: userService.getUserFromSession(), trendingTopic: topics, total: count, flag: 1])
    }

    def paginateShowAllTopics() {
        def topics = Topic.createCriteria().list(max: params.max, offset: params.offset) {
        }
        def count = topics.totalCount
        render(template: "/home/trendingTopic", model: [currentUser: userService.getUserFromSession(), offset: params.offset, flag: 1, trendingTopic: topics, total: count])
    }

}
