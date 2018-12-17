using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.Address;
using MarketPlace.UserInterface.ActionFilter;
using MarketPlace.UserInterface.ViewModel.Address;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MarketPlace.UserInterface.Controllers
{
    /// <summary>
    /// Handling address views for showing addresses of user adding new address etc.
    /// </summary>
    [UserAuthFilter]
    public class AddressController : Controller
    {
        /// <summary>
        /// showing all the addres of the user
        /// </summary>
        /// <returns>viewforAll address Of User</returns>
        [HttpGet]
        public ActionResult Address()
        {
            AddressBusiness addressBusiness = new AddressBusiness();
            Guid UserID = new Guid(Session["userId"].ToString());
            var addressViewConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<AddresssDTO, AddresssViewModel>();
            });
            IMapper addressMapper = new Mapper(addressViewConfig);
            try
            {
                AddresssDTO address = addressBusiness.GetAllAddress(UserID);
                AddresssViewModel addressViewModel = new AddresssViewModel();
                addressViewModel = addressMapper.Map<AddresssDTO, AddresssViewModel>(address);
                return View(addressViewModel);
            }
            catch (Exception)
            {
                //if address not exist return new form
                return View("NewAddress");
            }
        }
        /// <summary>
        /// newaddress submission controller
        /// </summary>
        /// <param name="AddressModel"></param>
        /// <returns>view for all address of user</returns>
        [HttpPost]
        public ActionResult NewAddress([Bind(Include = "AddressLine1,AddressLine2,Pin,City,State,Country")]  AddressViewModel AddressModel)
        {
            if (ModelState.IsValid)
            {
                Guid UserID = new Guid(Session["userId"].ToString());
                AddressBusiness addressBusiness = new AddressBusiness();
                var addressDTOConfig = new MapperConfiguration(cfg => {
                    cfg.CreateMap<AddressDTO, AddressViewModel>();
                });
                IMapper addressMapper = new Mapper(addressDTOConfig);
                AddressDTO newAddress = addressMapper.Map<AddressViewModel, AddressDTO>(AddressModel);
               bool a = addressBusiness.AddAddress(UserID, newAddress);
               return RedirectToAction("Address", "Address");
            }
            
            AddressViewModel address = new AddressViewModel();
            return View(address);
        }

        /// <summary>
        /// new address form showing contoller
        /// </summary>
        /// <returns>view for show the address form</returns>
        public ActionResult NewAddress()
        {
            return View();
        }
    }
}