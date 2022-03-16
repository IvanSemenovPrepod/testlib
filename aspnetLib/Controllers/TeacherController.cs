using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using datamodel;
using Services;

namespace aspnetLib.Controllers
{
    public class TeacherController : Controller
    {
        // GET: Teacher
        public ActionResult Index()
        {
            var teachers = new TeacherService().GetAllTeachers();
            return View(teachers);
        }
    }
}