using System;
using System.Collections.Generic;
using System.Text;

namespace SoftraySolution.Model.Request
{
    public class MUser
    {
        public string Email { get; set; }
        public string UserName { get; set; }
        public string LozinkaHash { get; set; }
        public string LozinkaSalt { get; set; }
        public int? AdministratorId { get; set; }
    }
}
