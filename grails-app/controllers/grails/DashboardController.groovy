package grails
//import tekdays.Blurb

class DashboardController {

    def twitter4jService

    def index() {
    }

    def dashboard() {
        def event = TekEvent.get(params.id)
        if (event) {
            if (event.organizer.userName == session.user.userName
                    || event.volunteers.collect{it.userName}.contains(session.user.userName)) {
                def tasks = Task.findAllByEventAndCompleted(event, false, [max:5, sort: 'dueDate'])
                def volunteers = event.volunteers

                def messages = Message.findAllByEventAndParentIsNotNull(event, [sort: 'id', order: 'desc'])
                def sponsorships = event.sponsorships

                def blurb = Blurb.findByName("custom_${event.id}")
                if(!blurb) {
                    blurb = new Blurb(name: "custom_${event.id}", content: "").save()
                }

                return [event: event, tasks: tasks, volunteers: volunteers, messages: messages, sponsorships: sponsorships, blurb: blurb]
            } else {
                flash.message = "Access to dashboard for ${event.name} denied."
                redirect(controller: 'tekEvent', action: 'list')
            }
        } else {
            flash.message = "No event was found with id: ${params.id}"
            redirect(controller: 'tekEvent', action: 'list')
        }
    }

    def updateBlurb () {
        def blurb = Blurb.get(params.id)
        blurb.content = params.content
        blurb.save()
        redirect(action:'dashboard', id:params.eventId)
    }

    def tweet () {
        def event = TekEvent.get(params.id)
        if (event){
            twitter4jService.updateStatus("${event.name} - " + params.status)
        }
        redirect(controller: 'dashboard', action: 'dashboard', params: params)
    }
}
