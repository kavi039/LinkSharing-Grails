package linksharingagain

class UserController {
    ResourceService resourceService
    UserService userService

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = [action: this.&checkUserAdminOrNot, only: ['showUserList']]

    def showUserList() {
        checkUserAdminOrNot()
        List<User> userList = User.findAll()
        render(view: 'showUserList', model: [userCount: User.count(), userList: userList])
    }

    private boolean checkUserAdminOrNot() {
        if (userService.getUserFromSession().admin) {
            return true
        }
    }

    def showAllPost() {
        List<Resource> resources = Resource.createCriteria().list(max: 5,offset: 0,sort:'dateCreated',order:'desc') {
        } as List<Resource>
        def total=resources.totalCount
        render(view: "/subscription/showAllPost", model:[resources:resources,currentUser:userService.userFromSession,total: total,checkAction:true])
    }
    def paginateShowAllPost(Long max,Long offset) {
        List<Resource> resources = Resource.createCriteria().list(max:max,offset: offset,sort:'dateCreated',order:'desc') {

        } as List<Resource>
        def total=resources.totalCount

        render(template:"/subscription/showPostPagination", model:[resources:resources,currentUser:userService.userFromSession,offset: offset,total: total])
    }


    def markActivateOrDeactivate() {
        User user = User.get(params.userId)
        user.active = !user.active
        user.save(flush: true)
        redirect(controller: 'user', action: 'showUserList')
    }

    def sortUser() {
        List<User> sortUserList = userService.sortUserList(params.ajaxSelectedValue)
        render(template: 'userTable', model: [userList: sortUserList,userCount: sortUserList.size()])
    }
}
