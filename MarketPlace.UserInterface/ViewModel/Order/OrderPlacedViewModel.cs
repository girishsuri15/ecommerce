using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Order
{
    public class OrderPlacedViewModel
    {
        public Guid ID { get; set; }
        public Guid OrderID { get; set; }
        public Guid UserID { get; set; }
        public OrderViewModel Order { get; set; }
        public ICollection<OrderPlacedVariantViewModel> OrderPlacedVariants { get; set; }
    }
}