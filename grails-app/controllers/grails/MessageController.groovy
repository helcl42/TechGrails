package grails

import org.springframework.dao.DataIntegrityViolationException

class MessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def list
        def count
        def event = TekEvent.get(params.id);
        if(event) {
            list = Message.findAllByEvent(event, params)
            count = Message.countByEvent(event)
        }
        else {
            list = Message.list(params)
            count = Message.count()
        }
        render(view:'ajaxList' , model:[messageInstanceList: list, messageInstanceTotal: count, event: event])
    }

    def create() {
        def messageInstance = new Message();
        messageInstance.properties = params;
        return ['messageInstance':messageInstance]
    }

    def save() {
        def messageInstance = new Message(params)
        if (!messageInstance.save(flush: true)) {
            render(view: "create", model: [messageInstance: messageInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
        redirect(action: "show", id: messageInstance.id)
    }

    def show() {
        def messageInstance = Message.get(params.id)
        if (!messageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
            redirect(action: "list")
            return
        }

        [messageInstance: messageInstance]
    }

    def edit() {
        def messageInstance = Message.get(params.id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
            redirect(action: "list")
            return
        }

        [messageInstance: messageInstance]
    }

    def update() {
        def messageInstance = Message.get(params.id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (messageInstance.version > version) {
                messageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'message.label', default: 'Message')] as Object[],
                          "Another user has updated this Message while you were editing")
                render(view: "edit", model: [messageInstance: messageInstance])
                return
            }
        }

        messageInstance.properties = params

        if (!messageInstance.save(flush: true)) {
            render(view: "edit", model: [messageInstance: messageInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
        redirect(action: "show", id: messageInstance.id)
    }

    def delete() {
        def messageInstance = Message.get(params.id)
        if (!messageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
            redirect(action: "list")
            return
        }

        try {
            messageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'message.label', default: 'Message'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'message.label', default: 'Message'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def showDetail() {
        def messageInstance = Message.get(params.id);
        if (messageInstance) {
            render(template: "details", model: [messageInstance:messageInstance])
        }
        else {
            render("No message found with id: ${params.id}")
        }
    }

    def reply() {
        def parent = Message.get(params.id)
        def messageInstance = new Message(parent:parent, event:parent.event, subject:"RE: $parent.subject" )
        render(view:'create' , model:['messageInstance' :messageInstance])
    }
}
