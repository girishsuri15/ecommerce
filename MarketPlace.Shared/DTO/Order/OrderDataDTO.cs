using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Order
{
    public class OrderDataDTO
    {
        public Guid ID { get; set; }
        public DateTime OrderDate { get; set; }
        public double TotalAmount { get; set; }
        public Guid DeliveryAddressID { get; set; }
        public DateTime DeliveryDate { get; set; }
        public int StatusID { get; set; }
        public string isCancelled { get; set; }


    }
}
//not