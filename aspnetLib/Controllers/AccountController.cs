using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Services;

using datamodel;
using System.Web.Security;

namespace aspnetLib.Controllers
{
    [OutputCacheAttribute(VaryByParam = "*", Duration = 0, NoStore = true)]
    public class AccountController : Controller
    {
        
        public ActionResult Login(string returnUrl)
        {
            ViewBag.returnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(datamodel.Account account, string returnUrl)
        {
            var user = new AccountService().GetAccountByLoginPassword(account.Login, account.Password);
            if(user == null)
            {
                ModelState.AddModelError("", "Некорректное имя или пароль.");
            }
            else
            {
                FormsAuthentication.SetAuthCookie(account.Login, true);
                var t = HttpContext.User.Identity.IsAuthenticated;
                var u = User.Identity.Name;
                return RedirectToAction("Index", "Home");
            }
            return View(account);
        }

        
    }
}