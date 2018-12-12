using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AutoMapper;
using System.Threading.Tasks;
using MarketPlace.DatabaseEntity;
using System.Data.Entity;
using MarketPlace.Shared.DTO.Category;
using MarketPlace.Shared.DTO.ProductCategory;

namespace MarketPlace.DataAccessLayer.DataBaseObject
{
  public  class CategoryProductDatabase
    {
        MarketPlaceEntities dbContext;
        IMapper categoryListMapper;
        IMapper ProductsFromCategoryMapper;
        public CategoryProductDatabase()
        {
            dbContext = new MarketPlaceEntities();
            var categoryDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Category, CategoryDTO>();
            });
            var categoryProductDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Category, CategoryDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>(); 
            });
            var ProductsCategoryDTOMapper= new MapperConfiguration(cfg => {
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>();
            });
            ProductsFromCategoryMapper = new Mapper(ProductsCategoryDTOMapper);
            categoryListMapper = new Mapper(categoryProductDTOConfig);
        }
        //get all the categories avaiable
        public CategoriesDTO GetCategory()
        {
            
            IEnumerable<Category> categoryList = dbContext.Categories.ToList();
            CategoriesDTO newCategoryDTO = new CategoriesDTO();
            newCategoryDTO.Category = categoryListMapper.Map<IEnumerable<Category>, IEnumerable<CategoryDTO>>(categoryList);
            return newCategoryDTO;
        }
        //get top selleing products and catoriges
        public ProductAnalysisDTO GetTopProduct()
        {
            ProductAnalysisDTO productAnalysisDTO = new ProductAnalysisDTO();
            var Categories = dbContext.Categories.Include(c=>c.Products).OrderByDescending(c => c.ProductsSold).ToList();
            productAnalysisDTO.Categories = categoryListMapper.Map<IEnumerable<Category>, IEnumerable<CategoryProductDTO>>(Categories);
            return  productAnalysisDTO;
        }
        public CategoryProductDTO GetProductFromCatgory(Guid CategoryID)
        {
            CategoryProductDTO categoryProduct = new CategoryProductDTO();
            var product = dbContext.Products.Where(c => c.CategoryID == CategoryID).Include(c => c.Variants).ToList();
            categoryProduct.Products = ProductsFromCategoryMapper.Map<IEnumerable<Product>, IEnumerable<ProductDTO>>(product);
                return categoryProduct;
        }
        public Guid GetCategoryByName(string CategoryName)
        {
            CategoryProductDTO categoryProduct = new CategoryProductDTO();
            Guid id = dbContext.Categories.Where(c => c.Name == CategoryName).Select(c=>c.ID).FirstOrDefault();
            //categoryProduct.Products = ProductsFromCategoryMapper.Map<IEnumerable<Product>, IEnumerable<ProductDTO>>(product);
            return id;
        }
        public CategoryProductDTO SearchProducts(string searchString)
        {
            CategoryProductDTO ProductList = new CategoryProductDTO();
            var product = dbContext.Products.Where(c => c.Title.Contains(searchString) || c.Description.Contains(searchString)).Include(c => c.Variants).ToList();
            ProductList.Products = ProductsFromCategoryMapper.Map<IEnumerable<Product>, IEnumerable<ProductDTO>>(product);
            return ProductList;
        }
        public ProductDTO GetProduct(Guid CategoryID)
        {
            ProductDTO Product = new ProductDTO();
            var product = dbContext.Products.Where(c => c.ID == CategoryID ).FirstOrDefault();
            Product = ProductsFromCategoryMapper.Map<Product, ProductDTO>(product);
            foreach (VariantDTO variant in Product.Variants)
            {
                variant.SKU = SetVariantStringFromSKU(variant.SKU);
            }
                return Product;
        }
        private string SetVariantStringFromSKU(string SKU)
        {
            string variantString = "";
            string[] propertyValueMappingID = SKU.Split('~');
            foreach (string mapper in propertyValueMappingID)
            {
                int mapperID = int.Parse(mapper);
                Guid propertyID = dbContext.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.PropertyID).FirstOrDefault();
                Guid valueID = dbContext.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.ValueID).FirstOrDefault();
                string property = dbContext.Properties.Where(p => p.ID == propertyID).Select(p => p.Name).FirstOrDefault();
                string value = dbContext.Values.Where(v => v.ID == valueID).Select(v => v.Name).FirstOrDefault();
                variantString = variantString + " " + property + ":" + value;
            }
            return variantString;
        }


    }
}
