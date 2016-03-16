package linksharingagain

class ApplicationFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                log.info("-------- PARAMS --------- >> " + params)
            }
            after = { Map model ->

            }
            afterView = { Exception e ->
            }
        }

        allExceptLoginUser(controller:'home|subscription|user', actionExclude:'posts|showUser|topics|index|renderImage',action: '*' ) {
            before = {
                if(!session["userEmail"]) {
                    flash.success = "You should logged in "
                    redirect(controller: "login", action: "index")
                    return true
                }
            }
        }
    }
}
