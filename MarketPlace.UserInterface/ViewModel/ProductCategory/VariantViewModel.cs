using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.ProductCategory
{
    public class VariantViewModel
    {
        public System.Guid ID { get; set; }
        public string SKU { get; set; }
        public System.Guid ProductID { get; set; }
        public double ListingPrice { get; set; }
        public double Discount { get; set; }
        public int QuantitySold { get; set; }
        public int Inventory { get; set; }
        public virtual ProductViewModel Product { get; set; }
        public virtual ICollection<VariantImageViewModel> VariantImages { get; set; }

    }
}