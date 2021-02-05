using AutoMapper;
using Microsoft.AspNetCore.Http;
using SoftraySolution.Model.Request;
using SoftraySolution.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SoftraySolution.WebAPI.Service
{
    public class UserService : IUser
    {
        private readonly IHttpContextAccessor _accessor;
        private readonly PortalContext _context;
        private readonly IMapper _mapper;
        public UserService(PortalContext context, IMapper mapper, IHttpContextAccessor accessor)
        {
            _context = context;
            _mapper = mapper;
            _accessor = accessor;
        }
        public static string GenerateSalt()
        {
            var buf = new byte[16];
            (new RNGCryptoServiceProvider()).GetBytes(buf);
            return Convert.ToBase64String(buf);
        }
        public static string GenerateHash(string salt, string lozinka)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(lozinka);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }
        public MUser Insert(UserUpsertRequest insert)
        {
            //provera tacnosti lozinke
            if (insert.Password != insert.ConfirmPassword)
            {
                throw new Exception("Confirm password is incorect!");
            }
            var entity = _mapper.Map<UserN>(insert);
            entity.LozinkaSalt = GenerateSalt();
            entity.LozinkaHash = GenerateHash(entity.LozinkaSalt, insert.Password);
            _context.UserNs.Add(entity);
            _context.SaveChanges();
            return _mapper.Map<MUser>(entity);
        }
        public MUser Authenticate(AuthenticateRequest request)
        {
            var user = _context.UserNs.FirstOrDefault(x => x.UserName == request.Username);

            if (user != null)
            {
                var hash = GenerateHash(user.LozinkaSalt, request.Password);
                if (hash == user.LozinkaHash)
                {
                    return _mapper.Map<MUser>(user);
                }
            }

            return null;
        }

        public MUser GetLoggedUser()
        {

            var obj = _accessor?.HttpContext?.User.Claims.ToList();
            if (obj.Count > 0)
            {
                var query = _context.UserNs.Where(i => i.UserName == obj[0].Value).FirstOrDefault();
                return _mapper.Map<MUser>(query);
            }

            return null;
        }
    }
}
