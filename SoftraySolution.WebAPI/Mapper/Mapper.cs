using AutoMapper;
using SoftraySolution.Model;
using SoftraySolution.Model.Request;
using SoftraySolution.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SoftraySolution.WebAPI.Mapper
{
    public class Mapper:Profile
    {
        public Mapper()
        {
            CreateMap<Post, MPost>();
            CreateMap<PostUpsertRequest, Post>().ReverseMap();
            CreateMap<UserN, MUser>();
            CreateMap<UserUpsertRequest,UserN>();
            CreateMap<AdminPostInsertRequest, AdministratorPost>();
            CreateMap<AdministratorPost, MAdminPost>();
        }
    }
}
