using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class DashboardController : BaseController
    {
        // GET: HKQadmin/Admin
        public ActionResult Index()
        {
            if (string.IsNullOrEmpty(Session["user_admin"].ToString()))
            {
                return Redirect("~/HKQadmin/Login");
            }
            return View();
        }
    }
}