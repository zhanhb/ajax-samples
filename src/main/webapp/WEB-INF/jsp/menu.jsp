<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/userNoAjax.htm" var="userNoAjaxUrl" />
<a href="${userNoAjaxUrl}">Plain html form validation</a>
<br/>
<c:url value="/userAjax.htm" var="userAjaxUrl" />
<a href="${userAjaxUrl}">Ajax-based form validation</a>
<br/>
<c:url value="/userAjaxBootstrap.htm" var="userBootstrap" />
<a href="${userBootstrap}">Ajax-based form validation using Bootstrap for CSS rendering</a>