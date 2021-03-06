﻿using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.User;
using MarketPlace.UserInterface.ViewModel.UserRegister;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    /// <summary>
    /// Register contoller
    /// </summary>
    public class RegisterController : Controller
    {
        UserBusiness userBusiness;
        IMapper RegistrationViewMapper;
        public RegisterController()
        {
            userBusiness = new UserBusiness();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<UserViewModel, UserDTO>();
            });

            RegistrationViewMapper = new Mapper(config);
        }
        /// <summary>
        /// new register view
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// post new user details
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>session token</returns>
        [HttpPost]
        public ActionResult Index([Bind(Include = "Name, Password, ConfirmPassword, Email, PhoneNumber")]  UserViewModel userModel)
        {

            if (ModelState.IsValid)
            {

                UserDTO userDTO = RegistrationViewMapper.Map<UserViewModel, UserDTO>(userModel);
                try
                    {
                        UserInfoDTO userInfoDTO = userBusiness.RegisterUser(userDTO);
                       Session["userId"] = userInfoDTO.ID;
                    return RedirectToAction("Index", "Home");

                }
                catch (Exception)
                {
                    return View(userModel);
                }
            }
            else
            {
                return View(userModel);
            }
        }
    }
}          


           
