using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class Pharmacy_owner
    {
        [Key]
        public int pharmacy_owner_id { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string nic { get; set; }
    }
}
