using System;
namespace FortuneTellerAPI.Models
{
	public class Response<T> where T : class 
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
		public T? items
		{
			get;
			set;
		}

		public Response()
        {
			statusCode = 0;
			statusDescription = String.Empty;
			items = default;
        }
	}
}

