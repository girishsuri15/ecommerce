using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.ProductCategory
{
  public  class CategoryProductDTO
    {
       public string Name { get; set; }
       public IEnumerable<ProductDTO> Products { get; set; }
    }
}
