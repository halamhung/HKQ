using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HQKTravel.Models;

namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class AuthController : Controller
    {
        dbTravelTourDataContext data = new dbTravelTourDataContext();
        // GET: HKQadmin/Auth
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string taikhoan , string matkhau)
        {
            string erro = null;
            admin ad = data.admins.Where(p=>p.user_admin == taikhoan && p.pass_word == matkhau).FirstOrDefault();
            if(ad == null)
            {
                erro = "sai bét rồi bạn ơi!";
            }
            else
            {
                Session["fullName"] = ad.fullName;
                Session["user_admin"] = taikhoan;
                Session["id_admin"] = ad.id_admin;
            return RedirectToAction("Index","DashBoard");
            }
            ViewBag.Error = erro;

            return View();
        }

        [HttpGet]        
        public ActionResult Logout()
        {
            Session["user_admin"] = null;
            Session["id_admin"] = null;
            return Redirect("~/HKQadmin/Login");
        }

    }
}