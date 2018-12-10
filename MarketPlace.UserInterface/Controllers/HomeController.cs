using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using MarketPlace.BusinessLayer.BusinessData;
using MarketPlace.Shared.DTO.Category;
using MarketPlace.Shared.DTO.ProductCategory;
using MarketPlace.UserInterface.ViewModel.ProductCategory;
using Newtonsoft.Json;

namespace MarketPlace.UserInterface.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            CategoryProductBusiness categoryProductBusiness = new CategoryProductBusiness();
            var categoryProductViewConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CategoryProductDTO, CategoryProductViewModel>();
                cfg.CreateMap<ProductAnalysisDTO, ProductAnalysisViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });
            /*
             * accesing the home view controller
             */
             IMapper categoriesViewMapper = new Mapper(categoryProductViewConfig);
                try
                {
                    ProductAnalysisDTO categoryProduct = categoryProductBusiness.GetTopProduct();
                    ProductAnalysisViewModel data = new ProductAnalysisViewModel(); 
                    data = categoriesViewMapper.Map<ProductAnalysisDTO,ProductAnalysisViewModel>(categoryProduct);
                    return View(data);
                }
                catch(Exception ) {
                    return View("Internal Error");
                }

                //categoryProductBusiness categoryProductBusiness = new categoryProductBusiness();
                //var categoriesMapper = new MapperConfiguration(cfg => {
                //    cfg.CreateMap<CategoriesDTO, CategoriesView>();
                //});
                //IMapper categoriesViewMapper = new Mapper(categoriesMapper);
                //try
                //{
                //    CategoriesDTO categories = categoryProductBusiness.GetCategory();
                //    CategoriesView viewData = categoriesViewMapper.Map<CategoriesDTO, CategoriesView>(categories);
                //    return View(viewData);
                //}
                //catch(Exception) {
                //    return View("Internal Error");
                //}
            }
    }
}