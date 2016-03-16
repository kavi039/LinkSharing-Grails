package linksharingagain

import CO.UserCO

import java.text.DateFormat
import java.text.SimpleDateFormat

class LoginController {
    HomeService homeService
    UserService userService
    LoginService loginService
    ResourceService resourceService
    def mailService

    def index() {
        List<Resource> recentPost = loginService.fetchTopFiveResources()
        DateFormat srcDf = new SimpleDateFormat("dd/MM/yyyy")
        String date = srcDf.format(new Date())
        List<Resource> topPost = Resource.list().findAll { srcDf.format(it.dateCreated) == date }.sort({
            it.resourceRatings.score
        }).reverse()

        [recentPost: recentPost, TopResource: topPost]
    }

    def register(UserCO userCO) {
        User user = new User(params)
        user.active = true
        user.admin = false
        user.photoPath = params.image ? resourceService.uploadPhoto(params.image, grailsApplication.config.upload.userImages.toString()) : null
        if (userCO.validate()) {
            if (user.validate() && user.save(flush: true, failOnError: true)) {
                flash.success = "Registered Successfully!"
            } else {
                flash.error = "Please Enter Right Information."
            }
        } else {
            flash.error = "Please Enter Right Information."
        }
        redirect(controller: "login", action: "index")
    }

    def topPost() {
        List<Resource> topPostList = loginService.topPostList(params.ajaxSelectedValue)
        render(template: "/login/topPostContentDiv", model: [TopResource: topPostList])
    }

    Boolean remoteValidateLoginForm() {
        User user = User.findByEmail(params.userEmail)
        render(user ? true : false)
    }

    Boolean remoteValidateRegistrationForm() {
        User user = User.findByEmail(params.userEmail)
        render(user ? false : true)
    }

    def loginHandler() {
        User user = User.findByEmailAndPassword(params.userEmail, params.password)
        if (user) {
            if (user.active) {
                session["userEmail"] = params.userEmail
                redirect(controller: "home", action: "dashboard")
                flash.message = "HEY !   Login Successfully........"
                return true
            } else {
                flash.fail = "Sorry u r DEACTIVATED by Admin........"
                redirect(controller: "login", action: "index")
            }
        } else {
            flash.fail = "Sorry, Wrong Password. Please Enter the right password"
            redirect(controller: "login", action: "index")
            return false
        }
    }

    def renderForgetTemplate() {
        render(template: "/login/forgetPassword")

    }

    def sendMailToResetPassword() {
        try {
            String tokenKey = new Date().time
            ForgetPassword forgetPassword = new ForgetPassword(token: tokenKey, user: User.findByEmail(params.emailId), expiryDate: new Date() + 1)
            forgetPassword.save(flush: true)
            mailService.sendMail {
                to "${params.emailId}"
                subject "ResetPassword"
                html g.link(" Click Here To Reset Your Password ", controller: 'login', action: 'renderResetPassword', absolute: true, params: [token: tokenKey])
                flash.success = "Email Sent ........................"
            }
        } catch (Exception e) {
            println("Exception ........................."+e)
            flash.error = "Some error occurred. Please try again later!"
        }
        redirect(controller: "login", action: "index")
    }

    def renderResetPassword() {
        render(view: 'resetPassword', model: [token: params.token])
    }

    def resetPassword(UserCO userCO) {
        ForgetPassword forgetPassword = ForgetPassword.findByToken(params.token)
        if (forgetPassword) {
            if (userCO.validate()) {
                forgetPassword.user.password = params.password
                forgetPassword.user.save(flush: true)
                flash.success = "Your password is reset, Now u can login ................"
            }
        } else {
            flash.fail = "Sorry you are not authorized................"
        }
        redirect(controller: "login", action: "index")
    }

    def logout() {
        flash.success = "Goodbye ${userService.userFromSession.name}"
        session["userEmail"] = null
        redirect(controller: "login", action: "index")
    }
}
