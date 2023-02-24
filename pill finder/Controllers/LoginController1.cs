using Microsoft.AspNetCore.Mvc;

namespace pill_finder.Controllers
{
    public class LoginController1 : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
