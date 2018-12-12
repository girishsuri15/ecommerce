using MarketPlace.UserInterface.ViewModel.Address;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Order
{
    public class OrderViewModel
    {
        public Guid ID { get; set; }
        public DateTime OrderDate { get; set; }
        public double TotalAmount { get; set; }
        public Guid DeliveryAddressID { get; set; }
        public DateTime DeliveryDate { get; set; }
        public int StatusID { get; set; }
        public string isCancelled { get; set; }
        public AddressViewModel Address { get; set; }
    }
}