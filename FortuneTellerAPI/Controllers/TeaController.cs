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
        [HttpGet("{id}")]
        public async Task<ActionResult<Tea>> GetTea(int id)
        {
            var tea = await _context.Tea.FindAsync(id);

            if (tea == null)
            {
                return NotFound();
            }

            return tea;
        }

        // PUT: api/Tea/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTea(int id, Tea tea)
        {
            if (id != tea.ID)
            {
                return BadRequest();
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
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Tea
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Tea>> PostTea(Tea tea)
        {
            _context.Tea.Add(tea);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTea", new { id = tea.ID }, tea);
        }

        // DELETE: api/Tea/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTea(int id)
        {
            var tea = await _context.Tea.FindAsync(id);
            if (tea == null)
            {
                return NotFound();
            }

            _context.Tea.Remove(tea);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TeaExists(int id)
        {
            return _context.Tea.Any(e => e.ID == id);
        }
    }
}
