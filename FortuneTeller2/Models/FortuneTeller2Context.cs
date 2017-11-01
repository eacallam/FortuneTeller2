using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace FortuneTeller2.Models
{
    public class FortuneTeller2Context : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public FortuneTeller2Context() : base("name=FortuneTeller2Context")
        {
        }

        public System.Data.Entity.DbSet<FortuneTeller2.Models.Customer> Customers { get; set; }

        public System.Data.Entity.DbSet<FortuneTeller2.Models.BirthMonth> BirthMonths { get; set; }

        public System.Data.Entity.DbSet<FortuneTeller2.Models.FavoriteColor> FavoriteColors { get; set; }
    }
}
