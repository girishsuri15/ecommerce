﻿using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.User;
using MarketPlace.UserInterface.ActionFilter;
using MarketPlace.UserInterface.ViewModel.UserLogin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    /// <summary>
    /// Login controller
    /// </summary>
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
        /// <returns>set seession id</returns>
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

        /// <summary>
        /// sign out controller
        /// </summary>
        /// <returns></returns>
        [UserAuthFilter]
        public ActionResult SignOut()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}