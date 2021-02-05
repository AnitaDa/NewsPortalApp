using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SoftraySolution.Model.Request;
using SoftraySolution.WebAPI.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SoftraySolution.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUser _service;
        public UserController(IUser service)
        {
            _service = service;
        }
        [HttpPost]
        public MUser Insert(UserUpsertRequest insert)
        {
            return _service.Insert(insert);
        }

        
        [HttpPost("Authenticate")]
        public MUser Login(AuthenticateRequest request)
        {
            return _service.Authenticate(request);
        }
      
        //[Route("[action]")]
        //[HttpGet]
        //public MUser GetLoggedUser()
        //{
        //    return _service.GetLoggedUser();
        //}
    }
}
