package linksharingagain

class ReadingItem {

    boolean isRead
    User user

    static belongsTo = [resource:Resource  ]

    static constraints = {
    }

    static Integer getItemCountForUser(User currentUser, Boolean isRead){
      ReadingItem.createCriteria().count() {
            projections {
                property("resource")
            }
            and {
                eq("user", currentUser)
                eq('isRead', isRead)
            }
        } as Integer
    }
}
