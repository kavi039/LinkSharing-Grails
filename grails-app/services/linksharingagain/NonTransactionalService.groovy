package linksharingagain

import grails.transaction.Transactional

@Transactional
class NonTransactionalService {
static  transactional = false
    def createLog(def param){
       println  log.info(param)
    }
}
