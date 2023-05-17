using System.Web.Mvc;

namespace HQKTravel.Areas.HKQadmin
{
    public class HKQadminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "HKQadmin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
               "HKQadmin_Dangnhap",
               "HKQadmin/Dangnhap",
               new { Controller ="Auth", action = "Login", id = UrlParameter.Optional }
           );

            context.MapRoute(
                "HKQadmin_default",
                "HKQadmin/{controller}/{action}/{id}",
                new { Controller="Dashboard", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}