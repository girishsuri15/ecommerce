using MarketPlace.UserInterface.ViewModel.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Order
{
    public class OrderPlacedVariantViewModel
    {
        public Guid ID { get; set; }
        public Guid OrderPlacedID { get; set; }
        public Guid VariantID { get; set; }
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
        public VariantViewModel Variant { get; set; }
    }
}