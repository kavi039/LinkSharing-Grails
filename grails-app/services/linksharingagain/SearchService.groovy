package linksharingagain

import grails.transaction.Transactional

@Transactional
class SearchService {
    HomeService homeService
    UserService userService

    List searchResourceDescription(String search) {
        List<Resource> resources = ReadingItem.createCriteria().list {
            projections {
                property("resource")
            }
            and {
                'resource' {
                    ilike("description", search + "%")
                }
                eq("user", userService.getUserFromSession())
                eq('isRead', false)
            }
        } as List<Resource>
        return resources
    }

    List<Resource> searchAllByTopicNameAndResource(String search) {
        List<Resource> resourceList = Resource.createCriteria().list {
            ilike("description", search + "%")
        } as List<Resource>

        List<Resource> topicList = Topic.createCriteria().list {
            ilike("topicName", search + "%")
        } as List<Resource>

        List newList = []
        topicList.each {
            newList += it.resources
        }
        List<Resource> searchResult = resourceList + newList
        return searchResult
    }

    List<User> searchListOfUser(String search) {
        List<User> searchList = []
        List<User> searchOnName = User.createCriteria().list {
            ilike("firstName", search + "%")
        } as List<User>
        List<User> searchOnEmail = User.createCriteria().list {
            ilike("email", search + "%")
        } as List<User>

        searchList = searchOnEmail + searchOnName
        return searchList
    }
}
