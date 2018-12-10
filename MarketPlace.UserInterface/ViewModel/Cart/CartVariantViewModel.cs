using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.Cart
{
    public class CartVariantViewModel
    {
        [Required]
        [RegularExpression(@"\d{10}", ErrorMessage = "OrderQuantity only be numeric")]
        public int Quantity { get; set; }
        [Required]
        public Guid VariantID { get; set; }

    }
}