
<h3>Enter Custom Content for Event Show Page</h3>
<g:form name="blurbForm" action="updateBlurb" id="${blurb?.id}">
    <textarea name="content" rows="3" cols="50" style="width: 98%; height: 50px">
        ${blurb?.content}
    </textarea>
    <input type="hidden" name="eventId" value="${event?.id}" >
    <input type="submit" value="Update Content" >
</g:form>