using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class Pharmacy
    {
        [Key]
        public int pharmacy_id { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string user_id { get; set; }
        public string city_id { get; set; }
        public string is_approved { get; set; }
        public string pharmacy_licence { get; set; }
        public string approved_by { get; set; }
        public string website { get; set; }
        public string operating_hour { get; set; }
        public string owner_id { get; set; }
    }
}
