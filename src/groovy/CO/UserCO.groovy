package CO

import grails.validation.Validateable

@Validateable
class UserCO {

    String password
    String confirmPassword

    static constraints = {
        password validator: { val, obj ->
            if (val != obj.confirmPassword) {
                return 'linksharingagain.UserCO.password.mismatch'
            } else {
                return true
            }
        }

    }
}

