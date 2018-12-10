//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Variant
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Variant()
        {
            this.CartVariantMappings = new HashSet<CartVariantMapping>();
            this.OrderPlacedVariants = new HashSet<OrderPlacedVariant>();
            this.VariantImages = new HashSet<VariantImage>();
        }
    
        public System.Guid ID { get; set; }
        public string SKU { get; set; }
        public System.Guid ProductID { get; set; }
        public double ListingPrice { get; set; }
        public double Discount { get; set; }
        public int QuantitySold { get; set; }
        public int Inventory { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CartVariantMapping> CartVariantMappings { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderPlacedVariant> OrderPlacedVariants { get; set; }
        public virtual Product Product { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VariantImage> VariantImages { get; set; }
    }
}
