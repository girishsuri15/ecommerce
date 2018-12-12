using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.Order;
using MarketPlace.UserInterface.ActionFilter;
using MarketPlace.UserInterface.ViewModel.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    [UserAuthFilter]
    public class OrderController : Controller
    {
        public ActionResult Order(Guid AddressId)
        {
            OrderBusiness orderBusiness = new OrderBusiness();
            Guid UserID=new Guid(Session["userId"].ToString());
            bool isOrderPlaced = orderBusiness.PlacedOrder(AddressId, UserID);
            if (isOrderPlaced)
            {
                return RedirectToAction("GetOrder", "Order");
            }
            else
            {
                return RedirectToAction("ErrorViewShow", "HttpErrors", new { msg = "order not placed" });
            }
        }
        public ActionResult GetOrder()
        {
            OrderBusiness orderBusiness = new OrderBusiness();
            Guid UserID = new Guid(Session["userId"].ToString());
            var MyOrderViewModelConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<OrderPlacedDTO, OrderPlacedViewModel>();
                cfg.CreateMap<OrderDTO, OrderViewModel>();
                cfg.CreateMap<OrderPlacedVariantDTO, OrderPlacedVariantViewModel>();
            });
           IMapper OrdersViewMapper = new Mapper(MyOrderViewModelConfig);
            try
            {
                OrdersPlacedDTO orderPlacedDTO = orderBusiness.GetOrder(UserID);
                OrdersPlacedViewModel orderPlaced = new OrdersPlacedViewModel();
                orderPlaced.OrderPlaced = OrdersViewMapper.Map<IEnumerable<OrderPlacedDTO>, IEnumerable<OrderPlacedViewModel>>(orderPlacedDTO.OrderPlaced);
                return View(orderPlaced);
            }
            catch (Exception)
            {
                return RedirectToAction("ErrorViewShow", "HttpErrors", new { msg = "Cart Data is unavalible" });
            }
        }
        public ActionResult GetOrderDeatils(Guid OrderPlacedID)
        {
            OrderBusiness orderBusiness = new OrderBusiness();
            Guid UserID = new Guid(Session["userId"].ToString());
           var MyOrderDeatilsDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<OrderPlacedVariantDTO, OrderPlacedVariantViewModel>();
            });
            try
            {
                OrdersPlacedVariantDTO orderPlacedVariantDTO = orderBusiness.GetOrderDeatils(OrderPlacedID);

                IMapper OrderVariant = new Mapper(MyOrderDeatilsDTOConfig);
                OrderPlacedVariantsViewModel orderPlacedVariantsViewModel = new OrderPlacedVariantsViewModel();
                orderPlacedVariantsViewModel.VariantList = OrderVariant.Map<IEnumerable<OrderPlacedVariantDTO>, IEnumerable<OrderPlacedVariantViewModel>>(orderPlacedVariantDTO.VariantList);
                return View(orderPlacedVariantsViewModel);
            }
            catch (Exception)
            {
                return RedirectToAction("ErrorViewShow", "HttpErrors", new { msg = "order deatils is missing" });
            }
            }
    }
}