package controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import model.JsonResponse;
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
public class AjaxController {
	
	@RequestMapping(value="/userAjax",method=RequestMethod.GET)
	public String showFormAjax(Model model){
		model.addAttribute("user", new User());
		return "02-ajax/userForm";
	}
	
	@RequestMapping(value="/userAjax.json",method=RequestMethod.POST)
	public @ResponseBody JsonResponse processFormAjaxJson(Model model, @ModelAttribute(value="user") @Valid User user, BindingResult result ){
		JsonResponse res = new JsonResponse();
		if(!result.hasErrors()){
			res.setStatus("SUCCESS");
			model.addAttribute("successMessage", "Congratulations your form is valid");
		}else{
			res.setStatus("FAIL");
			List<FieldError> allErrors = result.getFieldErrors();
			List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
			for (FieldError objectError : allErrors) {
				errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getField() + "  " + objectError.getDefaultMessage()));
			}
			res.setResult(errorMesages);
			
		}
		
		return res;
	}

	@RequestMapping(value="/userAjax.htm",method=RequestMethod.POST)
	public String processFormAjax(@ModelAttribute(value="user") @Valid User user, BindingResult result ){
		return "02-ajax/userForm";
	}
}
