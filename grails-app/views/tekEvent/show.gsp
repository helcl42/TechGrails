<%@ page import="grails.TekEvent" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <gui:resources components="['dialog']"/>
    <g:set var="entityName" value="${message(code: 'tekEvent.label', default: 'TekEvent')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-tekEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label" default="Home"/>
            </a>
        </li>
        <li>
            <g:link class="list" action="list">
                <g:message code="default.list.label" args="[entityName]"/>
            </g:link>
        </li>
        <li>
            <g:link class="create" action="create">
                <g:message code="default.new.label" args="[entityName]"/>
            </g:link>
        </li>
        <li>
            <g:link class="list" controller="dashboard" action="dashboard" id="${tekEventInstance.id}" >Event Dashboard</g:link>
        </li>
        <g:volunteerButton eventId="${tekEventInstance.id}" />
    </ul>
</div>

<div id="show-tekEvent" class="content scaffold-show" role="main">
    <h1>${fieldValue(bean: tekEventInstance, field: 'name')}</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list tekEvent">

        <g:if test="${tekEventInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label">
                    <g:message code="tekEvent.description.label" default="Description"/>
                </span>
                <span class="property-value" aria-labelledby="description-label">
                    <g:fieldValue bean="${tekEventInstance}" field="description"/>
                </span>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.city}">
            <g:if test="${tekEventInstance?.venue}">
                <li class="fieldcontain">
                    <span id="city-label" class="property-label">Location</span>
                    <span class="property-value" aria-labelledby="city-label">
                        <g:fieldValue bean="${tekEventInstance}" field="city"/>
                    </span>
                    <span class="property-value" aria-labelledby="venue-label">
                        <g:fieldValue bean="${tekEventInstance}" field="venue"/>
                    </span>
                </li>
            </g:if>
        </g:if>

        <g:if test="${tekEventInstance?.startDate}">
            <li class="fieldcontain">
                <span id="startDate-label" class="property-label">
                    <g:message code="tekEvent.startDate.label" default="Start Date"/>
                </span>
                <span class="property-value" aria-labelledby="startDate-label">
                    <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance?.startDate}"/>
                </span>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.endDate}">
            <li class="fieldcontain">
                <span id="endDate-label" class="property-label">
                    <g:message code="tekEvent.endDate.label" default="End Date"/>
                </span>
                <span class="property-value" aria-labelledby="endDate-label">
                    <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance?.endDate}"/>
                </span>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.organizer}">
            <li class="fieldcontain">
                <span id="organizer-label" class="property-label">
                    <g:message code="tekEvent.organizer.label" default="Organizer"/>
                </span>
                <span class="property-value" aria-labelledby="organizer-label">
                    <g:link controller="tekUser" action="show" id="${tekEventInstance?.organizer?.id}">
                        ${tekEventInstance?.organizer?.encodeAsHTML()}
                    </g:link>
                </span>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.volunteers}">
            <li class="fieldcontain">
                <span id="volunteers-label" class="property-label">
                    <g:message code="tekEvent.volunteers.label" default="Volunteers"/>
                </span>
                <g:each in="${tekEventInstance.volunteers}" var="v">
                    <span class="property-value" aria-labelledby="volunteers-label">
                        <g:link controller="tekUser" action="show" id="${v.id}">
                            ${v?.encodeAsHTML()}
                        </g:link>
                    </span>
                </g:each>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.sponsorships}">
            <li class="fieldcontain">
                <span id="sponsorships-label" class="property-label">
                    <g:message code="tekEvent.sponsorships.label" default="Sponsorships"/>
                </span>
                <g:each in="${tekEventInstance.sponsorships}" var="s">
                    <span class="property-value" aria-labelledby="sponsorships-label">
                        <g:link controller="sponsorship" action="show" id="${s.id}">
                            ${s.sponsor?.encodeAsHTML()}
                        </g:link>
                    </span>
                </g:each>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.tasks}">
            <li class="fieldcontain">
                <span id="tasks-label" class="property-label">
                    <g:message code="tekEvent.tasks.label" default="Tasks"/>
                </span>
                <g:each in="${tekEventInstance.tasks}" var="t">
                    <span class="property-value" aria-labelledby="tasks-label">
                        <g:link controller="task" action="show" id="${t.id}">
                            ${t.title?.encodeAsHTML()}
                        </g:link>
                    </span>
                </g:each>
            </li>
        </g:if>

        <g:if test="${tekEventInstance?.messages}">
            <li class="fieldcontain">
                <span id="messages-label" class="property-label">
                    <g:message code="tekEvent.messages.label" default="Messages"/>
                </span>
                <span class="property-value" aria-labelledby="messages-label">
                    <g:link controller="message" action="list" id="${tekEventInstance.id}">
                        View messages
                    </g:link>
                </span>
            </li>
        </g:if>
    </ol>

    <h1>Breaking News</h1>
    <div id="blurbText">
        <g:blurb name="custom_${tekEventInstance?.id}"/>
    </div>

    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${tekEventInstance?.id}"/>
            <g:link class="edit" action="edit" id="${tekEventInstance?.id}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>

</div>

<gui:dialog title="${'Volunteer for' + tekEventInstance.name}"
            form="true"
            controller="tekEvent"
            action="volunteer"
            update="volunteerSpan"
            triggers="[show: [id: 'volunteerButton', on: 'click']]">
            <input type="hidden" name="id" value="${tekEventInstance.id}"/>
            Welcome to the team!
            Your help will make a huge difference.
</gui:dialog>

</body>
</html>
