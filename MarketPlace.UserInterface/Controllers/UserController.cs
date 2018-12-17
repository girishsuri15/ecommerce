using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.UserInterface.ActionFilter;
using MarketPlace.UserInterface.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    /// <summary>
    /// checkadmin user
    /// </summary>
    public class UserController : Controller
    {
        [UserAuthFilter]
        public ActionResult CheckAdmin()
        {
            UserBusiness userBusiness = new UserBusiness();
            CheckAdminViewModel msg = new CheckAdminViewModel();
            try
            {
                
                if (userBusiness.CheckAdmin(new Guid(Session["UserID"].ToString())))
                {
                    msg.message = "User is admin";
                    return View("CheckAdmin", msg);
                }
                else
                {
                    msg.message = "User is not admin";
                    return View("CheckAdmin", msg);
                }
            }
            catch (Exception)
            {
                msg.message = "Internal error";
                return View("CheckAdmin", msg);
            }
        }

    }
}