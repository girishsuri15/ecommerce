using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.ProductCategory
{
    public class ProductViewModel
    {
        public System.Guid ID { get; set; }
        public System.Guid CategoryID { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public Nullable<int> OrderLimit { get; set; }
        public string Description { get; set; }
        public virtual ICollection<VariantViewModel> Variants { get; set; }
    }
}