<%@ page import="grails.Message" %>

<div class="message">
    <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} required">
        <label for="subject">
            <g:message code="message.subject.label" default="Subject"/>
        </label>
        <g:fieldValue field="subject" bean="${messageInstance}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} required">
        <label for="content">
            <g:message code="message.content.label" default="Content"/>
        </label>
        <g:fieldValue field="content" bean="${messageInstance}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'author', 'error')} required">
        <label for="author">
            <g:message code="message.author.label" default="Author"/>
        </label>
        <g:fieldValue field="author" bean="${messageInstance}"/>
    </div>

    <div class="buttons">
        <g:link class="save" action="reply" id="${messageInstance?.id}">
            Reply
        </g:link>
    </div>
</div>