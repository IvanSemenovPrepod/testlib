using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using datamodel;
using Services;

namespace aspnetLib.Controllers.Student
{
    [Authorize]
    public class StudentController : Controller
    {
        Services.StudentService service = new StudentService();
        Entities db = new Entities();
        // GET: Student
        public ActionResult Index()
        {

            return View();
        }
        public JsonResult Autocomplete(string term)
        {
            var student = service.GetStudent(term);
            return Json(
                new
                {
                    student = student
                }, JsonRequestBehavior.AllowGet);
        }
    }
}