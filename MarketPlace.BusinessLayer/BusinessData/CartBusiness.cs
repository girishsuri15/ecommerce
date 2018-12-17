using MarketPlace.BusinessLayer.Exceptions;
using MarketPlace.DataAccessLayer.DataBaseObject;
using MarketPlace.DatabaseEntity;
using MarketPlace.Shared.DTO.Cart;
using MarketPlace.Shared.DTO.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.BusinessLayer.BusinessData
{
    /// <summary>
    /// cart business
    /// </summary>
   public class CartBusiness
    {
        CartOrderHelper cartOrderHelper;
        public CartBusiness()
        {
            cartOrderHelper= new CartOrderHelper();
        }
        /// <summary>
        /// add product to cart business
        /// </summary>
        /// <param name="newVariantAdded"></param>
        /// <returns>true is product is added</returns>
        public bool AddItemCart(CartVariantDTO newVariantAdded)
        {
            ///get the product variants details
            VariantDTO variantData = cartOrderHelper.GetVariantDetails(newVariantAdded.VariantID);
            /*
             *  calautale the the selling price
             * 
             * */
            double SellingPrice = variantData.ListingPrice - variantData.Discount;
            /*
                *
                * get the varinat data from cart whther it is present or not in the cart
                * add the new added Quautity to store quatity
                * 
            */
            CartVariantDTO VariantPresentAtCart = cartOrderHelper.VariantPresentAtCart(newVariantAdded);
            /*
                * 
                * Check the inventory is available
                * 
            */
            /*check the variant present at cart*/
            if (VariantPresentAtCart != null)
            {
                newVariantAdded.Quantity = newVariantAdded.Quantity + VariantPresentAtCart.Quantity;
            }

            if (cartOrderHelper.IsInventoryAvaiable(newVariantAdded.Quantity, variantData.Inventory))
            {
                ////check the if user order limit is excedded then the order limit
                if (cartOrderHelper.IsUserCanOrder(newVariantAdded, variantData))
                {
                    if (cartOrderHelper.ProductLimit(variantData.ProductID) >= newVariantAdded.Quantity)
                    {
                        bool added = cartOrderHelper.AddVariantToCart(newVariantAdded, SellingPrice);
                    }
                    else
                    {
                        throw new UserOrderLimitExceddException();
                    }

                }
                else
                {
                    throw new UserOrderLimitExceddException();
                }
            }
            else
            {
                throw new OutOfStockException();
            }
        return true;
        }
        /// <summary>
        /// get the all product variant from the cart
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public CartsVariantDTO GetCartByUserId(Guid UserID)
        {
            return cartOrderHelper.GetCartByUserId(UserID);
        }
        /// <summary>
        /// delete the productVariant from the cart
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool DeleteCartVariant(Guid Id, Guid UserID)
        {
            if(cartOrderHelper.DeleteCartVariant(Id, UserID))
            {
                return true;
            }
            else
            {
                throw new ItemCannotBeRemoveException();
            }
        }
    }
}
