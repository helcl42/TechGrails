package grails

class TekDaysTagLib {

    def messageThread = {attrs ->
        def messages = attrs.messages.findAll {msg -> !msg.parent}
        processMessages(messages, 1)
    }

    void processMessages(messages, indent) {
        messages.each {msg ->
            def body = "${msg?.author} - ${msg?.subject}"
            out << "<div style='height:30; margin-left:${indent * 20}px;'>"
            out << "${remoteLink(action: 'showDetail', id: msg.id, update: 'details', body)}"
            out << "</div>"

            def children = Message.findAllByParent(msg)
            if (children) {
                processMessages(children, indent + 1)
            }
        }
    }

    def backwards = {attrs, body ->
        body.reverse();
    }

    def blurb = { attrs ->
        def blurb = Blurb.findByName(attrs.name)
        if (blurb) {
            out << "${blurb?.content ?: ''}"
        }
    }

    def loginToggle = {
        out << "<div id='login'>"
        if (session.user) {
            out << "<span id=loginInfo>"
            out << "Logged in as "
            out << "<a href='${createLink(controller: 'tekUser', action: 'show', id: session.user.id)}'>"
            out << "${session.user}</a>"
            out << "</span><span class='buttons-content' style='float:right;margin-right: 10px;'>"
            out << "<a href='${createLink(controller: 'tekUser', action: 'logout')}'>"
            out << "Logout</a></span>"
        } else {
            out << "<span id=loginInfo>"
            out << "<a href='${createLink(controller: 'tekUser', action: 'create')}'>"
            out << "Register</a></span>"
            out << "<span class='buttons-content' style='float:right;margin-right:10px;'>"
            out << "<a href='${createLink(controller: 'tekUser', action: 'login')}'>"
            out << "Login</a></span>"
        }
        out << "</div><br/>"
    }

    def organizerEvents = {
        if (session.user) {
            def events = TekEvent.findAllByOrganizer(session.user)
            if (events) {
                out << "<div style='margin-left:25px; margin-top:25px; width:85%'>"
                out << "<h3>Events you are organizing:</h3>"
                out << "<ul>"
                events.each {
                    out << "<li><a href='"
                    out << "${createLink(controller: 'tekEvent', action: 'show', id: it.id)}'>"
                    out << "${it}</a></li>"
                }
                out << "</ul>"
                out << "</div>"
            }
        }
    }

    def volunteerEvents = {
        if (session.user) {
            def events = TekEvent.createCriteria().list {
                volunteers {
                    eq('id', session.user?.id)
                }
            }
            if (events) {
                out << "<div style='margin-left:25px; margin-top:25px; width:85%'>"
                out << "<h3>Events you volunteered for:</h3>"
                out << "<ul>"
                events.each {
                    out << "<li><a href='"
                    out << "${createLink(controller: 'tekEvent', action: 'show', id: it.id)}'>"
                    out << "${it}</a></li>"
                }
                out << "</ul>"
                out << "</div>"
            }
        }
    }

    def volunteerButton = { attrs ->
        if (session.user) {
            def user = session.user.merge();
            def event = TekEvent.get(attrs.eventId)
            if (event && !event.volunteers.contains(user)) {
                out << "<span id='volunteerSpan' class='menuButton'>"
                out << "<button id='volunteerButton' type='button'>"
                out << "Volunteer for this Event"
                out << "</button>"
                out << "</span>"
            }
        }
    }
}


