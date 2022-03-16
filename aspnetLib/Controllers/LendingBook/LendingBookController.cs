using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspnetLib.Controllers.LendingBook
{
    [Authorize]
    public class LendingBookController : Controller
    {

        // GET: LendingBook
        public ActionResult Index()
        {
            return View();
        }
    }
}