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
    public class LuckController : ControllerBase
    {

        // GET: api/Luck
        [HttpGet]
        public ActionResult<Response<string>> GetLuck()
        {
            return new Response<string>()
            {
                items = "Please use one of the Luck tasks: Magic8Ball, MagicH8Ball, Lucky, CoinFlip, Pick(Needs the use of Postman)",
                statusCode = 200,
                statusDescription = "Success"
            };
        }

        // GET: api/Luck/Magic8Ball
        [HttpGet("Magic8Ball/")]
        public ActionResult<Response<string>> GetMagic8Ball()
        {
            string[] answers = new string[]
            {
                "It is certain",
                "As I see it, yes",
                "Reply hazy, try again",
                "Don't count on it",
                "It is decidedly so",
                "Most likely",
                "Ask again later",
                "My reply is no",
                "Without a doubt",
                "Outlook good",
                "Better not tell you now",
                "My sources say no",
                "Yes definitely",
                "Yes",
                "Cannot predict now",
                "Outlook not so good",
                "You may rely on it",
                "Signs point to yes",
                "Concentrate and ask again",
                "Very Doubtful"
            };
            Random generator = new Random();
            return new Response<string>()
            {
                items = answers[generator.Next() % answers.Length],
                statusCode = 200,
                statusDescription = "Success"
            };
        }

        // GET: api/Luck/Magic8Ball
        [HttpGet("MagicH8Ball/")]
        public ActionResult<Response<string>> GetMagicH8Ball()
        {
            string[] answers = new string[]
            {
                "If you look up gullible in the dictionary, you'll find a picture of you.",
                "Yeah, well at least my dictionary doesn't have pictures, you fucking idiot.",
                "If your eyes were any further apart, you'd be an herbivore.",
                "Your portraits are so ugly they hang themselves.",
                "You reprehensible spamfaced toolbag.",
                "Oh you~",
                "You're not pretty enough to be this stupid.",
                "Somewhere out there there's a tree working very hard to produce oxygen so that you can breathe. I think you should go and apologise to it.",
                "I've seen salad that can dress better than you.",
                "I bite my thumb at you sir.",
                "You cheap, lying, no-good, rotten, four-flushing, low-life, snake-licking, dirt-eating, inbred, overstuffed, ignorant, blood-sucking, dog-kissing, brainless, dickless, hopeless, heartless, fat-ass, bug-eyed, stiff-legged, spotty-lipped, worm-headed sack of monkey shit.",
                "You're impossible to underestimate.",
                "Bless your heart",
                "So you're, like, really pretty.",
                "Oh my God, I love your bracelet. Where did you get it?",
                "You're kinda like Rapunzel except instead of letting down your hair you let down everyone in your life.",
                "I know a mind reader who would charge you half price.",
                "I hope you go far. The sooner, the better.",
                "I would call you a tool, but that implies that you're useful for something.",
                "I can explain it to you, but I can't understand it for you.",
                "You're not the dumbest person in the world but you'd better hope they don't die.",
                "You need lemons to make lemonade and you ain't got no lemons.",
                "I bet your parents change the subject when people ask about you.",
                "You're tacky and I hate you.",
                "I fart in your general direction."
            };
            Random generator = new Random();
            return new Response<string>()
            {
                items = answers[generator.Next() % answers.Length],
                statusCode = 200,
                statusDescription = "Success"
            };
            
        }

        // GET: api/Luck/Lucky
        [HttpGet("Lucky/")]
        public ActionResult<Response<string>> GetLucky()
        {
            // five numbers from 1-70 and 1 number from 1-25
            Random generator = new Random();
            List<int> Lucky = new List<int>();
            for (int i = 0; i < 5; i++)
            {
                Lucky.Add(generator.Next(1, 71));
            }
            Lucky.Add(generator.Next(1, 26));

            return new Response<string>()
            {
                items = string.Join(", ", Lucky),
                statusCode = 200,
                statusDescription = "Success"
            };
        }

        // GET: api/Luck/CoinFlip
        [HttpGet("CoinFlip/")]
        public ActionResult<Response<string>> GetCoinFlip()
        {
            string[] Coin = new string[]
            {
                "Heads!",
                "Tails!"
            };

            Random generator = new Random();
            return new Response<string>()
            {
                items = Coin[generator.Next() % Coin.Length],
                statusCode = 200,
                statusDescription = "Success"
            };
        }

        // POST: api/Luck/Pick
        [HttpPost("Pick/")]
        public ActionResult<Response<string>> PostPick(string[] answers )
        {

            Random generator = new Random();
            return new Response<string>()
            {
                items = answers[generator.Next() % answers.Length],
                statusCode = 200,
                statusDescription = "Success"
            };
        }
    }
}
