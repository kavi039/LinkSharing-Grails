package linksharingagain

import enums.Visibility
import grails.transaction.Transactional

@Transactional
class HomeService {
    UserService userService

    def inbox(max, offset) {
        User currentUser = userService.getUserFromSession()
        def resources = ReadingItem.createCriteria().list(max: max, offset: offset) {
            projections {
                property("resource")
            }
            and {
                eq("user", currentUser)
                eq('isRead', false)
            }
        }
        resources
    }

    Boolean emailValidation(sendTo) {
        String email = sendTo
        String[] SplitEmail = email.split('@')

        if (SplitEmail[0].length() == 0 || SplitEmail[1].length() < 3)
            return false
        if (SplitEmail.length != 2)
            return false
        if (!SplitEmail[1].contains("."))
            return false
        for (Character it in email) {
            if (!it.isLetter() && !it.isDigit() && it != '_' && it != '.' && it != '@')
                return false
        }
        if (email.contains("..") || email.contains(".@") || email.contains("@.") || email.contains("._."))
            return false
        if (email.endsWith("."))
            return false

        return true;
    }

    List<Subscription> subscriptionOfUser(Integer max, Integer offset) {
        User currentUser = userService.getUserFromSession()
        List<Subscription> subscriptions = Subscription.createCriteria().listDistinct {
            and {
                eq("subscriber", currentUser)
                'topic' {
                    and {
                        eq("visibility",Visibility.Public)
                        'resources' {
                            order("dateCreated", "desc")
                        }
                    }
                }
            }
            maxResults max
            firstResult offset
        } as List<Subscription>
        return subscriptions
    }

    Integer updatePassword(String password) {
        String email = userService.getLoggedInUserEmail()
        Integer updateCount = User.executeUpdate("update User set password='$password' where email='$email'")
        return updateCount
    }
}
