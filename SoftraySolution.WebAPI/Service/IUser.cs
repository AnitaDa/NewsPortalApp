using SoftraySolution.Model.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SoftraySolution.WebAPI.Service
{
    public interface IUser
    {
        MUser Insert(UserUpsertRequest insert);
        MUser Authenticate(AuthenticateRequest request);
        //MUser GetLoggedUser();
    }
}
