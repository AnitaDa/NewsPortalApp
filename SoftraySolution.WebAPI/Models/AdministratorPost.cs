using System;
using System.Collections.Generic;

#nullable disable

namespace SoftraySolution.WebAPI.Models
{
    public partial class AdministratorPost
    {
        public int? AdministratorId { get; set; }
        public int? PostId { get; set; }

        public virtual Administrator Administrator { get; set; }
        public virtual Post Post { get; set; }
    }
}
