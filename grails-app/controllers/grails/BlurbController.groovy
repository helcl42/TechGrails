package grails

class BlurbController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ blurbInstanceList: Blurb.list( params ), blurbInstanceTotal: Blurb.count() ]
    }

    def show = {
        def blurbInstance = Blurb.get( params.id )

        if(!blurbInstance) {
            flash.message = "Blurb not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ blurbInstance : blurbInstance ] }
    }

    def delete = {
        def blurbInstance = Blurb.get( params.id )
        if(blurbInstance) {
            try {
                blurbInstance.delete()
                flash.message = "Blurb ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Blurb ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Blurb not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def blurbInstance = Blurb.get( params.id )

        if(!blurbInstance) {
            flash.message = "Blurb not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ blurbInstance : blurbInstance ]
        }
    }

    def update = {
        def blurbInstance = Blurb.get( params.id )
        if(blurbInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(blurbInstance.version > version) {

                    blurbInstance.errors.rejectValue("version", "blurb.optimistic.locking.failure", "Another user has updated this Blurb while you were editing.")
                    render(view:'edit',model:[blurbInstance:blurbInstance])
                    return
                }
            }
            blurbInstance.properties = params
            if(!blurbInstance.hasErrors() && blurbInstance.save()) {
                flash.message = "Blurb ${params.id} updated"
                redirect(action:show,id:blurbInstance.id)
            }
            else {
                render(view:'edit',model:[blurbInstance:blurbInstance])
            }
        }
        else {
            flash.message = "Blurb not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def blurbInstance = new Blurb()
        blurbInstance.properties = params
        return ['blurbInstance':blurbInstance]
    }

    def save = {
        def blurbInstance = new Blurb(params)
        if(!blurbInstance.hasErrors() && blurbInstance.save()) {
            flash.message = "Blurb ${blurbInstance.id} created"
            redirect(action:show,id:blurbInstance.id)
        }
        else {
            render(view:'create',model:[blurbInstance:blurbInstance])
        }
    }
}

