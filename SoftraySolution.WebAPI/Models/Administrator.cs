using System;
using System.Collections.Generic;

#nullable disable

namespace SoftraySolution.WebAPI.Models
{
    public partial class Administrator
    {
        public Administrator()
        {
            UserNs = new HashSet<UserN>();
        }

        public int AdministratorId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public virtual ICollection<UserN> UserNs { get; set; }
    }
}
