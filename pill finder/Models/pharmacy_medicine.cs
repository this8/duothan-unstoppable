using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class Pharmacy_medicine
    {
        [Key]
        public int pharmacy_id { get; set; }
        public string medicine_id { get; set; }
        public string quantity { get; set; }
    }
}
