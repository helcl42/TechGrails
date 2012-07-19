<%--
  Created by IntelliJ IDEA.
  User: lubos
  Date: 7/17/12
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Login</title>
</head>
<body>
    <a href="#list-tekEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li>
                <a class="home" href="${createLink(uri: '/')}">
                    <g:message code="default.home.label"/>
                </a>
            </li>
        </ul>
    </div>

    <g:if test="${flash.message}" >
        <div class="message">${flash.message}</div>
    </g:if>

    <g:form action="validate">
        <input type="hidden" name="cName" value="${cName}" />
        <input type="hidden" name="aName" value="${aName}" />
        <div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'username', 'error')} ">
            <label for="username">Username</label>
            <g:textField name="username" value="${tekUserInstance?.username}"/>
        </div>
        <div class="fieldcontain ${hasErrors(bean: tekUserInstance, field: 'password', 'error')} ">
            <label for="password">Password</label>
            <g:passwordField name="password" value="" />
        </div>
        <div class="fieldcontain">
            <label></label>
            <input class="formButton" type="submit" value="login" />
        </div>
    </g:form>

</body>
</html>