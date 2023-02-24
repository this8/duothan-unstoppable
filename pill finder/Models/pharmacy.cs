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
        public int city_id { get; set; }
        public bool is_approved { get; set; }
        public string pharmacy_licence { get; set; }
        public int approved_by { get; set; }
        public string website { get; set; }
        public string operating_hour { get; set; }
        public int owner_id { get; set; }
    }
}
