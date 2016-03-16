package linksharingagain

import enums.Visibility
import grails.transaction.Transactional
import groovy.time.TimeCategory

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class LoginService {
    List<Resource> fetchTopFiveResources() {
        List<Resource> resources = Resource.createCriteria().list(max: 3, offset: 0, sort: 'dateCreated', order: 'desc') {
            'topic' {
                eq("visibility", Visibility.Public)
            }
        } as List<Resource>
        resources
    }

    List<Resource> topPostList(String selectedValue) {
        DateFormat srcDf = new SimpleDateFormat("dd/MM/yyyy")
        String date = srcDf.format(new Date())
        List<Resource> recentPosts = []
        use(TimeCategory) {
            if (selectedValue == "Today") {
                recentPosts = Resource.list().findAll { srcDf.format(it.dateCreated) == date }.sort({
                    it.resourceRatings.score
                }).reverse()
            }
            if (selectedValue == "Week" || selectedValue == null) {
                recentPosts = Resource.findAllByDateCreatedBetween((new Date() - 7), new Date()).sort({
                    it.resourceRatings.score
                }).reverse()
            }
            if (selectedValue == "Month") {
                recentPosts = Resource.findAllByDateCreatedBetween((new Date() - 1.month), new Date()).sort({
                    it.resourceRatings.score
                }).reverse()
            }
            if (selectedValue == "Year") {
                recentPosts = Resource.findAllByDateCreatedBetween((new Date() - 1.year), new Date()).sort({
                    it.resourceRatings.score
                }).reverse()
            }
            recentPosts = recentPosts.size() < 5 ? recentPosts.asList() : recentPosts.subList(0, 3)
        }
        return recentPosts

    }
}
