﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SoftraySolution.Model;
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
    [Authorize]
    public class PostController : Controller
    {
        private readonly IPostService _service;
        public PostController(IPostService service)
        {
            _service = service;
        }
       
        [HttpGet]
        public List<MPost> Get([FromQuery]PostSearchRequest search)
        {
            return _service.Get(search);
        }
        
        [HttpGet("{Id}")]
        public MPost GetById(int Id)
        {
            return _service.GetById(Id);
        }
        [HttpDelete]
        public ActionResult<MPost> Delete(int Id)
        {
            if ((_service.GetById(Id) != null))
                return Ok(_service.GetById(Id));
            else
                return NotFound();
        }
        [AllowAnonymous]
        [HttpPost]
        public MPost Insert(PostUpsertRequest insert)
        {
            return _service.Insert(insert);
        }
        [HttpPut("{Id}")]
        public MPost Update(int Id, PostUpsertRequest update)
        {
            return _service.Update(Id, update);
        }
    }
}
