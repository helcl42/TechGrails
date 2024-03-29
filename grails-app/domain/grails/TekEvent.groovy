package grails

class TekEvent {
    String city
    String name
    TekUser organizer
    String venue
    Date startDate
    Date endDate
    String description

    String toString() {
        "$name, $city"
    }

    static searchable = true

    static hasMany = [volunteers: TekUser,
            respondents: String,
            sponsorships: Sponsorship,
            tasks: Task,
            messages: Message]

    static constraints = {
        name()
        city()
        description(maxSize: 5000)
        organizer()
        venue()
        startDate()
        endDate()
        volunteers(nullable: true)
        sponsorships(nullable: true)
        tasks(nullable: true)
        messages(nullable: true)
    }
}