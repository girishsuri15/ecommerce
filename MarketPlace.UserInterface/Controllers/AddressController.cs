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
    [UserAuthFilter]
    public class AddressController : Controller
    {
        
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
                return View("NewAddress");
            }
        }
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
        public ActionResult NewAddress()
        {
            return View();
        }
    }
}