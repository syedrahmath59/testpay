package com.gateway.payumoney.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gateway.payumoney.model.TransactionRequestVO;

@Controller
@RequestMapping("/gateway")
public class GatewayController {
	
	@RequestMapping(value="/payumoney",method=RequestMethod.POST)
    public String redirect(Model model, @RequestBody TransactionRequestVO transactionRequestVO) {
        model.addAttribute("transactionRequestVO", transactionRequestVO);
        return "payuform";
    }
	
	 @RequestMapping("/hello")
	 public String hello(HttpServletRequest request,@RequestParam(value="amount") String amount,@RequestParam(value="firstname") String firstname,@RequestParam(value="email") String email,@RequestParam(value="merchantTid") String merchantTid,@RequestParam(value="productinfo") String productinfo,@RequestParam(value="phone") String phone) {
       System.out.println("*****************");
       HttpSession session = request.getSession(false);
       String view = null;
       if(session != null){
    	   view = "payuform";
       }else{
    	   view = "payuform";
       }
       return view;
	  }
	 
	 /*@RequestMapping("/hello")
	 public String hello(Model model, @RequestParam(value="amount") String amount,@RequestParam(value="firstname") String firstname,@RequestParam(value="email") String email,@RequestParam(value="merchantTid") String merchantTid,@RequestParam(value="productinfo") String productinfo,@RequestParam(value="phone") String phone) {
        model.addAttribute("amount", amount);
        model.addAttribute("firstname", firstname);
        model.addAttribute("email", email);
        model.addAttribute("productinfo", productinfo);
        model.addAttribute("merchantTid", merchantTid);
        model.addAttribute("phone", phone);
        return "payuform";
	  }*/
	 
	 @RequestMapping("/option")
	 public String showPaymenOptions(Model model, @RequestParam(value="amount") String amount,@RequestParam(value="firstname") String firstname,@RequestParam(value="email") String email,@RequestParam(value="merchantTid") String merchantTid,@RequestParam(value="productinfo") String productinfo,@RequestParam(value="phone") String phone,HttpServletRequest request) {
        model.addAttribute("amount", amount);
        model.addAttribute("firstname", firstname);
        model.addAttribute("email", email);
        model.addAttribute("productinfo", productinfo);
        model.addAttribute("merchantTid", merchantTid);
        model.addAttribute("phone", phone);
        model.addAttribute("loyaities", 10);
        HttpSession session = request.getSession(true); 
        TransactionRequestVO transactionRequestVO = new TransactionRequestVO();
        transactionRequestVO.setAmount(amount);
        transactionRequestVO.setEmail(email);
        transactionRequestVO.setFirstname(firstname);
        transactionRequestVO.setMerchantTid(merchantTid);
        transactionRequestVO.setPhone(phone);
        transactionRequestVO.setProductinfo(productinfo);
        session.setAttribute("transactionVO", transactionRequestVO);
        session.setAttribute("test", "test");
        return "options";
	  }
	    
	    

}
