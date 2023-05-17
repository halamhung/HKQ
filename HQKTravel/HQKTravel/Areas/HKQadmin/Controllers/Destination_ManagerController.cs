using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HQKTravel.Models;
using PagedList;
namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class Destination_ManagerController : Controller
    {
        // GET: HKQadmin/Destination_Manager
        dbTravelTourDataContext data = new dbTravelTourDataContext(); 
        public ActionResult Index(int? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 5;
            return View(data.Destinations.Where(p=>p.Status != 0).ToList().ToPagedList(pagenumber,pagesize));
        }
    }
}