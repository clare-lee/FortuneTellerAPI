#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FortuneTellerAPI.Models;

namespace FortuneTellerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogController : ControllerBase
    {
        private readonly FortuneTellerAPIDBContext _context;

        public LogController(FortuneTellerAPIDBContext context)
        {
            _context = context;
        }

        // GET: api/Log/name
        [HttpGet("{name}")]
        public async Task<ActionResult<Response<List<Log>>>> GetLog(string name)
        {
            
            List<Log> Logs = await _context.Log.Where(log=>log.Name==name).ToListAsync();


            return new Response<List<Log>>()
            {
                items = Logs,
                statusCode = 200,
                statusDescription = "Success"
            };
        }
    }
}
