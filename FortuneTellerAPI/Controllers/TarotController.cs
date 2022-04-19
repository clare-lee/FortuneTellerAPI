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
    public class TarotController : ControllerBase
    {
        private readonly FortuneTellerAPIDBContext _context;

        public TarotController(FortuneTellerAPIDBContext context)
        {
            _context = context;
        }

        // GET: api/Tarot
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tarot>>> GetTarot()
        {
            return await _context.Tarot.ToListAsync();
        }

        // GET: api/Tarot/name
        [HttpGet("{name}")]
        public async Task<ActionResult<Object>> GetTarotReading(string name)
        {
            // Generate three random cards for a TarotReading
            List<Tarot> Cards = await _context.Tarot.ToListAsync();
            List<Tarot> Reading = new List<Tarot>();
            Random generator = new Random();
            for (int i=0; i<3; i++)
            {
                Reading.Add(Cards[generator.Next(0, Cards.Count)]);
                Cards.Remove(Reading[i]);
            }

            // Add reading to Log
            Log log = new Log()
            {
                Readings = string.Join(", ",Reading.Select(card => generator.Next(0,100) < 50 ? card.UpMeaning:card.DownMeaning)),
                Name = name,
                Date = DateTime.Now,
                Type = "Tarot",
                Tarots = Reading,
                Teas = null
            };
            _context.Log.Add(log);
            _context.SaveChanges();


            return new
            {
                Readings = log.Readings,
                Date = log.Date,
                Tarots = log.Tarots.Select(card => card.Name)
            };
        }

        // GET: api/Tarot/5
        [HttpGet("{id:int}")]
        public async Task<ActionResult<Tarot>> GetTarot(int id)
        {
            var tarot = await _context.Tarot.FindAsync(id);

            if (tarot == null)
            {
                return NotFound();
            }

            return tarot;
        }

        // GET: api/Tarot/Love/name
        [HttpGet("Love/{name}")]
        public async Task<ActionResult<Log>> GetLove(string name)
        {
            // Generate random card's love reading
            Random generator = new Random();
            List<Tarot> Cards = await _context.Tarot.ToListAsync();

            Tarot Love = (Cards[generator.Next(0, Cards.Count)]);

            if (Love == null)
            {
                return NotFound();
            }

            // Add reading to Log
            Log log = new Log()
            {
                Readings = Love.Love,
                Name = name,
                Date = DateTime.Now,
                Type = "Love",
                Tarots = null,
                Teas = null
            };
            return log;
        }

        // GET: api/Tarot/YesNo/name
        [HttpGet("YesNo/{name}")]
        public async Task<ActionResult<Log>> GetYesNo(string name)
        {
            // Generate three random cards for a TarotReading
            Random generator = new Random();
            List<Tarot> Cards = await _context.Tarot.ToListAsync();

            Tarot YesNo = (Cards[generator.Next(0, Cards.Count)]);

            if (YesNo == null)
            {
                return NotFound();
            }

            // Add reading to Log
            Log log = new Log()
            {
                Readings = YesNo.YesNo,
                Name = name,
                Date = DateTime.Now,
                Type = "YesNo",
                Tarots = null,
                Teas = null
            };
            return log;
        }

        // PUT: api/Tarot/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTarot(int id, Tarot tarot)
        {
            if (id != tarot.ID)
            {
                return BadRequest();
            }

            _context.Entry(tarot).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TarotExists(id))
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

        // POST: api/Tarot
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Tarot>> PostTarot(Tarot tarot)
        {
            _context.Tarot.Add(tarot);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTarot", new { id = tarot.ID }, tarot);
        }

        // DELETE: api/Tarot/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTarot(int id)
        {
            var tarot = await _context.Tarot.FindAsync(id);
            if (tarot == null)
            {
                return NotFound();
            }

            _context.Tarot.Remove(tarot);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TarotExists(int id)
        {
            return _context.Tarot.Any(e => e.ID == id);
        }
    }
}
