package linksharingagain

import enums.Visibility

class HomeController {

    def mailService
    UserService userService
    HomeService homeService
    TopicService topicService
    NonTransactionalService nonTransactionalService
    ResourceService resourceService
    SubscriptionService subscriptionService

    def index() {
        if (session['userEmail']) {
            redirect(action: "dashboard")
        } else {
            redirect(controller: "login", action: "index")
        }
    }

    def posts() {
        User currentUser = userService.getUserFromSession()
        Resource resource = Resource.get(params.resourceId)
        List<Topic> trendingTopic = topicService.trendingTopicList()
        Integer averageScore = resourceService.getResourceRatingAverage(resource)
        render(view: "/home/posts", model: [resource: resource, currentUser: currentUser, trendingTopic: trendingTopic, averageScore: averageScore])
    }

    def editProfile() {
        User currentUser = userService.getUserFromSession()
        [currentUser: currentUser]
    }

    def edit() {
        String email = userService.getLoggedInUserEmail()
        String fName = params.firstName
        String lName = params.lastName
        String uName = params.username
        String path = resourceService.uploadPhoto(params.image, grailsApplication.config.upload.userImages.toString())
        User.executeUpdate("update User set firstName ='$fName', lastName = '$lName', username='$uName', photoPath='$path' where email='$email' ")
        redirect(controller: "home", action: "editProfile")
    }

    def editPassword() {
        Integer updateCount = homeService.updatePassword(params.password)
        updateCount == 0 ? (flash.sorry = "Sorry, Some error occurs try after some time.") : (flash.message = "HEY ! Update YOUR Password........")
        render(view: "editProfile", model: [currentUser: userService.userFromSession])
    }

    def showUser() {
        User user = User.get(params.userId)
        List<Topic> topicList = Topic.createCriteria().list(max: 3, offset: 0, sort: 'dateCreated', order: 'desc') {
            eq("createdBy", user)
            eq("visibility", Visibility.Public)
        } as List<Topic>

        List<Resource> postList = Resource.createCriteria().list(max: 5, offset: 0, sort: 'dateCreated', order: 'desc') {
            eq("createdBy", user)
            'topic' {
                eq("visibility", Visibility.Public)
            }
        } as List<Resource>
        render(view: 'showUser', model: [user: user, topicList: topicList, postList: postList, currentUser: userService.userFromSession])
    }

    def renderImage = {
        String profileImagePath = params.path
        File imageFile = new File(profileImagePath)
        if(imageFile){
            response.contentLength = imageFile.bytes.length
            response.outputStream << imageFile.bytes
            response.outputStream.flush()
        }

    }


    def topics() {
        User currentUser = userService.getUserFromSession()
        Topic topic = Topic.findById(params.TopicId)
        List<Subscription> subscriptions = Subscription.findAllByTopic(topic)
        subscriptions = subscriptions.size() < 5 ? subscriptions.asList() : subscriptions.subList(0, 5)
        List<Resource> resources = Resource.findAllByTopic(topic)
        resources = resources.size() < 5 ? resources.asList() : resources.subList(0, 5)
        render(view: 'topics', model: [currentUser: currentUser, topic: topic, resourcesList: resources, subscriptionList: subscriptions, checkAction: true])
    }


    def dashboard() {
        User currentUser = userService.getUserFromSession()
        List<Topic> trendingTopic = topicService.trendingTopicList()

        List<Resource> inboxList = homeService.inbox(3, 0) as List<Resource>
        Integer totalCountInbox = ReadingItem.getItemCountForUser(currentUser, false)

        List<Subscription> subscriptions = homeService.subscriptionOfUser(3, 0)
        Integer totalCountSubscription = Subscription.getSubscriptionCountForUser(currentUser)
        render(view: 'dashboard', model: [currentUser: currentUser, trendingTopic: trendingTopic, resourcesList: inboxList, subscriptions: subscriptions, total: totalCountInbox, totalSubscription: totalCountSubscription])
    }

    def paginateInbox() {
        User currentUser = userService.getUserFromSession()
        List<Resource> inboxList = homeService.inbox(params.max, params.offset) as List<Resource>
        Integer totalCount = ReadingItem.getItemCountForUser(currentUser, false)
        render(template: '/home/inbox', model: [resourcesList: inboxList, offset: params.offset, total: totalCount])
    }

    def paginateSubscription(Integer max, Integer offset) {
        User currentUser = userService.getUserFromSession()
        List<Subscription> subscriptions = homeService.subscriptionOfUser(max, offset)
        Integer totalCount = Subscription.getSubscriptionCountForUser(currentUser)
        render(template: '/home/subscription', model: [subscriptions: subscriptions, offset: offset, totalSubscription: totalCount, currentUser: currentUser])
    }

    def renderSubscribeModal(Long topicId) {
        render(template: "subscribeUser", model: [topic: Topic.get(topicId)])
    }

    def renderUnSubscribeModal() {
        subscriptionService.unSubscribeUser(params.subscriptionId.toLong())
        render(template: "renderTrendingTopic", model: [topic: Topic.get(params.topicId)])
    }


    def myMail() {
        if (homeService.emailValidation(params.to)) {
            nonTransactionalService.createLog(params.to)
            mailService.sendMail {
                to "${params.to}"
                subject "check Mail Service "
                html g.render(template: "inviteDocMail", model: [topic: Topic.get(params.body)])

                flash.message = "Email Sent ........................"
            }

        } else {
            flash.message = "Please Enter the Valid Email Address"
        }
        redirect(controller: "home", action: "dashboard")
    }

}