using HQKTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class Guest_ManagerController : Controller
    {

        // GET: HKQadmin/Guest_Manager
        dbTravelTourDataContext data = new dbTravelTourDataContext();
        public ActionResult Index(int? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 5;
            return View(data.Guest_with_Accounts/*.Where(p=>p.Status != 0)*/.ToList().ToPagedList(pagenumber,pagesize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
       
    }
}