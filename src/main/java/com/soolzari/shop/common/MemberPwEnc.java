package com.soolzari.shop.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.soolzari.shop.client.model.vo.Client2;


@Component
@Aspect
public class MemberPwEnc {
	
	@Autowired
	private SHA256Util enc;
	
	@Pointcut("execution(* com.soolzari.shop.client.model.service.ClientService2.*MInfo(com.soolzari.shop.client.model.vo.Client2))")
	public void encPw() {}
	
	@Before("encPw()")
	public void beforeEnc(JoinPoint jp) throws Throwable{
		Object[] args = jp.getArgs();
		Client2 client = (Client2)args[0];
		String cliPw = client.getCliPw();
		if(cliPw != null) {
			String encPw = enc.encPw(cliPw);
			client.setCliPw(encPw);
		}
	}
	
	
}
