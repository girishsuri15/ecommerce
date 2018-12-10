using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Cart
{
   public class CartsVariantDTO
    {
       public IEnumerable<CartVariantDTO> Items { get; set; }
    }
}
