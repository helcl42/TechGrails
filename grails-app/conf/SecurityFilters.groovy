package grails

class SecurityFilters {

    def filters = {
        doLogin(controller: '*', action: '*') {
            before = {
                if (!controllerName)
                    return true

                if(params.aName.equals('create') && params.cName.equals('tekUser')) {
                    redirect(controller: 'tekUser', action: 'create')
                    return false
                }

                def allowedActions = ['show', 'index', 'list', 'login', 'validate', 'search', 'create', 'save']
                if (!session.user && !allowedActions.contains(actionName)) {
                    redirect(controller: 'tekUser', action: 'login', params: ['cName': controllerName, 'aName': actionName])
                    return false
                }
            }
            /*
            after = { Map model ->
            }
            afterView = { Exception e ->
            }
            */
        }
    }
}
