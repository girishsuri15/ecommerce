using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.ProductCategory
{
    public class ProductAnalysisViewModel
    {
        public IEnumerable<CategoryProductViewModel> Categories { get; set; }
    }
}