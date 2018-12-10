using MarketPlace.UserInterface.ViewModel.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Cart
{
    public class VariantCartViewModel
    {
        public System.Guid ID { get; set; }
        public int Quantity { get; set; }
        public VariantViewModel Variant { get; set; }
        public int SellingPrice { get; set; }
    }
}