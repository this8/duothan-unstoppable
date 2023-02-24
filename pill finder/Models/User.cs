using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class User
    {
        [Key]
        public int user_id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string NIC { get; set; }
        public string password { get; set; }
    }
}
