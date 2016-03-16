package linksharingagain

import enums.Seriousness
import enums.Visibility

class Subscription {
    Date dateCreated
    Seriousness seriousness
    User subscriber

    static belongsTo = [topic: Topic]

    static constraints = {
        topic unique: 'subscriber'
    }

    static Integer getSubscriptionCountForUser(User currentUser) {
        Subscription.createCriteria().listDistinct {
            and {
                eq("subscriber", currentUser)
                'topic' {
                    and {
                        eq("visibility", Visibility.Public)
                        'resources' {
                            order("dateCreated", "desc")
                        }
                    }
                }
            }
        }.size() as Integer
    }

}
