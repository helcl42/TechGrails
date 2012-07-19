<%--
  Created by IntelliJ IDEA.
  User: lubos
  Date: 7/18/12
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta content="main" name="layout"/>
    <title>TekEvent Search Results</title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/>
            </a>
        </li>
    </ul>
</div>

<div id="list-message" class="content scaffold-list" role="main">
    <h1>Search results</h1>

    <div id="messageList" accesskey="">
        <ul>
            <g:if test="${events}">
                <g:each in="${events}" var="event">
                    <li>
                        <g:link controller="tekEvent" action="show" id="${event.id}">
                            ${event}
                        </g:link>
                    </li>
                </g:each>
            </g:if>
            <g:else>
                <h3>No Matching results found</h3>
            </g:else>
        </ul>
    </div>
</div>
</body>
</html>