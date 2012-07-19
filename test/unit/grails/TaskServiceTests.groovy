package grails



import grails.test.mixin.*
import org.junit.*
import grails.test.GrailsUnitTestCase

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(TaskService)
class TaskServiceTests extends GrailsUnitTestCase {

    def taskService

    protected void setUp() {
        super.setUp();
        def u = new TekUser(fullName: 'Tester1',
                    userName: 'tester1',
                    email: 'test@test.com',
                    website: 'test.com',
                    bio: 'A test person')
        u.save()

    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAddDefaultTasks() {
        def e = new TekEvent(name: 'Tek Test',
                             city: 'TestCity, CZ',
                             description: 'Test production',
                             organizer: TekUser.findByUserName('tester1'),
                             venue: 'test center',
                             startDate: new Date(),
                             endDate: new Date() + 4)
        taskService.addDefaultTasks(e)
        assertEquals(e.tasks.size(), 6)
    }
}
