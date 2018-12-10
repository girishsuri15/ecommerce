using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.ProductCategory
{
    public class VariantDTO
    {
        public System.Guid ID { get; set; }
        public string SKU { get; set; }
        public System.Guid ProductID { get; set; }
        public double ListingPrice { get; set; }
        public double Discount { get; set; }
        public int QuantitySold { get; set; }
        public int Inventory { get; set; }
        public virtual ProductDTO Product { get; set; }
        public virtual ICollection<VariantImageDTO> VariantImages { get; set; }
    }
}
