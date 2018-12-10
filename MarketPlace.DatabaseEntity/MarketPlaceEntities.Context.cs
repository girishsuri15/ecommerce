﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MarketPlace.DatabaseEntity
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class MarketPlaceEntities : DbContext
    {
        public MarketPlaceEntities()
            : base("name=MarketPlaceEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<CartVariantMapping> CartVariantMappings { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderPlaced> OrderPlaceds { get; set; }
        public virtual DbSet<OrderPlacedVariant> OrderPlacedVariants { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Property> Properties { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserAddressMapping> UserAddressMappings { get; set; }
        public virtual DbSet<Value> Values { get; set; }
        public virtual DbSet<Variant> Variants { get; set; }
        public virtual DbSet<VariantImage> VariantImages { get; set; }
        public virtual DbSet<VariantPropertyValue> VariantPropertyValues { get; set; }
    
        public virtual int addCategory(string categoryName, ObjectParameter categoryID)
        {
            var categoryNameParameter = categoryName != null ?
                new ObjectParameter("CategoryName", categoryName) :
                new ObjectParameter("CategoryName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("addCategory", categoryNameParameter, categoryID);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> AddItem(string categoryName, string productName, string title, Nullable<int> orderLimit, string description, Nullable<double> listingPrice, Nullable<double> discount, Nullable<int> quantitySold, Nullable<int> inventory, string propertyName, string valueName, string variantImage)
        {
            var categoryNameParameter = categoryName != null ?
                new ObjectParameter("CategoryName", categoryName) :
                new ObjectParameter("CategoryName", typeof(string));
    
            var productNameParameter = productName != null ?
                new ObjectParameter("ProductName", productName) :
                new ObjectParameter("ProductName", typeof(string));
    
            var titleParameter = title != null ?
                new ObjectParameter("Title", title) :
                new ObjectParameter("Title", typeof(string));
    
            var orderLimitParameter = orderLimit.HasValue ?
                new ObjectParameter("OrderLimit", orderLimit) :
                new ObjectParameter("OrderLimit", typeof(int));
    
            var descriptionParameter = description != null ?
                new ObjectParameter("Description", description) :
                new ObjectParameter("Description", typeof(string));
    
            var listingPriceParameter = listingPrice.HasValue ?
                new ObjectParameter("ListingPrice", listingPrice) :
                new ObjectParameter("ListingPrice", typeof(double));
    
            var discountParameter = discount.HasValue ?
                new ObjectParameter("Discount", discount) :
                new ObjectParameter("Discount", typeof(double));
    
            var quantitySoldParameter = quantitySold.HasValue ?
                new ObjectParameter("QuantitySold", quantitySold) :
                new ObjectParameter("QuantitySold", typeof(int));
    
            var inventoryParameter = inventory.HasValue ?
                new ObjectParameter("Inventory", inventory) :
                new ObjectParameter("Inventory", typeof(int));
    
            var propertyNameParameter = propertyName != null ?
                new ObjectParameter("PropertyName", propertyName) :
                new ObjectParameter("PropertyName", typeof(string));
    
            var valueNameParameter = valueName != null ?
                new ObjectParameter("ValueName", valueName) :
                new ObjectParameter("ValueName", typeof(string));
    
            var variantImageParameter = variantImage != null ?
                new ObjectParameter("VariantImage", variantImage) :
                new ObjectParameter("VariantImage", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("AddItem", categoryNameParameter, productNameParameter, titleParameter, orderLimitParameter, descriptionParameter, listingPriceParameter, discountParameter, quantitySoldParameter, inventoryParameter, propertyNameParameter, valueNameParameter, variantImageParameter);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> AddProduct(string productName, string title, Nullable<int> orderLimit, string description, Nullable<System.Guid> categoryID, Nullable<double> listingPrice, Nullable<double> discount, Nullable<int> quantitySold, Nullable<int> inventory, string propertyName, string valueName, string variantImage)
        {
            var productNameParameter = productName != null ?
                new ObjectParameter("ProductName", productName) :
                new ObjectParameter("ProductName", typeof(string));
    
            var titleParameter = title != null ?
                new ObjectParameter("Title", title) :
                new ObjectParameter("Title", typeof(string));
    
            var orderLimitParameter = orderLimit.HasValue ?
                new ObjectParameter("OrderLimit", orderLimit) :
                new ObjectParameter("OrderLimit", typeof(int));
    
            var descriptionParameter = description != null ?
                new ObjectParameter("Description", description) :
                new ObjectParameter("Description", typeof(string));
    
            var categoryIDParameter = categoryID.HasValue ?
                new ObjectParameter("CategoryID", categoryID) :
                new ObjectParameter("CategoryID", typeof(System.Guid));
    
            var listingPriceParameter = listingPrice.HasValue ?
                new ObjectParameter("ListingPrice", listingPrice) :
                new ObjectParameter("ListingPrice", typeof(double));
    
            var discountParameter = discount.HasValue ?
                new ObjectParameter("Discount", discount) :
                new ObjectParameter("Discount", typeof(double));
    
            var quantitySoldParameter = quantitySold.HasValue ?
                new ObjectParameter("QuantitySold", quantitySold) :
                new ObjectParameter("QuantitySold", typeof(int));
    
            var inventoryParameter = inventory.HasValue ?
                new ObjectParameter("Inventory", inventory) :
                new ObjectParameter("Inventory", typeof(int));
    
            var propertyNameParameter = propertyName != null ?
                new ObjectParameter("PropertyName", propertyName) :
                new ObjectParameter("PropertyName", typeof(string));
    
            var valueNameParameter = valueName != null ?
                new ObjectParameter("ValueName", valueName) :
                new ObjectParameter("ValueName", typeof(string));
    
            var variantImageParameter = variantImage != null ?
                new ObjectParameter("VariantImage", variantImage) :
                new ObjectParameter("VariantImage", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("AddProduct", productNameParameter, titleParameter, orderLimitParameter, descriptionParameter, categoryIDParameter, listingPriceParameter, discountParameter, quantitySoldParameter, inventoryParameter, propertyNameParameter, valueNameParameter, variantImageParameter);
        }
    
        public virtual int AddProperty(string name, ObjectParameter propertyID)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AddProperty", nameParameter, propertyID);
        }
    
        public virtual int AddValue(string name, ObjectParameter valueID)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AddValue", nameParameter, valueID);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> AddVariant(Nullable<System.Guid> productID, Nullable<double> listingPrice, Nullable<double> discount, Nullable<int> quantitySold, Nullable<int> inventory, string propertyName, string valueName, string variantImage)
        {
            var productIDParameter = productID.HasValue ?
                new ObjectParameter("ProductID", productID) :
                new ObjectParameter("ProductID", typeof(System.Guid));
    
            var listingPriceParameter = listingPrice.HasValue ?
                new ObjectParameter("ListingPrice", listingPrice) :
                new ObjectParameter("ListingPrice", typeof(double));
    
            var discountParameter = discount.HasValue ?
                new ObjectParameter("Discount", discount) :
                new ObjectParameter("Discount", typeof(double));
    
            var quantitySoldParameter = quantitySold.HasValue ?
                new ObjectParameter("QuantitySold", quantitySold) :
                new ObjectParameter("QuantitySold", typeof(int));
    
            var inventoryParameter = inventory.HasValue ?
                new ObjectParameter("Inventory", inventory) :
                new ObjectParameter("Inventory", typeof(int));
    
            var propertyNameParameter = propertyName != null ?
                new ObjectParameter("PropertyName", propertyName) :
                new ObjectParameter("PropertyName", typeof(string));
    
            var valueNameParameter = valueName != null ?
                new ObjectParameter("ValueName", valueName) :
                new ObjectParameter("ValueName", typeof(string));
    
            var variantImageParameter = variantImage != null ?
                new ObjectParameter("VariantImage", variantImage) :
                new ObjectParameter("VariantImage", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("AddVariant", productIDParameter, listingPriceParameter, discountParameter, quantitySoldParameter, inventoryParameter, propertyNameParameter, valueNameParameter, variantImageParameter);
        }
    
        public virtual int AddVariantImage(Nullable<System.Guid> variantID, string imageURL)
        {
            var variantIDParameter = variantID.HasValue ?
                new ObjectParameter("VariantID", variantID) :
                new ObjectParameter("VariantID", typeof(System.Guid));
    
            var imageURLParameter = imageURL != null ?
                new ObjectParameter("ImageURL", imageURL) :
                new ObjectParameter("ImageURL", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AddVariantImage", variantIDParameter, imageURLParameter);
        }
    
        public virtual ObjectResult<Nullable<System.Guid>> AddVariantPropertyValueMapping(string propertyName, string valueName, ObjectParameter mapID)
        {
            var propertyNameParameter = propertyName != null ?
                new ObjectParameter("PropertyName", propertyName) :
                new ObjectParameter("PropertyName", typeof(string));
    
            var valueNameParameter = valueName != null ?
                new ObjectParameter("ValueName", valueName) :
                new ObjectParameter("ValueName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.Guid>>("AddVariantPropertyValueMapping", propertyNameParameter, valueNameParameter, mapID);
        }
    }
}
