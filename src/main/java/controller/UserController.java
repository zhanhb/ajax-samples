package controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import model.JsonResponse;
import model.SimpleUser;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	private List<SimpleUser> userList = new ArrayList<SimpleUser>(); 
	
	@RequestMapping(value="/simpleUser",method=RequestMethod.GET)
	public String showForm(){
		return "simpleUser";
	}
	
	@RequestMapping(value="/simpleUser",method=RequestMethod.POST)
	public @ResponseBody JsonResponse addUser(@ModelAttribute(value="user") @Valid SimpleUser user, BindingResult result ){
		JsonResponse res = new JsonResponse();
		if(!result.hasErrors()){
			userList.add(user);
			res.setStatus("SUCCESS");
			res.setResult(userList);
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

}
