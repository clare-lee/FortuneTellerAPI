using System;
namespace FortuneTellerAPI.Models
{
	public class Log
	{
		public int ID { get; set; } = 0;
		public string Readings { get; set; } = string.Empty;
		public string Name { get; set; } = string.Empty;
		public DateTime Date { get; set; } = DateTime.Now;
		public string LuckyNumbers { get; set; } = string.Empty;
		public string Type { get; set; } = string.Empty;

		public List<Tarot> Tarots { get; set; } = new List<Tarot>();
		public List<Tea> Teas { get; set; } = new List<Tea>();

	}

}

