﻿using MarketPlace.Shared.DTO.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.Cart
{
   public  class CartVariantDTO
    {
        public Guid ID { get; set; }
        public Guid CartID { get; set; }
        public Guid VariantID { get; set; }
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
        public VariantDTO Variant { get; set; }
    }
}
//not