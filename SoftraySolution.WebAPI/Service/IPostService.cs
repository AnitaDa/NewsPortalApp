using SoftraySolution.Model;
using SoftraySolution.Model.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SoftraySolution.WebAPI.Service
{
    public interface IPostService
    {
        List<MPost> Get(PostSearchRequest search);
        MPost GetById(int Id);
        MPost Insert(PostUpsertRequest insert);
        bool Delete(int Id);
        MPost Update(int Id, PostUpsertRequest update);
    }
}
