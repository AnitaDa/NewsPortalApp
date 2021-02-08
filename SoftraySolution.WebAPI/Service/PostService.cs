using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SoftraySolution.Model;
using SoftraySolution.Model.Request;
using SoftraySolution.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SoftraySolution.WebAPI.Service
{
    public class PostService : IPostService
    {
        private readonly PortalContext _context;
        private readonly IMapper _mapper;
        public PostService(PortalContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public bool Delete(int Id)
        {
            var obj = _context.Posts.Find(Id);
            if (obj != null)
            {
                _context.Posts.Remove(obj);
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<MPost> Get(PostSearchRequest search)
        {
            var query = _context.AdministratorPosts.AsQueryable();
            if (search.Title != null)
                query = query.Where(x => x.Post.Title.Equals(search.Title));
            if (search.AdministratorId != 0)
                query = query.Where(x => x.Administrator.AdministratorId == search.AdministratorId);
            var list = query.Select(s => new MPost
            {
                PostId=s.Post.PostId,
                Title = s.Post.Title,
                PostDate = s.Post.PostDate,
                Content = s.Post.Content,
                AdministratorId=s.Administrator.AdministratorId,
                Author = s.Administrator.FirstName + " " + s.Administrator.LastName
            }).ToList();
            return _mapper.Map<List<MPost>>(list);
        }

        public MPost GetById(int Id)
        {
            //var obj = _context.AdministratorPosts
            //    .Include(x => x.Administrator)
            //    .Include(x=>x.Post)
            //    .Where(s => s.PostId == Id).FirstOrDefault();
            var query = _context.AdministratorPosts.AsQueryable();
            query = query.Where(x => x.PostId == Id);
            var obj = query.Select(s => new MPost {
            PostId=s.PostId,
            Title=s.Post.Title,
            Content=s.Post.Content,
            PostDate=s.Post.PostDate,
            AdministratorId=s.AdministratorId,
            Author=s.Administrator.FirstName+" "+s.Administrator.LastName
            }).FirstOrDefault();
 
            return _mapper.Map<MPost>(obj);
        }

        public MPost Insert(PostUpsertRequest insert)
        {
            var newObj = _mapper.Map<Post>(insert);
            _context.Posts.Add(newObj);
            _context.SaveChanges();
            return _mapper.Map<MPost>(newObj);
        }
       public MPost Update(int Id,PostUpsertRequest update)
        {
            var obj = _context.Posts.Find(Id);
            _context.Posts.Attach(obj);
            _context.Posts.Update(obj);
            _mapper.Map(update, obj);
            _context.SaveChanges();
            return _mapper.Map<MPost>(obj);
        }
        public MAdminPost InsertAdminPost(AdminPostInsertRequest insert)
        {
            var obj = _mapper.Map<Models.AdministratorPost>(insert);
            _context.AdministratorPosts.Add(obj);
            _context.SaveChanges();
            return _mapper.Map<MAdminPost>(obj);
        }
    }
    }
