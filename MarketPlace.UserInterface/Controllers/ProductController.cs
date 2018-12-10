using MarketPlace.BusinessLayer.BusinessData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MarketPlace.Shared.DTO.ProductCategory;
using MarketPlace.UserInterface.ViewModel.ProductCategory;
using AutoMapper;
using MarketPlace.DatabaseEntity;
using MarketPlace.BusinessLayer.Exceptions;
using MarketPlace.UserInterface.ActionFilter;

namespace MarketPlace.UserInterface.Controllers
{
    public class ProductController : Controller
    {
        public CategoryProductDTO CategoryProductViewModel { get; private set; }

        // GET: Product
        public ActionResult GetProductByCat(string CategoryName)
        {
            /*mapping settings for getting the product by the category*/
            var ProductViewConfig = new MapperConfiguration(cfg => {
                    cfg.CreateMap<ProductViewModel, ProductDTO>();
                    cfg.CreateMap<VariantViewModel, VariantDTO>();
                    cfg.CreateMap<VariantImageViewModel, VariantImageDTO>();
                });
            IMapper ProductViewMapper = new Mapper(ProductViewConfig);

            CategoryProductBusiness categoryProductBusiness = new CategoryProductBusiness();
            CategoryProductViewModel data = new CategoryProductViewModel();
            try
            {
                CategoryProductDTO products = categoryProductBusiness.GetProductFromCatgory(CategoryName);
                data = ProductViewMapper.Map<CategoryProductDTO, CategoryProductViewModel>(products);
            }
            catch (CategoryNotFoundException)
            {
                return View("Product not found on this category");
            }
                return View(data);
        }
        public ActionResult SearchProducts(string SearchString)
        {
            var ProductViewConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<ProductViewModel, ProductDTO>();
                cfg.CreateMap<VariantViewModel, VariantDTO>();
                cfg.CreateMap<VariantImageViewModel, VariantImageDTO>();
            });
            IMapper ProductViewMapper = new Mapper(ProductViewConfig);

            CategoryProductBusiness categoryProductBusiness = new CategoryProductBusiness();
            CategoryProductViewModel data = new CategoryProductViewModel();
            try
            {
                CategoryProductDTO products = categoryProductBusiness.SearchProducts(SearchString);
                data = ProductViewMapper.Map<CategoryProductDTO, CategoryProductViewModel>(products);
            }
            catch (CategoryNotFoundException)
            {
                return View("Product not found on this category");
            }
            return View(data);
        }
        [UserAuthFilter]
        public ActionResult ProductDetail(Guid ProductID)
        {
            var ProductViewConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<ProductViewModel, ProductDTO>();
                cfg.CreateMap<VariantViewModel, VariantDTO>();
                cfg.CreateMap<VariantImageViewModel, VariantImageDTO>();
            });
            IMapper ProductViewMapper = new Mapper(ProductViewConfig);
            ProductViewModel viewModel = new ProductViewModel();
            ProductDTO productDTO = new ProductDTO();
            CategoryProductBusiness categoryProductBusiness = new CategoryProductBusiness();
            try
            {
                productDTO = categoryProductBusiness.GetProduct(ProductID);
            }
            catch (CategoryNotFoundException)
            {
                return View("Error");
            }
            viewModel = ProductViewMapper.Map<ProductDTO, ProductViewModel>(productDTO);
            
            return View(viewModel);

        }
    }
}