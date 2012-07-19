<%@ page import="grails.Message" %>

<g:if test="${messageInstance.parent}">
    <input type="hidden" name="parent.id" value="${messageInstance.parent.id}" xmlns="http://www.w3.org/1999/html"/>
    <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'parent', 'error')} ">
        <label for="parent">Is Reply to</label>
        <span id="parent">"${messageInstance.parent.author}"</span>
    </div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="message.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" class="messageField" required="" value="${messageInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" class="messageField" cols="40" rows="5" maxlength="2000" required="" value="${messageInstance?.content}"/>
</div>


<input type="hidden" name="author.id" value="${session.user.id}"/>
<input type="hidden" name="event.id" value="${messageInstance?.event?.id}" />