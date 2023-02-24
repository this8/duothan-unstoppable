using Microsoft.AspNetCore.Mvc;
using pill_finder.Models;

namespace pill_finder.Controllers
{
    
    public class LoginController1 : Controller
    {
        private readonly ApplicationDbContext _db;
        [BindProperty]
        public Pharmacy Pharmacy { get; set; }

        public LoginController1(ApplicationDbContext db)
        {
            _db= db;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Register() { 
            Pharmacy = new Pharmacy();
            return View(Pharmacy);

        }
    }
    
}
