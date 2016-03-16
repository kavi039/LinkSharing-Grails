package linksharingagain

class LinkResource extends Resource {
    String url

    static constraints = {
        url(url: true)
    }
}
