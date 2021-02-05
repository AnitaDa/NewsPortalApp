using System;
using System.Collections.Generic;
using System.Text;

namespace SoftraySolution.Model.Request
{
    public class UserUpsertRequest
    {
        public string Email { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }

        public int? RolaId { get; set; }
        public int? AdministratorId { get; set; }
    }
}
