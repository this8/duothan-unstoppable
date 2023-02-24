using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class Medicine
    {
        [Key]
        public int medicine_id { get; set; }
        public String name { get; set; }
        public String dosage { get; set; }
        public string manufacturer { get; set; }
        public String supplier { get; set; }
        public String NDC { get; set; }
        public string expiration_date { get; set; }
        public int unit_price { get; set; }
    }
}
