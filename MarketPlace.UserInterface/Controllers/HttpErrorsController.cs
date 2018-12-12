using MarketPlace.UserInterface.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    public class HttpErrorsController : Controller
    {
        // GET: HttpErrors
        public ActionResult NotFound()
        {
            return View();
        }
        public ActionResult ErrorViewShow(string msg)
        {
            CheckAdminViewModel error = new CheckAdminViewModel();
            error.message = msg;
            return View(error);
        }
    }
}