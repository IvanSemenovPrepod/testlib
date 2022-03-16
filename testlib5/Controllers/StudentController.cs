using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using datamodel;

namespace testlib5.Controllers
{
    public class StudentController : Controller
    {
        Entities db = new Entities();
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult Autocomplete(string term)
        {
            var content = new StudentService().GetStudent(term);
            return Json(new { 
                id = content.Keys, 
                data = content.Values 
            }, JsonRequestBehavior.AllowGet
            );
        }
    }
}