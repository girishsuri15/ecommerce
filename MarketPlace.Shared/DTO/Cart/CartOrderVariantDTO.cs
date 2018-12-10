using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Cart
{
    public class CartOrderVariantDTO
    {
        public Guid UserID { get; set; }
        public Guid VariantID { get; set; }
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
    }
}
