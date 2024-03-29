<h3>Things to do</h3>
<table>
    <thead>
        <tr>
            <th>Task Title</th>
            <th>Due Date</th>
            <th>Assigned</th>
        </tr>
    </thead>
    <g:each in="${tasks}" var="task">
        <tr>
            <td>${task.title}</td>
            <td><g:formatDate format="MM/dd/yyyy" date="${task.dueDate}"/></td>
            <td>${task.assignedTo}</td>
        </tr>
    </g:each>
</table>
<g:link class="dashLink" controller="task" action="list" id="${event.id}">
    View all tasks for this event (${event.tasks.size()}).
</g:link>