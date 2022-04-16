using System;
namespace FortuneTellerAPI.Models
{
	public class Tarot
	{
		public int ID { get; set; } = 0;
		public string Name { get; set; } = string.Empty;
		public string UpMeaning { get; set; } = string.Empty;
		public string DownMeaning { get; set; } = string.Empty;
		public string Love { get; set; } = string.Empty;
		public string YesNo { get; set; } = string.Empty;

		public List<Log> Logs { get; set; } = new List<Log>();
	}
}
