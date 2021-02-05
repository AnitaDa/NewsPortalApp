using System;
using System.Collections.Generic;

#nullable disable

namespace SoftraySolution.WebAPI.Models
{
    public partial class UserN
    {
        public int UserNid { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public string LozinkaHash { get; set; }
        public string LozinkaSalt { get; set; }
        public int? RolaId { get; set; }
        public int? AdministratorId { get; set; }

        public virtual Administrator Administrator { get; set; }
        public virtual Rola Rola { get; set; }
    }
}
