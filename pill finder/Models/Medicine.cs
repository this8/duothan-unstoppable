using System.ComponentModel.DataAnnotations;

namespace pill_finder.Models
{
    public class Medicine
    {
        [Key]
        public int medicine_id { get; set; }
        public int name { get; set; }
        public int dosage { get; set; }
        public int manufacturer { get; set; }
        public int supplier { get; set; }
        public int NDC { get; set; }
        public int expiration_date { get; set; }
        public int unit_price { get; set; }
    }
}
