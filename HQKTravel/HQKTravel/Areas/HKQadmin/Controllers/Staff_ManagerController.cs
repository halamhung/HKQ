﻿using HQKTravel.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HQKTravel.Areas.HKQadmin.Controllers
{
    public class Staff_ManagerController : Controller
    {
        // GET: HKQadmin/Staff_Manager
        dbTravelTourDataContext data = new dbTravelTourDataContext();
        public ActionResult Index(int? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 5;
            return View(data.Staffs/*.Where(p=>p.Status != 0)*/.ToList().ToPagedList(pagenumber, pagesize));
        }
    }
}