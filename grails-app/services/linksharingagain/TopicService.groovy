package linksharingagain

import grails.transaction.Transactional

@Transactional
class TopicService {

    List<Topic> trendingTopicList() {
        List<Topic> trendingTopic = Topic.list().sort { it.resources.size() }.reverse()
        trendingTopic = trendingTopic.size() < 5 ? trendingTopic.asList() : trendingTopic.subList(0, 5)
        return trendingTopic
    }

}
