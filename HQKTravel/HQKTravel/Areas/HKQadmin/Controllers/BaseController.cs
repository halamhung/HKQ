using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class BaseController : Controller
    {
        // GET: HKQadmin/Base
        public BaseController()
        {
            if (System.Web.HttpContext.Current.Session["admin"].Equals(""))
            {
                System.Web.HttpContext.Current.Response.Redirect("~/HKQadmin/Dangnhap");
            }
        }

    }
}