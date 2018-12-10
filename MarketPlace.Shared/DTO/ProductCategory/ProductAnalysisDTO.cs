using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.ProductCategory
{
   public class ProductAnalysisDTO
    {
        public IEnumerable<CategoryProductDTO> Categories { get; set; }
    }
}
