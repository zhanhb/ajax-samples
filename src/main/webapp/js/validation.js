/**
 * 
 */
function doAjaxPost() {  
	  // get the form values  
	  var name = $('#name').val();
	   
	  $.ajax({  
	    type: "POST",  
	    url: contexPath + "/simpleUser.htm",  
	    data: "name=" + name,  
	    success: function(response){
	      // we have the response 
	      if(response.status == "FAIL"){
	    	  errorInfo = "";
	    	  for(i =0 ; i < response.result.length ; i++){
	    		  errorInfo += "<br>" + (i + 1) +". " + response.result[i].message;
	    	  }
	    	  $('#error').html("Please correct following errors: " + errorInfo);
	    	  $('#info').hide('slow');
	    	  $('#error').show('slow');
	      }      
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}  