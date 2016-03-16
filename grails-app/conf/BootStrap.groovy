import enums.Seriousness
import enums.Visibility
import linksharingagain.BootstrapService
import linksharingagain.DocumentResource
import linksharingagain.LinkResource
import linksharingagain.ReadingItem
import linksharingagain.Resource
import linksharingagain.ResourceRating
import linksharingagain.Subscription
import linksharingagain.Topic
import linksharingagain.User
import org.springframework.beans.factory.annotation.Value

import javax.swing.Renderer

class BootStrap {
    BootstrapService bootstrapService

    def init = { servletContext ->

        if (!User.count()) {
            bootstrapService.create()
        }
    }

    def destroy = {
    }

}
