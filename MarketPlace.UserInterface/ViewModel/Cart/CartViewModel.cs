using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Cart
{
    public class CartViewModel
    {
       public IEnumerable<VariantCartViewModel> Items { get; set; }
       
    }
}