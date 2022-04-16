using System;
namespace FortuneTellerAPI.Models
{
	public class Tea
	{
		public int ID { get; set; } = 0;
		public string Name { get; set; } = String.Empty;
		public string Description { get; set; } = String.Empty;

		public List<Log> Logs { get; set; } = new List<Log>();

	}

}
