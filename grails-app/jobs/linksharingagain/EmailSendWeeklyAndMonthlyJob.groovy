package linksharingagain

import enums.Seriousness


class EmailSendWeeklyAndMonthlyJob {
    def mailService
    static  triggers = {
        cron name: "sendMail", cronExpression: " 0 0 12 1 1 ? *"
    }
    def execute() {
        List<Subscription> subscription = Subscription.findAllBySeriousness(Seriousness.verySerious)
        subscription.each { subscription1 ->
            mailService.sendMail {
                to subscription1.subscriber.email
                subject "check Mail Service "
                body "Mail Sent ........Again With Cron Expression............."
            }
        }
    }
}
