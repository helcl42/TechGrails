<%--
  Created by IntelliJ IDEA.
  User: lubos
  Date: 7/17/12
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="grails.Message" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}"/>
    <title>
        <g:message code="default.list.label" args="[entityName]"/>
    </title>
    <g:javascript library="prototype"/>
</head>

<body>

<a href="#list-message" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/>
            </a>
        </li>
        <li>
            <g:link class="create" action="create" params='["event.id": "${event?.id}"]'>
                <g:message code="default.new.label" args="[entityName]"/>
            </g:link>
        </li>
    </ul>
</div>

<div id="list-message" class="content scaffold-list" role="main">
    <h1>${event?.name} - Forum messages</h1>

    <div id="messageList">
        <g:messageThread messages="${messageInstanceList}"/>
    </div>

    <h3>Message details</h3>

    <div id="details">
    </div>
</div>
</body>
</html>
