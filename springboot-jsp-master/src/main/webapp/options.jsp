<%@ page import="com.gateway.payumoney.model.TransactionRequestVO" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <%
    	String loyalities = "100";
    TransactionRequestVO transactionVO = (TransactionRequestVO)session.getAttribute("transactionVO");
    String firstname = transactionVO.getFirstname();
    String email = transactionVO.getEmail();
    String phone = transactionVO.getPhone();
    String productinfo = transactionVO.getProductinfo();
    String merchantTid = transactionVO.getMerchantTid();
    String amount = 	transactionVO.getAmount();
    %>
</head>
<body>
   <form action="./hello" method="post" name="payuForm">
   
	  <input type = "hidden" name="firstname" id="firstname" value="<%= firstname %>" />
	  <input type = "hidden" name="amount" id="amount" value="<%= amount %>" />  
	  <input type = "hidden" name="email" id="email"   value="<%= email %>"/>
	  <input type = "hidden" name="phone" id="phone"   value="<%= phone %>"/>
	  <input type = "hidden" name="firstname" id="firstname"  value="<%=firstname  %>" />
	  <input type = "hidden" name="productinfo" id="productinfo"  value="<%= productinfo %>" />
	  <input type = "hidden" name="merchantTid" id="merchantTid"  value="<%= merchantTid %>" />
	  
      <table>
        <tr>
          <td><b>Please select the payment options...</b></td>
        </tr>
        <tr>
         	<td><input type="radio" name="gender" value="male" checked> PayUMoney<br></td>
        </tr>
        <tr>
          <td><input type="radio" name="gender" value="female"> Mobile Balance<br></td>
        </tr>
        <tr>
         <td><input type="checkbox" name="vehicle" value="Bike"> You have <%= loyalities %> Bonus point<br></td>
        </tr>
        <tr>
         <td colspan="4"><input type="submit" value="Submit" /></td>
        </tr>
      </table>
      
    </form>


</body>
</html>
