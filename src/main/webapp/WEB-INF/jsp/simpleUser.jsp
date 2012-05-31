<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<!-- <h1>Add User</h1>
	<table>
		<tr><td colspan="2"><div id="error" class="error"></div></td></tr>
		<tr><td>Enter your name : </td><td> <input type="text" id="name" ><br/></td></tr>
		<tr><td colspan="2"><input type="button" value="Add Users" onclick="doAjaxPost()"><br/></td></tr>
		<tr><td colspan="2"><div id="info" class="success"></div></td></tr>
	</table> -->

<div class="container" style="padding-top: 50px;">

<!-- Bootstrap form -->
<form class="form-horizontal" id="add-user-form">
	<fieldset>
		<div class="control-group" id="name">
			<label class="control-label">Enter your name:</label>
			<div class="controls">
				<input type="text" name="name">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Save changes</button>
			<button type="reset" class="btn">Cancel</button>
		</div>
	</fieldset>
</form>

</div>

<script type="text/javascript">
	$(document).ready(function() {
		var $form = $('#add-user-form');
		$form.bind('submit', function() {
			// Ajax validation
			$.post(contexPath + '/simpleUser.htm', 'name=' + $form.find('input[name=name]').val(), function(response) {
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