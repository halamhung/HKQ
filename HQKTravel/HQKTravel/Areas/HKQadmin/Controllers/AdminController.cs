using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class AdminController : BaseController
    {
        // GET: HKQadmin/Admin
        public ActionResult Index()
        {
            return View();
        }
    }
}