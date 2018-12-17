using MarketPlace.UserInterface.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    /// <summary>
    /// error handling contoller
    /// </summary>
    public class HttpErrorsController : Controller
    {
        /// <summary>
        ///not found page
        /// </summary>
        /// <returns>view for page not found</returns>
        public ActionResult NotFound()
        {
            return View();
        }
        /// <summary>
        /// check if user is admin or not controller
        /// </summary>
        /// <param name="msg"></param>
        /// <returns>view for meassage if user is admin or not</returns>
        public ActionResult ErrorViewShow(string msg)
        {
            CheckAdminViewModel error = new CheckAdminViewModel();
            error.message = msg;
            return View(error);
        }
    }
}