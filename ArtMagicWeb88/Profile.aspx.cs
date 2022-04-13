using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMagicWeb88
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
           "alert('Session Expired, please login again to proceed'); window.location='" +
           Request.ApplicationPath + "LoginPage.aspx';", true);
            }
            else
            {
                //lblUsername.Text = Session["Username"].ToString();
                //if (Session["Role"].ToString() != "Artist")
                //{
                //    myArtBtn.Visible = false;
                //}
                //else
                //{
                //    myArtBtn.Visible = true;
                //}
            }
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('Logout successfully'); window.location='" +
            Request.ApplicationPath + "LoginPage.aspx';", true);
        }
    }
}
