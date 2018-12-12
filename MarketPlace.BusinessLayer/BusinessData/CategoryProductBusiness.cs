using MarketPlace.BusinessLayer.Exceptions;
using MarketPlace.DataAccessLayer.DataBaseObject;
using MarketPlace.Shared.DTO.Category;
using MarketPlace.Shared.DTO.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.BusinessLayer.BusinessData
{
    public class CategoryProductBusiness
    {
        CategoryProductDatabase categoryProductDatabase;
        public CategoryProductBusiness()
            {
                categoryProductDatabase = new CategoryProductDatabase();
            }
        public CategoriesDTO GetCategory()
        {
            return categoryProductDatabase.GetCategory();
        }

        public ProductAnalysisDTO GetTopProduct()
        {
            ProductAnalysisDTO productAnalysisDTO = categoryProductDatabase.GetTopProduct();
                int counter = 0;
                foreach (var category in productAnalysisDTO.Categories)
                {
                    if (counter < 3)
                    {
                        
                        category.Products = category.Products.Take(3);
                    }
                    else
                    {
                        category.Products = category.Products.Take(5);
                    }
                counter++;
            }
            return productAnalysisDTO;
        }
        public CategoryProductDTO GetProductFromCatgory(string categoryName)
        {            
            Guid Id = categoryProductDatabase.GetCategoryByName(categoryName);
            if (Id != Guid.Empty)
            {
                return categoryProductDatabase.GetProductFromCatgory(Id);
            }
            else
            {
                throw new CategoryNotFoundException();
               // return new CategoryProductDTO();
            }
        }
        public CategoryProductDTO SearchProducts(string seacrchstring)
        {
            return categoryProductDatabase.SearchProducts(seacrchstring);
        }
        public ProductDTO GetProduct(Guid productId)
        {
            return categoryProductDatabase.GetProduct(productId); ;
        }
    }
}
