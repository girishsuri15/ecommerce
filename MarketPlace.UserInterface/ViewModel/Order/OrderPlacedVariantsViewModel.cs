using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Order
{
    public class OrderPlacedVariantsViewModel
    {
       public IEnumerable<OrderPlacedVariantViewModel> VariantList { get; set; }
    }
}