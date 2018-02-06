<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>

<%!


public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	System.out.println("PAYUFORM --- START----");
	String merchant_key="gtKFFx";
	String salt="eCwWELxi";
	String action1 ="";
	String base_url="https://test.payu.in";
	int error=0;
	String hashString="";
	String successUrl = "http://192.168.2.130:8088/clientapp/success.jsp";
	String failureUrl = "http://192.168.2.130:8088/clientapp/failure.jsp";
	String emailId = "abc@test.com";
	
	System.out.println("********inside payuform***********");

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	String merchantTid = params.get("merchantTid");
	System.out.println("Merchant Transactionid : "+merchantTid);
	if(merchantTid == null){
		if(empty(params.get("txnid"))){
			Random rand = new Random();
			String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
			txnid=hashCal("SHA-256",rndm).substring(0,20);
			params.put("txnid",txnid);
		}
		else
			txnid=params.get("txnid");
	}else{
		txnid = merchantTid;
		System.out.println("Merchant id is assigned to txnid : "+txnid);
		params.put("txnid",txnid);
	}

	System.out.println("Transactionid : "+txnid);
	
	
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))	){
			
			error=1;
			System.out.println(" *** 1  ");
			}
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
			System.out.println(" *** 2  ");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
		System.out.println(" *** 3  ");
	}
		
System.out.println("Action url : "+action1);
%>
<html>

<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	  var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body onload="submitPayuForm();">


<form action="<%= action1 %>" method="post" name="payuForm">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
	  <input type="hidden" name="surl" value="<%= successUrl %>"/>
	  <input type="hidden" name="furl" value="<%= failureUrl %>"/>
	  
      <table>
        <tr>
          <td><b>Please wait you will be redirecting to payment page....</b></td>
        </tr>
        <tr>
         
          <td><input type = "hidden" name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" /></td>
          
          <td><input type = "hidden" name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" /></td>
        </tr>
        <tr>
         
          <td><input type = "hidden" name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" /></td>
          
          <td><input type = "hidden" name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" /></td>
        </tr>
        <tr>
          
          <td colspan="3"><input type = "hidden" name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="64" /></td>
        </tr>
		
		 <tr>
        
          <td colspan="3"><input type = "hidden" name="merchantTid" value="<%= (empty(params.get("merchantTid"))) ? "" : params.get("merchantTid") %>" size="64" /></td>
        </tr>
        		
        <tr>
          <% if(empty(hash)){ %>
            <td colspan="4"><input type="submit" value="Submit" /></td>
          <% } %>
        </tr>
      </table>
    </form>


</body>
</html>