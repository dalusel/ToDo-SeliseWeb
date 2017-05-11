//trigger submit button to save the status if check box is clicked
$(document).ready(function(){
    $(".my_Status").click(function(){        
    	var id= $(this).attr('id')
    	 $(".my_TaskID").val(id) 	
        $(".my_Submit").trigger("click")
    });
})

//accept time b/w 1 and 12 since we have meridiem
 var ready = $(document).ready(function(){
    $(".my_Time").keypress(function(e){
    	if (e.keyCode >= 48 && e.keyCode <= 57) {
            var time = $(".my_Time").val()
            if(time.length == 0)
                return true
            else if(time.length ==1)
            {
                if(e.keyCode >= 48 && e.keyCode <=50)
                	return true
                else 
                	return false
            }
            else
            	return false
        }
        else
            return false;
    });
})

//for javascript to work if back button is clicked
window.onpopstate = function() {
window.location.reload(true);
};


