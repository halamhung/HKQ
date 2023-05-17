using HQKTravel.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class HistoryBill_ManagerController : BaseController
    {
        // GET: HKQadmin/HistoryBill_Manager
        dbTravelTourDataContext data = new dbTravelTourDataContext();
        public ActionResult Index(int? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 5;
            return View(data.HISTORY_BILLs/*.Where(p=>p.Status != 0)*/.ToList().ToPagedList(pagenumber, pagesize));
        }
    }
}