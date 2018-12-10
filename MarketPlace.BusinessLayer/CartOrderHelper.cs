using MarketPlace.Shared.DTO.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MarketPlace.DataAccessLayer;
using MarketPlace.Shared.DTO.Cart;
using MarketPlace.DatabaseEntity;
using MarketPlace.Shared.DTO.Order;

namespace MarketPlace.BusinessLayer
{
   public class CartOrderHelper
    {
        AddVariantDataBase addvariantDataBase;
        public CartOrderHelper()
        {
            addvariantDataBase = new AddVariantDataBase();
        }
        public VariantDTO GetVariantDetails(Guid VariantID)
        {
            return addvariantDataBase.getVariantDetails(VariantID);
        }

        /// <summary>
        ///check if the inventory is more than new variant added 
        /// </summary>
        /// <param name="newVariantAdded"></param>
        /// <param name="variantData"></param>
        /// <returns></returns>
        public bool IsInventoryAvaiable(int Quantity,int Inventory)
        {
            if (Inventory >= Quantity)
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ItemToBEAdded"></param>
        /// <param name="variantData"></param>
        /// <returns></returns>
        /// 
        public bool IsUserCanOrder(CartOrderVariantDTO newVariantAdded, VariantDTO variantData)
        {
            IEnumerable<OrderPlacedVariantDTO> orderPlacedVariants = addvariantDataBase.UserOrderData(newVariantAdded.UserID);
           int OrderLimit = addvariantDataBase.GetProductOrderLimitByID(variantData.ProductID);
           int UserOrderdCount = orderPlacedVariants.Where(c => c.VariantID == newVariantAdded.VariantID).Count();
            if(UserOrderdCount>= OrderLimit)
            {
                return false;
            }
            return true;
        }
        public int ProductLimit(Guid ProductID)
        {
            return addvariantDataBase.GetProductOrderLimitByID(ProductID);
            
        }
           
            /// <summary>
            /// 
            /// </summary>
            /// <param name="ItemToBEAdded"></param>
            /// <param name="variantData"></param>
            /// <returns></returns>
            public CartOrderVariantDTO VariantPresentAtCart(CartOrderVariantDTO variantData)
            {
            return addvariantDataBase.VariantPresentAtCart(variantData);
             
            }

        public bool AddVariantToCart(CartOrderVariantDTO newVariantAdded,double SellingPrice)
        {
           return addvariantDataBase.AddVariantToCart(newVariantAdded, SellingPrice);
        }
        public CartsVariantDTO GetCartByUserId(Guid UserId)
        {
            return addvariantDataBase.GetCartByUserId(UserId);
        }
    }
}
