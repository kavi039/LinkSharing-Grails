package linksharingagain

class ResourceRating {
    int score
    static belongsTo = [users: User, resources: Resource]

    static constraints = {
    }
}
