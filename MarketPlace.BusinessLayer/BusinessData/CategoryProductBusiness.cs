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
    /// <summary>
    /// variant product  category businees class foe hadling the business logic
    /// </summary>
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
        /// <summary>
        /// get the Top 3 Category for 3 product in each Category and showing all category product with 5 product
        /// </summary>
        /// <returns>ProductAnalysisDTO</returns>
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
        /// <summary>
        /// get all product from the CatgoryName
        /// </summary>
        /// <param name="categoryName">categoryname</param>
        /// <returns>CategoryProductDTO</returns>
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
        /// <summary>
        /// search product with user search string
        /// </summary>
        /// <param name="seacrchstring"></param>
        /// <returns>CategoryProductDTO</returns>
        public CategoryProductDTO SearchProducts(string seacrchstring)
        {
            return categoryProductDatabase.SearchProducts(seacrchstring);
        }
        /// <summary>
        /// get product details form the productId
        /// </summary>
        /// <param name="productId"></param>
        /// <returns>ProductDTO</returns>
        public ProductDTO GetProduct(Guid productId)
        {
            return categoryProductDatabase.GetProduct(productId); ;
        }
    }
}
