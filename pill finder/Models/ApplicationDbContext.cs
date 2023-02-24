using Microsoft.EntityFrameworkCore;

namespace pill_finder.Models
{
    public class ApplicationDbContext : Microsoft.EntityFrameworkCore.DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Pharmacy> Pharmacy { get; set; }
    }
}
