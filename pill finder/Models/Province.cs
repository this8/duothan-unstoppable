using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class Province
    {
        [Key]
        public int province_id { get; set; }
        public string name { get; set; }

    }
}
