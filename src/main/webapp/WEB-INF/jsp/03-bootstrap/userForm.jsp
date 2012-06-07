<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add User</title>
		
		<spring:url value="/bootstrap/css/bootstrap.min.css" var="bootstrapUrl" />
		<link href="${bootstrapUrl}" rel="stylesheet">
		
		<spring:url value="/js/jquery.js" var="jqueryUrl" />
		<script src="${jqueryUrl}/js/jquery.js"></script>
	</head>
	<body>

		<div class="container" style="padding-top: 50px;">
			<jsp:include page="../menu.jsp"/>
						
			<c:if test="${successMessage !=  null}">
				<h1>${successMessage}</h1>
			</c:if>
				
			<spring:url value="/userAjaxBootstrap.htm" var="formUrl" />
			<spring:url value="/userAjaxBootstrap.json" var="formJsonUrl" />
	
			<!-- Bootstrap form -->
			<form:form modelAttribute="user" class="form-horizontal"
				id="add-user-form" action="${formUrl}">
				<fieldset>
					<div class="control-group" id="firstName">
						<label class="control-label">Enter your first name:</label>
						<div class="controls">
							<form:input path="firstName" />
							<span class="help-inline"><form:errors path="firstName" /></span>
						</div>
					</div>
					<div class="control-group" id="lastName">
						<label class="control-label">Enter your last name:</label>
						<div class="controls">
							<form:input path="lastName" />
							<span class="help-inline"><form:errors path="lastName" /></span>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Save changes</button>
						<button type="reset" class="btn">Cancel</button>
					</div>
				</fieldset>
			</form:form>
	
		</div>
	
		<script type="text/javascript">
			function collectFormData(fields) {
				var data = {};
				for (var i = 0; i < fields.length; i++) {
					var $item = $(fields[i]);
					data[$item.attr('name')] = $item.val();
				}
				return data;
			}
				
			$(document).ready(function() {
				var $form = $('#add-user-form');
				$form.bind('submit', function(e) {
					// Ajax validation
					var $inputs = $form.find('input');
					var data = collectFormData($inputs);
					
					$.post('${formJsonUrl}', data, function(response) {
						$form.find('.control-group').removeClass('error');
						$form.find('.help-inline').empty();
						
						if (response.status == 'FAIL') {
							for (var i = 0; i < response.result.length; i++) {
								var item = response.result[i];
								var $controlGroup = $('#' + item.fieldName);
								$controlGroup.addClass('error');
								$controlGroup.find('.help-inline').html(item.message);
							}
						}
					}, 'json');
					
					e.preventDefault();
					return false;
				});
			});
		</script>

	</body>
</html>