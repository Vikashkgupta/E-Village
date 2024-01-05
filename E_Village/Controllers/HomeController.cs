using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Village.Models;

namespace E_Village.Controllers
{
    public class HomeController : Controller
    {
        E_VillageEntities db = new E_VillageEntities();
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Table_Contact con)
        {
            try
            {
                con.Contact_Date = DateTime.Now.ToString();

                db.Table_Contact.Add(con);
                db.SaveChanges();
                Response.Write("<script>alert('Congratulations ! We will contact you in 24 hours. ')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong ! Please fill the form again carefully. ')</script>");
            }
            return View();
        }
        public ActionResult About_Village()
        {
            return View();
        }
        public ActionResult Photo_Gallery()
        {
            return View();
        }
        public ActionResult Registration()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Registration(Table_Registration reg, string hdn1, string ct1)
        {
            try
            {
                if (hdn1 == ct1)
                {
                    HttpPostedFileBase file = Request.Files["Profile_Picture"];
                    reg.Profile_Picture = file.FileName;
                    file.SaveAs(Server.MapPath("~/content/Profile_Pictures/" + file.FileName));


                    reg.Registration_Date = DateTime.Now.ToString();

                    db.Table_Registration.Add(reg);
                    db.SaveChanges();
                    Response.Write("<script>alert('Registration Successful ! '); window.location.href='/home/Public_Login'</script>");
                }

                else
                {
                    Response.Write("<script>alert(' Enter captcha carefully ! ')</script>");

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong ! Please fill the form again carefully. ')</script>");
            }
            return View();
        }
      
        public ActionResult Forget()
        {
            return View();
        }
        public ActionResult Feedback()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Feedback(Table_Feedback fee)
        {
            try
            {
                fee.Feedback_Date = DateTime.Now.ToString();

                db.Table_Feedback.Add(fee);
                db.SaveChanges();
                Response.Write("<script>alert('Thankyou for feedback  ')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong ! Please fill the form again carefully. ')</script>");
            }
            return View();
        }
        public ActionResult Admin_Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Admin_Login(Table_Login lg)
        {
            try
            {
                Table_Login t1 = db.Table_Login.Where(x=>x.Email==lg.Email && x.Password==lg.Password).SingleOrDefault();
                if (t1 != null)
                {
                    Session["aid"]=lg.Email;                //  set of session  

                    Response.Write("<script>alert(' Welcome to Admin Zone  '); window.location.href='/admin/index' </script>");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email ID or Password ! ')</script>");                    
                }
            }
            catch (Exception ex) {
                Response.Write("<script>alert('There are Error in code !  ! ')</script>");
            }

            return View();
        }

        public ActionResult Contact_Us()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Contact_Us(Table_Contact con)
        {
            try
            {
                con.Contact_Date = DateTime.Now.ToString();

                db.Table_Contact.Add(con);
                db.SaveChanges();
                Response.Write("<script>alert('Congratulations ! We will contact you in 24 hours. ');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong ! Please fill the form again carefully. ')</script>");
            }
            return View();
        }

        public ActionResult Public_Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Public_Login(Table_Registration lg)
        {
            try
            {
                Table_Registration t1 = db.Table_Registration.Where(x => x.Email == lg.Email && x.Password == lg.Password).SingleOrDefault();
                if (t1 != null)
                {
                    Session["aid"] = lg.Email;                //  set of session  

                    Response.Write("<script>alert(' Welcome to Your Dashboard  '); window.location.href='/home/User_Dashboard' </script>");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email ID or Password ! ')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('There are Error in code !   ')</script>");
            }

            return View();
        }


        public ActionResult User_Dashboard()
        {
            if (Session["aid"] != null)
            {
                // Retrieve the email of the currently logged-in user
                string userEmail = Session["aid"].ToString();

                // Retrieve the user's data from the database based on the email
                Table_Registration user = db.Table_Registration.SingleOrDefault(u => u.Email == userEmail);

                if (user != null)
                {
                    // Pass the user object to the view
                    return View(user);
                }
                else
                {
                    // Handle the case where the user's data is not found
                    return HttpNotFound();
                }
            }
            else
            {
                Response.Write("<script>alert('Log In first. Then go to User Dashboard . '); window.location.href='/home/Public_login' </script>");
            }
           List<Table_Registration> lst = null;
            lst = db.Table_Registration.ToList();

           return View(lst);
        }

    }
}
