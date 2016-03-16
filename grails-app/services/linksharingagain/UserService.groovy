package linksharingagain

import org.springframework.web.context.request.RequestContextHolder

import javax.servlet.http.HttpSession

class UserService {
    static transactional = false

    String getLoggedInUserEmail() {
        return session["userEmail"].toString()
    }

    User getUserFromSession() {
        User.findByEmail(getLoggedInUserEmail())
    }

    private static HttpSession getSession() {
        return RequestContextHolder.currentRequestAttributes().getSession()
    }

    List<User> sortUserList(String selectedValue) {
        List<User> userList = []
        if (selectedValue == "AllUsers") {
            userList = User.findAll()
        }
        if (selectedValue == "Activated") {
            userList = User.findAllByActive(true)
        }
        if (selectedValue == "Deactivated") {
            userList = User.findAllByActive(false)
        }
        return userList
    }

}
