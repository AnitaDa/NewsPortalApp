using System;

namespace SoftraySolution.Model
{
    public class MPost
    {
        public int PostId { get; set; }
        public string Title { get; set; }
        public DateTime? PostDate { get; set; }
        public string Content { get; set; }
        public string Author { get; set; }
        public int? AdministratorId { get; set; }
    }
}
