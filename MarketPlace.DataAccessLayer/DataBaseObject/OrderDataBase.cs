using AutoMapper;
using MarketPlace.DatabaseEntity;
using MarketPlace.Shared.DTO.Cart;
using MarketPlace.Shared.DTO.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.DataAccessLayer.DataBaseObject
{
    public class OrderDataBase
    {
        MarketPlaceEntities dbContext;
        IMapper OrderDataMapper;
        IMapper VariantMapper;
        IMapper MyOrderMapper;
        IMapper MyOrderDeatilsMapper;
        public OrderDataBase()
        {
            dbContext = new MarketPlaceEntities();
            var OrderDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<OrderDataDTO, Order>();
            });
            var VariantDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartVariantDTO, OrderPlacedVariant>()
                .ForMember(s => s.ID, opt => opt.Ignore())
                .ForMember(s => s.OrderPlacedID, opt => opt.Ignore())
               .ForMember(s => s.OrderPlaced, opt => opt.Ignore())
                .ForMember(s => s.Variant, opt => opt.Ignore());
            });
            var MyOrderDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<OrderPlaced, OrderPlacedDTO>();
                cfg.CreateMap<Order, OrderDTO>();
                cfg.CreateMap<OrderPlacedVariant, OrderPlacedVariantDTO>();
            });
            var MyOrderDeatilsDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<OrderPlacedVariant, OrderPlacedVariantDTO>();
            });
            OrderDataMapper = new Mapper(OrderDTOConfig);
            VariantMapper = new Mapper(VariantDTOConfig);
            MyOrderMapper = new Mapper(MyOrderDTOConfig);
            MyOrderDeatilsMapper = new Mapper(MyOrderDeatilsDTOConfig);
        }
        public bool IsVerfiyAddress(Guid AddresId, Guid UserId)
        {
            return dbContext.UserAddressMappings.Any(u => u.AddressID == AddresId && u.UserID == UserId);
        }
        public bool PlacedOrder(Guid UserId, OrderDataDTO orderData, OrderVariantDTO order)
        {
            DateTime today = System.DateTime.Now;
            orderData.OrderDate = today;
            orderData.DeliveryDate = today.AddDays(6);

            int statusid = dbContext.Status.Where(s => s.description == "Progessing").Select(s => s.ID).FirstOrDefault();
            orderData.StatusID = statusid;
            orderData.ID = Guid.NewGuid();
            Order newOrder = OrderDataMapper.Map<OrderDataDTO, Order>(orderData);
            dbContext.Orders.Add(newOrder);

            //orderplcaed mapping insertion
            OrderPlaced orderPlaced = new OrderPlaced();
            orderPlaced.ID = Guid.NewGuid();
            orderPlaced.UserID = UserId;
            orderPlaced.OrderID = orderData.ID;
            ///end

            dbContext.OrderPlaceds.Add(orderPlaced);
           
            foreach (CartVariantDTO variant in order.ItemOrders.Items)
            {
                OrderPlacedVariant variantData = VariantMapper.Map<CartVariantDTO, OrderPlacedVariant>(variant);
                variantData.ID = Guid.NewGuid();
                variantData.OrderPlacedID = orderPlaced.ID;
                dbContext.OrderPlacedVariants.Add(variantData);
            }
            foreach (var cartitem in order.ItemOrders.Items)
            {
                dbContext.Variants.FirstOrDefault(p => p.ID == cartitem.VariantID).Inventory -= cartitem.Quantity;
                dbContext.Variants.FirstOrDefault(p => p.ID == cartitem.VariantID).QuantitySold += cartitem.Quantity;
                dbContext.Categories.FirstOrDefault(c => c.ID == cartitem.Variant.Product.CategoryID).ProductsSold += cartitem.Quantity;
            }

            dbContext.SaveChanges();
            return true;
        }
        public OrdersPlacedDTO GetOrder(Guid UserId)
        {
            IEnumerable<OrderPlaced> orderPlaced = dbContext.OrderPlaceds.Where(o => o.UserID == UserId).ToList();

            OrdersPlacedDTO orderdataDTO = new OrdersPlacedDTO();
            orderdataDTO.OrderPlaced = MyOrderMapper.Map<IEnumerable<OrderPlaced>, IEnumerable<OrderPlacedDTO>>(orderPlaced);
            return orderdataDTO;
        }
       public OrdersPlacedVariantDTO GetOrderDeatils(Guid OrderPlacedID)
        {
            IEnumerable<OrderPlacedVariant> orderPlaced = dbContext.OrderPlacedVariants.Where(o => o.OrderPlacedID == OrderPlacedID).ToList();
            OrdersPlacedVariantDTO ordersPlacedVaraiantDTO = new OrdersPlacedVariantDTO();
            ordersPlacedVaraiantDTO.VariantList = MyOrderDeatilsMapper.Map<IEnumerable<OrderPlacedVariant>, IEnumerable<OrderPlacedVariantDTO>>(orderPlaced);
            return ordersPlacedVaraiantDTO;
        }
    }
 }

//List<OrderDTO> OrderData = new List<OrderDTO>();

//foreach(OrderPlaced temp in orderPlaced)
//{
//    OrderData.Add(MyOrderMapper.Map<Order, OrderDTO>(temp.Order));

//}