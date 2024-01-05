using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Village.Models;

namespace E_Village.Controllers
{
    public class AdminController : Controller
    {

        E_VillageEntities db = new E_VillageEntities();

        //
        // GET: /Admin/

        public ActionResult Index()
        {
            if (Session["aid"] != null)
            {

            }
            else
            {
                Response.Write("<script>alert('Log In first. Then go to next zone . '); window.location.href='/home/admin_login' </script>");
            }
            return View();
        }
        public ActionResult RegistrationMGMT()
        {
            if (Session["aid"] != null)
            {

            }
            else
            {
                Response.Write("<script>alert('Log In first. Then go to next zone . '); window.location.href='/home/admin_login' </script>");
            }

            List<Table_Registration> rege = null;
            rege = db.Table_Registration.ToList();

            return View(rege);
        }
        public ActionResult ContactMGMT()
        {
            if (Session["aid"] != null)
            {

            }
            else
            {
                Response.Write("<script>alert('Log In first. Then go to next zone . '); window.location.href='/home/admin_login' </script>");
            }

            List<Table_Contact> lst = null;
            lst = db.Table_Contact.ToList();

            return View(lst);
        }

        public ActionResult FeedbackMGMT()
        {
            if (Session["aid"] != null)
            {

            }
            else
            {
                Response.Write("<script>alert('Log In first. Then go to next zone . '); window.location.href='/home/admin_login' </script>");
            }

            List<Table_Feedback> lst = null;
            lst = db.Table_Feedback.ToList();

            return View(lst);
        }

        public ActionResult ChangePassword()
        {
            if (Session["aid"] != null)
            {

            }
            else
            {
                Response.Write("<script>alert('Log In first. Then go to next zone . '); window.location.href='/home/admin_login' </script>");
            }

            return View();
        }

       [HttpPost]

        public ActionResult ChangePassword(string Old_Password, string New_Password, string Confirm_Password)
        {

            if (New_Password == Confirm_Password && New_Password != Old_Password)
            { 
                string Email = Session["aid"].ToString();

                Table_Login lg = db.Table_Login.Where(d => d.Password == Old_Password && d.Email == d.Email).SingleOrDefault();
                lg.Password = New_Password;
                db.SaveChanges();
                Response.Write("<script>alert('Your password changed '); window.location.href='/home/Admin_login' </script>");
            }
          
           else
            {
                Response.Write("<script>alert('Please enter valid password '); </script>");            
            }
            return View();
        }
      

        public void Logout()
        {
          
            Session.Abandon();
            Response.Write("<script>alert('Log Out'); window.location.href='/home/Admin_login' </script>");
        }

        public void Delete()
        {
            try
            {
                string m = Request.QueryString["m"];
                Table_Registration tbl = db.Table_Registration.SingleOrDefault(x => x.Email == m);
                db.Table_Registration.Remove(tbl);
                db.SaveChanges();
                Response.Write("<script>alert(' Record Successfully deleted '); window.location.href='/admin/RegistrationMGMT' </script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong ! '); window.location.href='/admin/RegistrationMGMT' </script>");            
            
            }

        }
        [HttpGet]
        public ActionResult UpdateRecord()
        {
            string aid = Request.QueryString["U"];
            Table_Registration reg = db.Table_Registration.SingleOrDefault(a => a.Email == aid);
            return View(reg);
        }

        [HttpPost]
        public void UpdateRecord(Table_Registration reg, string Email)
        {
            Table_Registration rg = db.Table_Registration.SingleOrDefault(a => a.Email == Email);
            try
            {
                HttpPostedFileBase file = Request.Files["Profile_Picture"];
                if (file.FileName != "")
                {
                    rg.Name = reg.Name;
                    rg.Mobile = reg.Mobile;
                    rg.Profile_Picture = file.FileName;
                    rg.DOB = reg.DOB;
                    rg.Password = reg.Password;
                    rg.Address = reg.Address;
                    rg.Father_Name = reg.Father_Name;
                    rg.Registration_Date = DateTime.Now.ToString();
                    rg.Confirm_Password = reg.Confirm_Password;

                    db.SaveChanges();
                    file.SaveAs(Server.MapPath("~/content/Profile_Pictures/" + file.FileName));
                    Response.Write("<script>alert('Record Updated Successfully ! ');  window.location.href='/admin/RegistrationMGMT' </script>");

                }
                else
                {
                    Table_Registration dd = db.Table_Registration.SingleOrDefault(x => x.Email == Email);

                    dd.Name = reg.Name;
                    dd.Mobile = reg.Mobile;
                //    rg.Profile_Picture = file.FileName;
                    dd.DOB = reg.DOB;
                    dd.Password = reg.Password;
                    dd.Address = reg.Address;
                    dd.Father_Name = reg.Father_Name;
                    dd.Registration_Date = DateTime.Now.ToString();
                    dd.Confirm_Password = reg.Confirm_Password;

                    db.SaveChanges();
                //    file.SaveAs(Server.MapPath("~/content/Profile_Pictures/" + file.FileName));
                    Response.Write("<script>alert('Record Updated Successfully ! ');  window.location.href='/admin/RegistrationMGMT' </script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Record Not Updated ! ');  </script>");            
            
            }
        }

    }
}
