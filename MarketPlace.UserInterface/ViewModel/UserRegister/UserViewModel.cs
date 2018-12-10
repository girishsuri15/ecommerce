using MarketPlace.UserInterface.CustomAttribute;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MarketPlace.UserInterface.ViewModel.UserRegister
{
    public class UserViewModel
    {
        [Required]
        [RegularExpression("^[a-zA-Z ]+", ErrorMessage = "Name only contain alphabetic and space")]
        public string Name { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password should be between 8 and 20 characters")]
        public string Password { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password should be between 8 and 20 characters")]
        [ConfirmPassword]
        public string ConfirmPassword { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        [RegularExpression(@"\d{10}", ErrorMessage = "Please enter a valid Mobile Number")]
        public string PhoneNumber { get; set; }

    }
}