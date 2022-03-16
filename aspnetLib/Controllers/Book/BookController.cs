using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using datamodel;
using Services;

namespace aspnetLib.Controllers.Book
{
    [Authorize]
    public class BookController : Controller
    {

        // GET: Book
        public ActionResult Index()
        {
            var books = new BookService().GetAllBooks();
            return View(books);
        }

        public ActionResult Add()
        {
            return View();
        }
        
        public ActionResult Delete(int id)
        {
            datamodel.Book book = new BookService().GetById(id);
            if (book != null)
                return PartialView(book);
            return HttpNotFound();
        }
        [HttpPost]
        public void DeleteBook(int id)
        {
            int t = 0;
            //удалить книгу из бд
        }
        public JsonResult Autocomplete(string term)
        {
            var books = new BookService().GetBooks(term);
            return Json(
                new
                {
                    books = books
                }, JsonRequestBehavior.AllowGet);
        }
    }
}