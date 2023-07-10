package com.example.datn.usersController;

import com.example.datn.entity.KhachHang;
import com.example.datn.repository.KhachHangRepository;
import com.example.datn.service.KhachHangService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("viewsUsers/authencation")
public class UsersLoginController {

    @Autowired
    private HttpServletRequest req;

    @Autowired
    private KhachHangService khRepo ;


    @GetMapping("/usersLogin")
    private String getUsersLoginForm(){

        return "/viewsUsers/authencation/usersLogin";
    }

    @PostMapping("/usersLogin")
    private String userLogin(Model model,
                             RedirectAttributes attributes,
                             HttpSession session){
        String userName = req.getParameter("username");
        String passWord = req.getParameter("password");

        boolean hasErr = false;

        if (userName == null || "".equals(userName)) {
            model.addAttribute("messageEmailErr", "Please enter your Email");
            hasErr = true;
        }
        if (passWord == null || "".equals(passWord)) {
            model.addAttribute("messagePassErr", "Please enter your Password");
            hasErr = true;
        }
        if (hasErr){
            model.addAttribute("email", userName);
            return "/viewsUsers/authencation/usersLogin";
        }

        KhachHang khachHang = khRepo.checkLogin(userName, passWord);

        if (khachHang != null){
            String fullName = khachHang.getHoTen();
            session.setAttribute("UserLogged", khachHang);
            attributes.addFlashAttribute("fullnameLogin", fullName);
            model.addAttribute("messageLoginOrSignin", false);
            model.addAttribute("fullnameLogin", fullName);
            return "redirect:/viewsUsers/homeUser";
        }
        model.addAttribute("messageLogin", "Gmail or Password incorrect !");
        return "/viewsUsers/authencation/usersLogin";
    }

}
