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
            ////tạo ra 1 hàm constructer bắt mọi trang admin đều phải đăng nhập
            //if (System.Web.HttpContext.Current.Session["user_admin"].Equals(""))
            //{
            //    //return Redirect("~/HKQadmin/Login"); Lớp này không thể trả về bằng cách này 
            //    System.Web.HttpContext.Current.Response.Redirect("~/HKQadmin/Login");
            //}
        }

    }
}