using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.Cart;
using MarketPlace.Shared.DTO.ProductCategory;
using MarketPlace.UserInterface.ActionFilter;
using MarketPlace.UserInterface.ViewModel.Cart;
using MarketPlace.UserInterface.ViewModel.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    [UserAuthFilter]
    public class CartController : Controller
    {
        /// <summary>
        /// add the new varinat to cart 
        /// inputs:Quantity,and varinatID        
        /// </summary>
        /// <param name="cartVariantViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        [UserAuthFilter]
        public ActionResult AddItem([Bind(Include = "Quantity,VariantID")] CartVariantViewModel cartVariantViewModel)
        {
            
            var cartViewConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<CartVariantViewModel, CartVariantDTO>();
            });
            
            IMapper cartDataMapper = new Mapper(cartViewConfig);
            CartVariantDTO cartItemDTO = new CartVariantDTO();
            try
            {
                cartItemDTO = cartDataMapper.Map<CartVariantViewModel, CartVariantDTO>(cartVariantViewModel);
                cartItemDTO.CartID = new Guid(Session["userId"].ToString());
                CartBusiness cartBusiness = new CartBusiness();
                bool isproductAdd = cartBusiness.AddItemCart(cartItemDTO);
                return RedirectToAction("GetCart", "Cart");
            }
            catch (Exception )
            {
                return RedirectToAction("ErrorViewShow", "HttpErrors", new { msg = "order Limit For Product is Excedd" });
            }

        }
        /// <summary>
        /// get the all product aviable in the cart
        /// </summary>
        /// <returns>view cart details</returns>
        public ActionResult GetCart()
        {
            Guid UserID = new Guid(Session["userId"].ToString());
            CartBusiness cartBusiness = new CartBusiness();
            CartsVariantDTO data = cartBusiness.GetCartByUserId(UserID);
            var cartViewConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<CartsVariantDTO, CartViewModel>();
                cfg.CreateMap<CartVariantDTO, VariantCartViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<ProductDTO, ProductViewModel>(); 
            });

            IMapper cartDataMapper = new Mapper(cartViewConfig);
            CartViewModel viewData = cartDataMapper.Map<CartsVariantDTO,CartViewModel>(data);
            return View(viewData);
        }
        /// <summary>
        /// delete Product from cart 
        /// input:ProductId
        /// </summary>
        /// <param name="Id"></param>
        /// <returns>view for cart</returns>
        public ActionResult DeleteCartVariant(Guid Id)
        {
            CartBusiness cartBusiness = new CartBusiness();
            Guid CartId = new Guid(Session["userId"].ToString());
            try
            {
                cartBusiness.DeleteCartVariant(Id, CartId);
              return  RedirectToAction("GetCart", "Cart");
            }
            catch (Exception)
            {
                return RedirectToAction("ErrorViewShow", "HttpErrors", new { msg = "cannot delete Some Internal error" } );

            }
        }
    }
}