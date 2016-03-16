package linksharingagain

class ApplicationTagLib {
    static namespace = "ls"
    static defaultEncodeAs = 'raw'
    UserService userService
    ResourceService resourceService

    def isSubscribe = { attrs, body ->
        if (!userService.getUserFromSession()) {
            out << "  "
            return
        }
        Subscription subscription = Subscription.findByTopicAndSubscriber(attrs.topic, userService.getUserFromSession())
        if (subscription) {
            if (attrs.topic.createdBy.id == userService.userFromSession.id || userService.getUserFromSession().admin) {
                out << g.render(template: "/home/editable", model: [topic: attrs.topic])
            } else {
                out <<" <br><a  class='ui-button ui-widget unSubscribe' href=javascript:void(0) data-ajax-url=' ${createLink(controller: "home", action: "renderUnSubscribeModal", params: [subscriptionId: subscription.id, topicId: attrs.topic.id])}' >UnSubscribe</a>"
            }
            out << g.render(template: "/home/isSubscribe", model: [subscription: subscription])

        }
    }


    def isNotSubscribe = { attrs, body ->
        if (!userService.getUserFromSession()) {
            out << "  "
            return
        }
        Subscription subscription = Subscription.findByTopicAndSubscriber(attrs.topic, userService.getUserFromSession())

        if (!subscription) {
            String des2 = "<a class='subscribe' class='ui-button ui-widget' href=javascript:void(0) data-ajax-url='" + g.createLink(controller: 'home', action: 'renderSubscribeModal', params: [topicId: attrs.topic.id]) + "'>Subscribe</a>"
            out << des2
        }

    }

    def isEditable = { attr, body ->
        if (attr.subscriptionTopic.createdBy.id == userService.userFromSession.id || userService.getUserFromSession().admin) {
            out << g.render(template: "/home/editable", model: [topic: attr.subscriptionTopic])
        } else {
            out << "  "
            return
        }
    }

    def resourceType = { attrs, body ->
        if (attrs.resource.class == DocumentResource) {
            out << g.link("Download", controller: "documentResource", action: "download", params: [resourceId: (attrs.resource).id])

        } else {
            LinkResource linkResource = Resource.findById(attrs.resource.id)
            def link = linkResource.url
            out << "<a href='" + link + "'> ViewFullSite</a>"
        }
    }

    def editResource = { attrs, body ->
        if (attrs.resource.createdBy.id == userService.getUserFromSession().id || userService.getUserFromSession().admin) {
            out << g.render(template: '/linkResource/editResource',model: [resource:attrs.resource,checkAction:attrs.checkAction])
        }
    }

    def readUnread = { attrs, body ->
        if (userService.getUserFromSession()) {
            ReadingItem readingItem = ReadingItem.findByResourceAndUser(attrs.resource, userService.getUserFromSession())
            if (readingItem) {
                String markRead = "<a class=" + attrs.anchorClass + " href=javascript:void(0) data-resource-id =${attrs.resource.id} data-ajax-url='" + g.createLink(controller: 'readingItem', action: 'renderReadUnreadUser') + "'>MarkAsRead</a>"
                String markUnRead = "<a class=" + attrs.anchorClass + " href=javascript:void(0) data-resource-id =${attrs.resource.id} data-ajax-url='" + g.createLink(controller: 'readingItem', action: 'renderReadUnreadUser') + "'>MarkAsUnRead</a>"

                readingItem.isRead ? (out << markUnRead) : (out << markRead)
            }
            if (!readingItem) {
                return
            }
        }
    }

    def displayLoggedInUserDetails = { attrs, body ->
        if (attrs.currentUser) {
            if (attrs.currentUser.admin) {
                out << g.render([template: '/layouts/layoutDropDownForAdmin', model: [currentUser: attrs.currentUser.firstName]])
            } else {
                out << g.render([template: '/layouts/layoutDropDownForUser', model: [currentUser: attrs.currentUser.firstName]])
            }
        }
    }


    def markActivateOrDeactivate = { attrs, body ->
        attrs.userInstance.active ? (out << ("<td>" + g.link("Deactivate", controller: "user", action: "markActivateOrDeactivate", params: [userId: (attrs.userInstance).id]) + "</td>")) : (out << ("<td>" + g.link("Activate", controller: "user", action: "markActivateOrDeactivate", params: [userId: (attrs.userInstance).id]) + "</td>"))
    }

    def avgScore = { attr ->
        Integer averageScore = resourceService.getResourceRatingAverage(attr.resource)
        out << g.render(template: "/subscription/rating", model: [averageScore: averageScore, resource: attr.resource, currentUser: userService.userFromSession])
    }

    def checkDescriptionSize = { attr, body ->
        if(attr.description.size()>10){
            out<<attr.description.subSequence(0,8)+"..."
        }else
        {
            out<<attr.description
        }
    }

}