using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.ProductCategory
{
    public class CategoryProductViewModel
    {
        public string Name { get; set; }
        public IEnumerable<ProductViewModel> Products { get; set; }
    }
}