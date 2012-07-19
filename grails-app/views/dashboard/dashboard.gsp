<%--
  Created by IntelliJ IDEA.
  User: lubos
  Date: 7/17/12
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>
<html>
<head>
    <title>TekDays - DashBoard</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/>
            </a>
        </li>
        <li>
            <g:link class="create" controller="task" action="create">
                Create Task
            </g:link>
        </li>
        <li>
            <g:link class="create" controller="sponsorship" action="create">
                Add Sponsor
            </g:link>
        </li>
        <li>
            <g:link class="list" controller="sponsor" action="list">
                All Sponsors
            </g:link>
        </li>
    </ul>
</div>

<div id="event" class="dashItem">
    <g:render template="event" model="${['event': event]}"/>
</div>

<div id="blurb" class="dashItem">
    <g:render template="blurb" model="${[blurb: blurb, event: event]}"/>
</div>

<div id="tasks" class="dashItem">
    <g:render template="tasks" model="${['tasks': tasks]}"/>
</div>

<div id="volunteer" class="dashItem">
    <g:render template="volunteers" model="${['volunteers': volunteers]}"/>
</div>

<div id="messages" class="dashItem">
    <g:render template="messages" model="${['messages': messsages]}"/>
</div>

<div id="sponsors" class="dashItem">
    <g:render template="sponsors" model="${['sponsorships': sponsorsorships]}"/>
</div>

<div id="twitter" class="dashItem">
    <g:render template="twitter" model="${['event': event]}"/>
</div>

</body>
</html>