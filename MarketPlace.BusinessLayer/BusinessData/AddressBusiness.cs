using MarketPlace.DataAccessLayer.DataBaseObject;
using MarketPlace.Shared.DTO.Address;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.BusinessLayer.BusinessData
{
    public class AddressBusiness
    {
        AddressDatabase addressDatabase;
        public AddressBusiness()
        {
            addressDatabase = new AddressDatabase();
        }
        public AddresssDTO GetAllAddress(Guid UserId)
        {
              AddresssDTO addressDto =  addressDatabase.GetAllAddress(UserId);
            if (addressDto.Addresses.Count()>0)
            {
                return addressDto;
            }
            else
            {
                throw new Exception();
            }
        }
       public bool AddAddress(Guid UserID, AddressDTO newAddress)
        {
            return addressDatabase.AddAddress(UserID, newAddress);
        }
    }
}
