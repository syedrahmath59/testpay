<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    
    <%
    	System.out.println("Inside hello.jsp");
    	String str = (String)request.getAttribute("name");
    	System.out.println("name = "+str);
    %>
</head>
<body>
    Hello ${name}
</body>
</html>