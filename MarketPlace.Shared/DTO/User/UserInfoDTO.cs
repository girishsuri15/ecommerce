using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.Shared.DTO.User
{
 public class UserInfoDTO
    {
        public System.Guid ID { get; set; }
        public string Name { get; set; }
        public string HashPassword { get; set; }
    }
}
