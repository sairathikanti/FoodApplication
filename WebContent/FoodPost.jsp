
<%@page import="java.util.List"%>
<%@page import="com.food.Dao.FoodPostDao"%>  
<%@page import="com.food.Dao.FoodDisplayDao"%> 
<%@page import="com.food.beans.EmailSending"%> 
<jsp:useBean id="obj" class="com.food.beans.FoodPostBean"/>  
  
<jsp:setProperty property="*" name="obj"/> 
   
   
   
  <% 
  int i=FoodPostDao.post(obj); 
  System.out.print(i);
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("success.jsp");
        List<String> emails = FoodPostDao.getSeekerEmails();
        for (String email : emails) {
        	   EmailSending.sendEmail(email);
    	}
       // EmailSending email = new EmailSending();
        
     
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	out.println("Failed to post the food, "+"<a href='success.jsp'>Go to Home</a>");
        // response.sendRedirect("success.jsp");
    }
%>

