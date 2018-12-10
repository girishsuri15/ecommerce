using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Web;

namespace MarketPlace.UserInterface.CustomAttribute
{
    public class ConfirmPasswordAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object confirmPassword, ValidationContext validationContext)
        {
            if ((string)confirmPassword == null)
            {
                return new ValidationResult("Confirmation Password not entered");
            }
            object instance = validationContext.ObjectInstance;
            Type type = instance.GetType();
            PropertyInfo password = type.GetProperty("Password");
            if (password == null)
            {
                return new ValidationResult("Password not entered");
            }

            string passwordValue = (string)password.GetValue(instance);
            string confirmPasswordValue = (string)confirmPassword;
            if (passwordValue != confirmPasswordValue)
            {
                return new ValidationResult("Passwords do not match");
            }
            return ValidationResult.Success;
        }
    }

}
