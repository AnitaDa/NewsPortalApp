using System;
using System.Collections.Generic;

#nullable disable

namespace SoftraySolution.WebAPI.Models
{
    public partial class Rola
    {
        public Rola()
        {
            UserNs = new HashSet<UserN>();
        }

        public int RolaId { get; set; }
        public string RolaName { get; set; }

        public virtual ICollection<UserN> UserNs { get; set; }
    }
}
