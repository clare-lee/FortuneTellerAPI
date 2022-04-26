using System;
namespace FortuneTellerAPI.Models
{
	public class Response<T>
	{
		public int statusCode
		{
			get;
			set;
		}

		public string statusDescription
        {
			get;
			set;
        }
		public T items
		{
			get;
			set;
		}

	}
}

