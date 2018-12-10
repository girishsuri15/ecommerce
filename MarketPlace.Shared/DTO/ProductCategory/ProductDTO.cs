using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.ProductCategory
{
   public class ProductDTO
    {
        public System.Guid ID { get; set; }
        public System.Guid CategoryID { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public Nullable<int> OrderLimit { get; set; }
        public string Description { get; set; }
        public virtual ICollection<VariantDTO> Variants { get; set; }
    }
}
