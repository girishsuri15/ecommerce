using MarketPlace.BusinessLayer.Exceptions;
using MarketPlace.DataAccessLayer.DataBaseObject;
using MarketPlace.Shared.DTO.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarketPlace.BusinessLayer.BusinessData
{
    public class UserBusiness
    {
        UserDatabase userDatabase;
        public UserBusiness()
        {
            userDatabase = new UserDatabase();
        }
        public UserInfoDTO RegisterUser(UserDTO userDTO)
        {
            if(userDatabase.IsUserExists(userDTO.Email))
            {
                throw new UserIsAlreadyExists();
            }
            else
            {
                userDTO.HashPassword= PasswordHelper.HashPassword(userDTO.Password);
                UserInfoDTO addedUser = userDatabase.CreateUser(userDTO);
                return addedUser;
            }

        }
        /// <summary>
        /// login procudre start
        /// </summary>
        /// <param name="userLoginData"></param>
        /// <returns>userToken</returns>
        public Guid LoginUser(UserLoginDTO userLoginData)
        {
            if (userDatabase.IsUserExists(userLoginData.Email))
            {
                 UserDTO userDetail   = userDatabase.GetUser(userLoginData);
                 bool isUserAuth = PasswordHelper.VerifyPassword(userLoginData.Password, userDetail.HashPassword);
                if (isUserAuth)
                    return userDetail.ID;
                else
                    throw new UserDetailIsWrong();
             }
            else
            {
                throw new UserIsNotExist();
            }
        }
        /// <summary>
        /// checkadmin if the user is admin
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool CheckAdmin(Guid UserID)
        {
            return userDatabase.CheckAdmin(UserID);
        }

    }
}
