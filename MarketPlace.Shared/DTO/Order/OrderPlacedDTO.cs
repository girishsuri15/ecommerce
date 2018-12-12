using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Order
{
    public class OrderPlacedDTO
    {
        
        
        public Guid ID { get; set; }
        public Guid OrderID { get; set; }
        public Guid UserID { get; set; }
        public OrderDTO Order { get; set; }
        public ICollection<OrderPlacedVariantDTO> OrderPlacedVariants { get; set; }
    }
}
