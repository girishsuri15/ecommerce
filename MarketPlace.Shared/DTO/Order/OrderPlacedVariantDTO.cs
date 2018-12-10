using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Order
{
   public class OrderPlacedVariantDTO
    {
        public Guid ID { get; set; }
        public Guid OrderPlacedID { get; set; }
        public Guid VariantID { get; set; }
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
    }
}
