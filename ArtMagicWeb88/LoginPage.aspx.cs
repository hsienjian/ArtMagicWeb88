using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ArtMagicWeb88
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=ArtMagicWeb; Integrated Security=Ture;");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from User where email='" + email.Text + "' and password='" + password.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count == 1)
            {
                Label1.Text = "Login Successful!!!";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label1.Text = "Login Unsuccessful!!!";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}