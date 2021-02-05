using System;
using System.Collections.Generic;
using System.Text;

namespace SoftraySolution.Model.Request
{
    public class PostUpsertRequest
    {
        public int PostId { get; set; }
        public string Title { get; set; }
        public DateTime? PostDate { get; set; }
        public string Content { get; set; }
    }
}
