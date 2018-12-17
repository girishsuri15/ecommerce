using MarketPlace.BusinessLayer.Exceptions;
using MarketPlace.DataAccessLayer.DataBaseObject;
using MarketPlace.Shared.DTO.Cart;
using MarketPlace.Shared.DTO.ProductCategory;
using System;
using AutoMapper;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MarketPlace.Shared.DTO.Order;

namespace MarketPlace.BusinessLayer.BusinessData
{
    /// <summary>
    /// orderbusiness 
    /// </summary>
    public class OrderBusiness
    {
        CartOrderHelper cartOrderHelper;
        OrderDataBase orderDatabase;
        IMapper orderMapper;
        public OrderBusiness()
        {
            cartOrderHelper = new CartOrderHelper();
            orderDatabase = new OrderDataBase();
            var OrderConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap <CartsVariantDTO, CartsVariantDTO>();
            });
            orderMapper = new Mapper(OrderConfig);
        }
        /// <summary>
        /// placeorder of user with address id and userId
        /// </summary>
        /// <param name="AddressId"></param>
        /// <param name="UserId"></param>
        /// <returns></returns>
        public bool PlacedOrder(Guid AddressId, Guid UserId)
        {
            VariantDTO variantDTO = new VariantDTO();
            //validation for variant order
            //1.get the cart data
               bool addressVerfiyed = orderDatabase.IsVerfiyAddress(AddressId, UserId);
            double totalAmount = 0;
            if (addressVerfiyed)
            {
                try
                {
                    CartsVariantDTO cartsData = cartOrderHelper.GetCartByUserId(UserId);
                    foreach (CartVariantDTO variantAtCart in cartsData.Items)
                    {
                        //2.get each cart varinat data from varinat table
                        variantDTO = cartOrderHelper.GetVariantDetails(variantAtCart.VariantID);
                        //3.check all cart data inventory
                        if (!cartOrderHelper.IsInventoryAvaiable(variantAtCart.Quantity, variantDTO.Inventory))
                        {
                            throw new OutOfStockException();
                        }
                        //3.orderlimit
                        if (!cartOrderHelper.IsUserCanOrder(variantAtCart, variantDTO))
                        {
                            throw new UserOrderLimitExceddException();
                        }
                        variantAtCart.SellingPrice = variantDTO.ListingPrice - variantDTO.Discount;
                        totalAmount = totalAmount + variantAtCart.SellingPrice * variantAtCart.Quantity;
                    }

                    //validation end
                    OrderVariantDTO order = new OrderVariantDTO();
                    order.ItemOrders = cartsData;
                    OrderDataDTO orderData = new OrderDataDTO();
                    orderData.DeliveryAddressID = AddressId;
                    orderData.TotalAmount = totalAmount;
                    orderData.isCancelled = "N";
                    bool isOrderPlaced = orderDatabase.PlacedOrder( UserId,orderData, order);
                    if (isOrderPlaced)
                    {
                        foreach (CartVariantDTO variant in cartsData.Items)
                        {
                            Guid Id = variant.ID;
                            bool t = cartOrderHelper.DeleteCartVariant(Id, UserId);
                            
                        }
                        return true;
                    }
                    else
                        return false;
                }

                catch (OutOfStockException)
                {
                    return false;
                }
                catch (UserOrderLimitExceddException)
                {
                    return false;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
            else
            {
                throw new UserDetailIsWrong();
            }
        }
        /// <summary>
        /// get all the orders submiited by the user
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns>OrdersPlacedDTO</returns>
        public OrdersPlacedDTO GetOrder(Guid UserId)
        {
            return orderDatabase.GetOrder(UserId);
        }
        /// <summary>
        /// get order deatils for particlar order
        /// </summary>
        /// <param name="OrderPlacedID"></param>
        /// <returns>OrdersPlacedVariantDTO</returns>
        public OrdersPlacedVariantDTO GetOrderDeatils(Guid OrderPlacedID)
        {
            return orderDatabase.GetOrderDeatils(OrderPlacedID);
        }

    }
    }
