package controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import model.Response;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AjaxBootstrapController {
	
	@RequestMapping(value="/userAjaxBootstrap",method=RequestMethod.GET)
	public String showFormAjax(Model model){
		model.addAttribute("user", new User());
		return "03-bootstrap/userForm";
	}
	
	@RequestMapping(value="/userAjaxBootstrap.json",method=RequestMethod.POST)
	public @ResponseBody Response processFormAjaxJson(Model model, @ModelAttribute(value="user") @Valid User user, BindingResult result ){
		Response res = new Response();
		if(!result.hasErrors()){
			res.setStatus("SUCCESS");
			res.setResult("Congratulations your form is valid");
		}else{
			res.setStatus("FAIL");
			List<FieldError> allErrors = result.getFieldErrors();
			List<UserErrorMessage> errorMesages = new ArrayList<UserErrorMessage>();
			for (FieldError objectError : allErrors) {
				errorMesages.add(new UserErrorMessage(objectError.getField(), objectError.getField() + "  " + objectError.getDefaultMessage()));
			}
			res.setResult(errorMesages);
			
		}
		
		return res;
	}

	@RequestMapping(value="/userAjaxBootstrap.htm",method=RequestMethod.POST)
	public String processFormAjax(@ModelAttribute(value="user") @Valid User user, BindingResult result ){
		return "03-bootstrap/userForm";
	}
}
