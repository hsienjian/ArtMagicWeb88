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
    public partial class CustomerLoginPage : System.Web.UI.Page
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

            String query = "SELECT * FROM CustomerAccount WHERE Cus_email=@logEmail AND Cus_password=@logPassword";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@logEmail", email.Text.Trim());
            cmd.Parameters.AddWithValue("@logPassword", password.Text.Trim());
            SqlDataReader dtrInfo1 = cmd.ExecuteReader();
            if (dtrInfo1.HasRows)
            {
                while (dtrInfo1.Read())
                {
                    Session["Cus_id"] = dtrInfo1["Cus_id"].ToString();
                    Response.Redirect("~/ViewArts.aspx");
                }
            }

            
            con.Close();
        }
    }
}