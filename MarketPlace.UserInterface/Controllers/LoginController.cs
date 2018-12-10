using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.User;
using MarketPlace.UserInterface.ViewModel.UserLogin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    public class LoginController : Controller
    {
        UserBusiness userBusiness;
        IMapper LoginViewMapper;
        public LoginController()
        {
            userBusiness = new UserBusiness();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<UserLoginViewModel, UserLoginDTO>();
            });

            LoginViewMapper = new Mapper(config);
        }
        /// <summary>
        /// user View For login 
        /// </summary>
        /// <returns>login view</returns>
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }


        /// <summary>
        /// user login details
        /// </summary>
        /// <param name="loginModel"></param>
        /// <returns></returns>
        ///

        [HttpPost]
        public ActionResult Login([Bind(Include = "Password,Email")]  UserLoginViewModel loginModel)
        {
            if (ModelState.IsValid)
            {
                UserLoginDTO userLoginData = LoginViewMapper.Map<UserLoginViewModel, UserLoginDTO>(loginModel);
                try
                {
                    Guid userId = userBusiness.LoginUser(userLoginData);
                    Session["userId"] = userId;
                    return RedirectToAction("Index","Home");
                }
                catch (Exception)
                {
                    return View(loginModel);
                }
            }
            else
            {
                return View(loginModel);
            }
        }
    }
}