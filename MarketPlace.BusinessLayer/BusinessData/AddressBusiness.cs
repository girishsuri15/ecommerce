using MarketPlace.DataAccessLayer.DataBaseObject;
using MarketPlace.Shared.DTO.Address;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.BusinessLayer.BusinessData
{
    /// <summary>
    /// address business handler
    /// </summary>
    public class AddressBusiness
    {
        AddressDatabase addressDatabase;
        public AddressBusiness()
        {
            addressDatabase = new AddressDatabase();
        }
        /// <summary>
        /// get all addresses of user
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns>AddresssDTO</returns>
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
        /// <summary>
        /// Add address of particluar user
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="newAddress"></param>
        /// <returns>bool is address added succefully</returns>
       public bool AddAddress(Guid UserID, AddressDTO newAddress)
        {
            return addressDatabase.AddAddress(UserID, newAddress);
        }
    }
}
