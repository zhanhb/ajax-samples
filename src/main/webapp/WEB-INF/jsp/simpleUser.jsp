<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<link href="<%=request.getContextPath() %>/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	var contexPath = "<%=request.getContextPath() %>";
</script>
<script src="<%=request.getContextPath() %>/js/validation.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/main.css">
</head>
<body>

<div class="container" style="padding-top: 50px;">

<!-- Bootstrap form -->
<form:form modelAttribute="user" class="form-horizontal" id="add-user-form">
	<fieldset>
		<div class="control-group" id="firstName">
			<label class="control-label">Enter your first name:</label>
			<div class="controls">
				<form:input path="firstName"/>
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group" id="lastName">
			<label class="control-label">Enter your last name:</label>
			<div class="controls">
				<form:input path="lastName"/>
				<span class="help-inline"></span>
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
	$(document).ready(function() {
		var $form = $('#add-user-form');
		$form.bind('submit', function() {
			// Ajax validation
			$.post(contexPath + '/simpleUser.htm', {'firstName=' + $form.find('input[name=firstName]').val(), 
				'lastName=' + $form.find('input[name=lastName]').val()}, function(response) {
				if (response.status == 'FAIL') {
					for (var i = 0; i < response.result.length; i++) {
						var item = response.result[i];
						var $controlGroup = $('#' + item.fieldName);
						$controlGroup.addClass('error');
						$controlGroup.find('.help-inline').html(item.message);
					}
				} else {
					$form.find('.control-group').removeClass('error');
					$form.find('.help-inline').empty();
				}
			}, 'json');
			return false;
		})
	});
</script>

</body>
</html>