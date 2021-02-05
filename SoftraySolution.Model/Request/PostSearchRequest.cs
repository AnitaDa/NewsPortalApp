using System;
using System.Collections.Generic;
using System.Text;

namespace SoftraySolution.Model.Request
{
    public class PostSearchRequest
    {
        public string Title { get; set; }
        public int AdministratorId { get; set; }

        public override string ToString()
        {
            return $"Title={Title}&AdministratorId={AdministratorId}";
        }
    }
}
