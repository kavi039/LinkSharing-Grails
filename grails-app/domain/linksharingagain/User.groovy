package linksharingagain

class User {
    String firstName
    String lastName
    String email
    String password
    String username
    String name
    Date lastUpdated
    Date dateCreated
    String photoPath

    boolean admin
    boolean active
    static transients = ['name']

    String getName() {
        return "${firstName} ${lastName}"
    }

    static hasMany = [topics: Topic, resources: Resource, subscriptions: Subscription, readingItems: ReadingItem, resourceRatings: ResourceRating]

    static constraints = {
        photoPath nullable: true ,blank: false
        email(unique: true,email: true)
        password(size: 5..15, blank: false)
    }

    static List<Resource> fetchTopics() {
        return createCriteria().list(max: 5, offset: 0) {
        } as List<Resource>
    }

}
