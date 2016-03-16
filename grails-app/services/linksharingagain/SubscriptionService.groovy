package linksharingagain

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def unSubscribeUser(Long subscriptionId) {

        Subscription subscription = Subscription.get(subscriptionId)
        subscription.delete()
    }
}
