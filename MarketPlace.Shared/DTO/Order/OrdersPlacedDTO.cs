using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Order
{
   public class OrdersPlacedDTO
    {
       public IEnumerable<OrderPlacedDTO> OrderPlaced { get; set; }
    }
}
