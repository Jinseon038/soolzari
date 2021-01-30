package com.soolzari.log;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.seller.model.vo.Seller;



@Aspect
@Component
public class LogAdvice {
	@Autowired
	private SHA256 sha256 ;
	 @Pointcut("execution(* com.soolzari.shop.client.model.service.ClientService.*Client(..))")

	public void loginEncPw() {
		
	}
	
	@Before("loginEncPw()")
	public void login(JoinPoint jp) throws Throwable{
		  Object []args=jp.getArgs();
		     //매개변수가 한개든 여러개든 상관없이 배열로 받는다.
		      Client client = (Client)args[0];   //형변환   참조형변수 Member 얕은복사한것. 즉 Member 주소정보를 가지고있다. 그러므로 여기서 변경하면 원래 Member객체의 패스워드도 바뀐다.
		                                //얕은복사이므로 같은 공간을 참조하기때문에 여기서바뀌어도 원래 메모리의 정보도 바뀐다
		                              //즉 컨트롤러에 들어온 Member 변수와 같은 메모리 공간을 참조하고있는것!
		      
		      String clientPw=client.getClientPw();
		      
		      if(clientPw != null) {
		         String encPw=sha256.encPw(clientPw);
		         client.setClientPw(encPw);  //여기서 바뀌었으므로 바뀐값이 dao로 넘어가게 된다.
		      }

	}
	
	@Pointcut("execution(* com.soolzari.shop.seller.model.service.SellerService.*Seller(com.soolzari.shop.seller.model.vo.Seller))")
	public void loginEncPwSeller() {
		
	}
	
	@Before("loginEncPwSeller()")
	public void loginSeller(JoinPoint jp) throws Throwable{
		Object[] args2 = jp.getArgs();
		Seller seller = (Seller)args2[0];
		String sellerPw = seller.getSelPw();
		if(sellerPw != null) {
			String encPwSeller = sha256.encPw(sellerPw);
			seller.setSelPw(encPwSeller);
		}
	}
	
}
