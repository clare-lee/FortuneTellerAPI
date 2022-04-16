using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;
using FortuneTellerAPI.Models;

namespace FortuneTellerAPI.Models
{
	public class FortuneTellerAPIDBContext : DbContext
	{
		protected readonly IConfiguration Configuration;

		public FortuneTellerAPIDBContext(DbContextOptions<FortuneTellerAPIDBContext> options, IConfiguration configuration)
			: base(options)
        {
			Configuration = configuration;
        }

		protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
			var connectionString = Configuration.GetConnectionString("Fortunes");
			options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
        }

		public DbSet<Tarot> Tarot { get; set; } = null!;
		public DbSet<Tea> Tea { get; set; } = null!;
		public DbSet<Log> Log { get; set; } = null!;
	}

}

