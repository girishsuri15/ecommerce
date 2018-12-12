using AutoMapper;
using MarketPlace.DatabaseEntity;
using MarketPlace.Shared.DTO.Address;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.DataAccessLayer.DataBaseObject
{
    public class AddressDatabase
    {
        MarketPlaceEntities dbContext;
        IMapper AddresssMapper;
        IMapper AddressAdded;

        public AddressDatabase()
        {
            dbContext = new MarketPlaceEntities();
            var AddressConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Address, AddressDTO>();
            });
            var AddressDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<AddressDTO, Address>();
            });
            AddresssMapper = new Mapper(AddressConfig);
            AddressAdded = new Mapper(AddressDTOConfig);
        }
        public AddresssDTO GetAllAddress(Guid UserId)
        {
            IEnumerable<UserAddressMapping> UserAddresssMapping = dbContext.UserAddressMappings.Where(a => a.UserID == UserId).ToList();
            Debug.WriteLine(dbContext.UserAddressMappings.Where(a => a.UserID == UserId).ToList());
            List<Address> addreses = new List<Address>();
            foreach (var useraddress in UserAddresssMapping)
            {
                addreses.Add(useraddress.Address);
            }
            AddresssDTO addressDTO = new AddresssDTO();
             addressDTO.Addresses = AddresssMapper.Map<IEnumerable<Address>, IEnumerable<AddressDTO>>(addreses);
            return addressDTO;
        }
        public bool AddAddress(Guid UserID, AddressDTO newAddress)
        {
            newAddress.ID = Guid.NewGuid();
            Address newAddres= AddressAdded.Map<AddressDTO, Address>(newAddress);
            UserAddressMapping userAddressMapping = new UserAddressMapping();
            userAddressMapping.ID= Guid.NewGuid();
            userAddressMapping.UserID = UserID;
            userAddressMapping.AddressID = newAddress.ID;

            dbContext.Addresses.Add(newAddres);
            dbContext.UserAddressMappings.Add(userAddressMapping);
            dbContext.SaveChanges();
            return true;
        }
    }
}
