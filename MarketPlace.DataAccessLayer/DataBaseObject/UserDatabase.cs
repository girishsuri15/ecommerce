using AutoMapper;
using MarketPlace.DatabaseEntity;
using MarketPlace.Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.DataAccessLayer.DataBaseObject
{
    public class UserDatabase
    {
        MarketPlaceEntities dbContext;
        IMapper userMapper;
        IMapper AddUserMapper;
        IMapper UserDetailsMapper;
        public UserDatabase()
        {
            dbContext = new MarketPlaceEntities();
            var UserDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<User, UserInfoDTO>();
            });
            var AddUserConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<UserDTO, User>();
            });
            var UserDbConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<User, UserDTO>();
            });
            userMapper = new Mapper(UserDTOConfig);
            AddUserMapper = new Mapper(AddUserConfig);
            UserDetailsMapper = new Mapper(UserDbConfig);

        }
        public bool IsUserExists(string email)
        {
            UserInfoDTO userInfoData = new UserInfoDTO();
            User user = dbContext.Users.Where(c => c.Email == email).FirstOrDefault();
            if (user != null)
            {
                return true;
            }
            return false;
           // userInfoData = userMapper.Map<User, UserInfoDTO>(user);
            //return id;
        }
        public UserInfoDTO CreateUser(UserDTO user)
        {
            User newUser = AddUserMapper.Map<UserDTO, User>(user);
            newUser.ID = Guid.NewGuid();
            newUser.RoleID = dbContext.Roles.Where(r => r.Name == "Customer").Select(c => c.ID).FirstOrDefault();
            dbContext.Users.Add(newUser);
            dbContext.SaveChanges();
            UserInfoDTO newuserInfoDTO = userMapper.Map<User, UserInfoDTO>(newUser);
            return newuserInfoDTO;
        }
        public UserDTO GetUser(UserLoginDTO userLoginDTO)
        {
            UserLoginDTO userInfoData = new UserLoginDTO();
            User user = dbContext.Users.Where(c => c.Email == userLoginDTO.Email).FirstOrDefault();
            UserDTO userDetails = UserDetailsMapper.Map<User, UserDTO>(user);
            return userDetails;
            
        }
        public bool CheckAdmin(Guid UserID)
        {
            User user = dbContext.Users.Where(u => u.ID == UserID).First();
            string role = dbContext.Roles.Where(r => r.ID == user.RoleID).Select(r => r.Name).FirstOrDefault();

            if (role.ToUpper() == "ADMIN")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}