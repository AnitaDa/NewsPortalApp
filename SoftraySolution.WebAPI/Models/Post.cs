using System;
using System.Collections.Generic;

#nullable disable

namespace SoftraySolution.WebAPI.Models
{
    public partial class Post
    {
        public int PostId { get; set; }
        public string Title { get; set; }
        public DateTime? PostDate { get; set; }
        public string Content { get; set; }
        public string Phone { get; set; }
    }
}
