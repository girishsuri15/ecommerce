using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.User
{
   public class UserDTO
    {
        public System.Guid ID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string HashPassword { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public System.Guid RoleID { get; set; }

    }
}
