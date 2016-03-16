package linksharingagain

class SearchController {
    SearchService searchService
    TopicService topicService
    LoginService loginService
    UserService userService

    def searchText() {
        List<Resource> resources = searchService.searchResourceDescription(params.ajaxSearchIt) as List<Resource>
        render(template: "/home/inbox", model: [resourcesList: resources])
    }

    def searchGlobal() {

        List<Topic> trendingTopic = topicService.trendingTopicList()
        List<Resource> resources = searchService.searchAllByTopicNameAndResource(params.ajaxSearchIt)
        List<Resource> recentPosts = Resource.list().findAll{}.sort({ it.resourceRatings }).reverse()
        recentPosts = recentPosts.size() < 5 ? recentPosts.asList() : recentPosts.subList(0, 3)
        render(template: "searchText", model: [trendingTopic: trendingTopic, searchText: params.ajaxSearchIt, resourcesList: resources, TopResource: recentPosts])
    }

    def searchUser() {
        List<User> userList = searchService.searchListOfUser(params.ajaxSearchIt)
        render(template: '/user/userTable', model: [userList: userList])
    }
}
