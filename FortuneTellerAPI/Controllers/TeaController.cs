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
    public class TeaController : ControllerBase
    {
        private readonly FortuneTellerAPIDBContext _context;

        public TeaController(FortuneTellerAPIDBContext context)
        {
            _context = context;
        }

        // GET: api/Tea
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tea>>> GetTea()
        {
            return await _context.Tea.ToListAsync();
        }

        // GET: api/Tea/5
        [HttpGet("{id:int}")]
        public async Task<ActionResult<Response<Tea>>> GetTea(int id)
        {
            var tea = await _context.Tea.FindAsync(id);

            if (tea == null)
            {
                return new Response<Tea>()
                {
                    items = tea,
                    statusCode = 404,
                    statusDescription = "Tarot Card Not Found"
                };
            }

            return new Response<Tea>()
            {
                items = tea,
                statusCode = 200,
                statusDescription = "Success"
            };
        }

        // GET: api/Tea/name
        [HttpGet("{name}")]
        public async Task<ActionResult<Response<Object>>> TeaReading(string name)
        {
            // Generate random tea reading
            Random generator = new Random();
            List<Tea> Teas = await _context.Tea.ToListAsync();

            Tea Reading = (Teas[generator.Next(0, Teas.Count)]);

            if (Teas == null)
            {
                return new Response<Object>()
                {
                    items = Reading,
                    statusCode = 404,
                    statusDescription = "Tea Card Not Found"
                };
            }

            // Add reading to Log
            Log log = new Log()
            {
                Readings = Reading.Description,
                Name = name,
                Date = DateTime.Now,
                Type = "Tea",
                Tarots = null,
                Teas = new List<Tea>() { Reading }
            };
            return new Response<Object>()
            {
                items = new
                {
                    Readings = log.Readings,
                    Date = log.Date
                },
                statusCode = 200,
                statusDescription = "Success"
            };
           
        }

        // PUT: api/Tea/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<Response<IActionResult>> PutTea(int id, Tea tea)
        {
            if (id != tea.ID)
            {
                return new Response<IActionResult>()
                {
                    items = NotFound(),
                    statusCode = 404,
                    statusDescription = "Tea Card Not Found"
                };
            }

            _context.Entry(tea).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TeaExists(id))
                {
                    return new Response<IActionResult>()
                    {
                        items = NotFound(),
                        statusCode = 404,
                        statusDescription = "Tea Card Not Found"
                    };
                }
                else
                {
                    throw;
                }
            }

            return new Response<IActionResult>()
            {
                items = NoContent(),
                statusCode = 200,
                statusDescription = "Success"
            };
        }

        // POST: api/Tea
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Response<IActionResult>>> PostTea(Tea tea)
        {
            _context.Tea.Add(tea);
            await _context.SaveChangesAsync();

            return new Response<IActionResult>()
            {
                items = CreatedAtAction("GetTea", new { id = tea.ID }, tea),
                statusCode = 200,
                statusDescription = "Success"
            };
           
        }

        // DELETE: api/Tea/5
        [HttpDelete("{id}")]
        public async Task<Response<IActionResult>> DeleteTea(int id)
        {
            var tea = await _context.Tea.FindAsync(id);

            if ( tea == null) { 
            return new Response<IActionResult>()
            {
                items = NotFound(),
                statusCode = 404,
                statusDescription = "Tea Not Found"
            };
            }

            _context.Tea.Remove(tea);
            await _context.SaveChangesAsync();

            return new Response<IActionResult>()
            {
                items = null,
                statusCode = 200,
                statusDescription = "Tea Was Removed"
            };
        }

        private bool TeaExists(int id)
        {
            return _context.Tea.Any(e => e.ID == id);
        }
    }
}
