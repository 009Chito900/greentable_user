package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greentable.user.domain.SearchUserInfoDomain;
import kr.co.greentable.user.service.UserInfoService;
import kr.co.greentable.user.vo.ChkPassVO;
import kr.co.greentable.user.vo.ModifyUserInfoVO;
import kr.co.sist.util.cipher.DataEncrypt;


@Controller
public class UserInfoController {
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/user/chkPassInfo.do", method = GET)
	public String chkPassForm(HttpSession session) {
		String url="userInfo/chkPassForm";
		//
		String id=(String)session.getAttribute("user_id");
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}//end if 
		
		return url;
	}//chkPassForm
	
	/**
	 * 
	 * @param cpVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/chkPass.do", method = {GET, POST})
	public String chkPass(ChkPassVO cpVO, HttpSession session) {
		String url="";
		//
		String id=(String)session.getAttribute("user_id");
		
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {  
			//
			cpVO.setId(id);

			//
			try {
				cpVO.setPassword( DataEncrypt.messageDigest("MD5", cpVO.getPassword()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}//end catch
			
			//
			int flag=0;
			UserInfoService uis=new UserInfoService();
			flag=uis.searchChkPass(cpVO);
			
			if(flag == 0) { //
				url="userInfo/failChkPass";
			}else {
				url="forward:/user/userInfoForm.do" ;
			}//end else
		}//end else 
		
		return url;
	}//chkPass
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/user/userInfoForm.do", method = {GET, POST})
	public String userInfoForm(ChkPassVO cpVO, HttpSession session, Model model) {
		String url="";
		//
		String id=(String)session.getAttribute("user_id");
		
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {  
			//
			cpVO.setId(id);
			//
			try {
				cpVO.setPassword( DataEncrypt.messageDigest("MD5", cpVO.getPassword()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}//end catch
			
			//
			SearchUserInfoDomain suiDomain=new SearchUserInfoDomain();
			UserInfoService uis=new UserInfoService();
			suiDomain=uis.searchUserInfo(cpVO);
			
			//model
			model.addAttribute("user_info", suiDomain);
			
			url="userInfo/userInfoForm";
		}//end else
		
		return url;
	}//userInfoForm
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/user/modiChkDupEmailForm.do", method = GET)
	public String modiChkDupEmailForm(String email ) {
		
		
		return "userInfo/modiChkDupEmailForm";
	}//chkDupIdForm
	
	
	/**
	 * 
	 * @param email 
	 * @param model 
	 * @return
	 */
	@RequestMapping(value="/user/modiChkDupEmail.do", method = GET)
	public String chkDuplicateEmail(String email, Model model ) {
		String isDulEmail="";
		UserInfoService uis=new UserInfoService();
		isDulEmail=uis.searchEmail(email);
		
		//idDulEmail
		if(isDulEmail == null ) {
			isDulEmail="사용가능한 이메일입니다.";
		}else {
			isDulEmail="중복되는 이메일입니다. 타 이메일을 사용해주세요.";
		}//end else
		
		//model
		model.addAttribute("is_dul_email", isDulEmail);
		
		return "userInfo/modiChkDupEmailForm";
	}//chkDuplicateEmail

	
	/**
	 * 
	 * @param muiVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/modifyUserInfo.do", method = {GET, POST})
	public String modifyUserInfo(ModifyUserInfoVO muiVO, HttpSession session, Model model) {
		String url="";
		//
		String id=(String)session.getAttribute("user_id");
		
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {  
			//
			muiVO.setId(id);
			//
			try {
				muiVO.setPassword( DataEncrypt.messageDigest("MD5", muiVO.getPassword()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}//end catch
			
			//ȸ
			UserInfoService uis=new UserInfoService();
			uis.modifyUserInfo(muiVO);
			
			
			url="userInfo/successModi";
		}//end else
		
		return url;
	}//modifyUserInfo
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/user/chkPassDropOutForm.do", method = {GET, POST})
	public String dropOutChkPassForm(HttpSession session) {
		
		String url="userInfo/dropOutChkPassForm";
		//
		String id=(String)session.getAttribute("user_id");
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}//end if 
		
		return url;
		
	}//dropOutChkPassForm
	
	
	/**
	 * 
	 * @param cpVO
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/user/dropOutChkPass.do", method = {GET, POST})
	public String dropOutChkPass(ChkPassVO cpVO, HttpSession session) {
		String url="";
		//
		String id=(String)session.getAttribute("user_id");
		
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {  
			//
			cpVO.setId(id);
			//
			try {
				cpVO.setPassword( DataEncrypt.messageDigest("MD5", cpVO.getPassword()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}//end catch
			
			//
			int flag=0;
			UserInfoService uis=new UserInfoService();
			flag=uis.searchChkPass(cpVO);
			
			if(flag == 0) { //
				url="userInfo/failChkPass";
			}else {
				url="userInfo/dropOut" ;
			}//end else
		}//end else 
		
		return url;
	}//dropOutChkPass
	
	
	/**
	 * 
	 * @param cpVO
	 * @param session
	 * @param model
	 * @return 
	 */
	@RequestMapping(value="/user/dropOut.do", method = {GET, POST})
	public String dropOut(HttpSession session, Model model){
		String url="userInfo/successDropOut";
		//
		String id=(String)session.getAttribute("user_id");
		
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {  
			UserInfoService uis=new UserInfoService();
			uis.removeDropOut(id);
		}//end else 
		
		return url;
	}//dropOut
	
	
}//class
