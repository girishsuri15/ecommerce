using AutoMapper;
using MarketPlace.DatabaseEntity;
using MarketPlace.Shared.DTO.Cart;
using MarketPlace.Shared.DTO.Order;
using MarketPlace.Shared.DTO.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.DataAccessLayer
{
    public class AddVariantDataBase
    {
        MarketPlaceEntities dbContext;
        IMapper VariantMapper;
        IMapper OrderUserMapper;
        IMapper cartOrderMapper;
        IMapper cartCheckerMapper;
        IMapper cartVariantMapper;
        public AddVariantDataBase()
        {
            dbContext = new MarketPlaceEntities();
            var VariantDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Variant, VariantDTO>();
            });
            var userOrderConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<OrderPlacedVariant, OrderPlacedVariantDTO>();
            });
            var cartConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartOrderVariantDTO, CartVariantMapping>()
                    .ForMember(dest => dest.CartID,
                     opts => opts.MapFrom(src => src.UserID));
            });
            var cartPresentConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartVariantMapping, CartOrderVariantDTO >()
                    .ForMember(dest => dest.UserID,
                     opts => opts.MapFrom(src => src.CartID));
            });

            var cartVariantConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartVariantMapping, CartVariantDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
            });
            VariantMapper = new Mapper(VariantDTOConfig);
            OrderUserMapper = new Mapper(userOrderConfig);
            cartOrderMapper = new Mapper(cartConfig);
            cartCheckerMapper = new Mapper(cartPresentConfig);
            cartVariantMapper = new Mapper(cartVariantConfig);
        }
        public VariantDTO getVariantDetails(Guid VariantID)
        {
           Variant variantDBData = dbContext.Variants.Where(c => c.ID == VariantID).FirstOrDefault();
           VariantDTO variantDetails = VariantMapper.Map<Variant, VariantDTO>(variantDBData);
           return variantDetails;
            
        }
        //public IEnumerable<OrderDTO> UserOrderForVariant(CartOrderVariantDTO userOrderVariantInfo)
        //{
        //    IEnumerable<OrderPlaced> OrderUserData = dbContext.OrderPlaceds.Where(o => o.UserID == userOrderVariantInfo.UserID).ToList();

        //}
        public  IEnumerable<OrderPlacedVariantDTO> UserOrderData(Guid UserID)
        {
            List<OrderPlacedVariant> UserOrderData=new List<OrderPlacedVariant>();
            IEnumerable<OrderPlaced> OrderListUserData = dbContext.OrderPlaceds.Where(o => o.UserID == UserID).ToList();
            foreach (var orderData in OrderListUserData)
            {
                UserOrderData.Add(dbContext.OrderPlacedVariants.Where(o => o.OrderPlacedID == orderData.OrderID).FirstOrDefault());
            }
            IEnumerable<OrderPlacedVariantDTO> orderPlacedDTO = OrderUserMapper.Map<IEnumerable<OrderPlacedVariant>, IEnumerable<OrderPlacedVariantDTO>>(UserOrderData);
            return orderPlacedDTO;
        }
        public int GetProductOrderLimitByID(Guid ProductId)
        {
            var temp = dbContext.Products.Where(p => p.ID == ProductId).Select(c => c.OrderLimit).FirstOrDefault();
            return Convert.ToInt32(temp);
        }
        //public bool IsVariantPresentAtCart()
        //{

        //}
       public bool AddVariantToCart(CartOrderVariantDTO newVariantAdded,double SellingPrice)
        {
            try
            {
                CartVariantMapping cartVariantAdd = cartOrderMapper.Map<CartOrderVariantDTO, CartVariantMapping>(newVariantAdded);
                cartVariantAdd.ID = Guid.NewGuid();
                cartVariantAdd.SellingPrice = SellingPrice;
                CartVariantMapping variant = dbContext.CartVariantMappings.Where(v => v.VariantID == newVariantAdded.VariantID && v.CartID == newVariantAdded.UserID).FirstOrDefault();
                if (variant == null)
                {
                    dbContext.CartVariantMappings.Add(cartVariantAdd);
                }
                else
                {
                    variant.Quantity = newVariantAdded.Quantity;
                    variant.SellingPrice = SellingPrice;
                }
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            
        }
        public CartOrderVariantDTO VariantPresentAtCart(CartOrderVariantDTO variantData)
        {
            CartVariantMapping variant = dbContext.CartVariantMappings.Where(v=>v.VariantID == variantData.VariantID && v.CartID== variantData.UserID).FirstOrDefault();
            CartOrderVariantDTO variantPresentCart= cartCheckerMapper.Map<CartVariantMapping,CartOrderVariantDTO>(variant);
            return variantPresentCart;
        }
        public CartsVariantDTO  GetCartByUserId(Guid UserId)
        {
            IEnumerable<CartVariantMapping> itemAtCart = dbContext.CartVariantMappings.Where(v => v.CartID == UserId).ToList();
            CartsVariantDTO cartVariantDTO = new CartsVariantDTO();
            cartVariantDTO.Items = cartVariantMapper.Map <IEnumerable<CartVariantMapping>,IEnumerable<CartVariantDTO>>(itemAtCart);
            return cartVariantDTO;
        }
    }
}