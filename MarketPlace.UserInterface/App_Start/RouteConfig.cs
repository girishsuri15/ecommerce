using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MarketPlace.UserInterface
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
             name: "Order",
             url: "Order",
             defaults: new { controller = "Order", action = "Order" }
         );
            routes.MapRoute(
              name: "Address",
              url: "Address",
              defaults: new { controller = "Address", action = "Address" }
          );
            routes.MapRoute(
               name: "Login",
               url: "Login",
               defaults: new { controller = "Login", action = "Login" }
           );
            routes.MapRoute(
                name: "Cart",
                url: "Cart",
                defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "User",
                url: "User",
                defaults: new { controller = "User", action = "CheckAdmin", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "admin",
               url: "admin",
               defaults: new { controller = "User", action = "CheckAdmin", id = UrlParameter.Optional }
           );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
