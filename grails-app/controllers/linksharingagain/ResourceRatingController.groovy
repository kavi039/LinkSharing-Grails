package linksharingagain

class ResourceRatingController {
    static scaffold = true
    BootstrapService bootstrapService
    UserService userService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def rateResource() {
        String s = params.rating
        Double rate = s.toDouble()
        ResourceRating resourceRating1 = ResourceRating.findByUsersAndResources(userService.userFromSession, Resource.get(params.resourceId))
        if (!resourceRating1) {
            ResourceRating resourceRating = bootstrapService.resourceRating(userService.userFromSession, Resource.get(params.resourceId), rate)
            resourceRating.save(flush: true)
        } else {
            resourceRating1.score = rate
            resourceRating1.save(flush: true)
        }
        render(true)
    }

}
