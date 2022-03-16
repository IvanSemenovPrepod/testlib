using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace testlib5.Controllers
{
    public class LendingBookController : Controller
    {
        // GET: LendingBook
        public ActionResult Index()
        {
            return View();
        }

        // GET: LendingBook/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: LendingBook/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LendingBook/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: LendingBook/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LendingBook/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: LendingBook/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: LendingBook/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
