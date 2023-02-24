using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class City
    {
        [Key]
        public int city_id { get; set; }
        public string name { get; set; }
        public string province_id { get; set; }
    }
}
