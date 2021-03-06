using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace ArtMagicWeb88
{
    public partial class ArtLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            String query = "SELECT * FROM ArtistAccount WHERE Artist_username=@regEmail AND Artist_password=@regPassword";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@regEmail", email.Text.Trim());
            cmd.Parameters.AddWithValue("@regPassword", password.Text.Trim());
            SqlDataReader dtrInfo1 = cmd.ExecuteReader();
            if (dtrInfo1.Read())
            {
                int artID = dtrInfo1.GetInt32(dtrInfo1.GetOrdinal("Artist_id"));
                String artName = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_username"));
                String artGender = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_gender"));
                String artPhone = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_phone"));
                String address = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_Address"));

                Session["Artist_id"] = artID.ToString();
                Session["Artist_username"] = artName.ToString();
                Session["Artist_password"] = password.Text.Trim();
                Session["Artist_gender"] = artGender.ToString();
                Session["Artist_phone"] = artPhone.ToString();
                Session["Artist_Address"] = address.ToString();
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                login.Text = "Account or Password Error";
                login.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
        }
    }
}