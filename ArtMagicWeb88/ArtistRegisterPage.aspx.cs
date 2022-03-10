using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ArtMagicWeb88
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);

            String query = "INSERT INTO ArtistAccount (Artist_username, Artist_email, Artist_password, Artist_confirmPassword, Artist_gender, Artist_phone, Artist_Address) " +
                "VALUES (@ArtRegUsername,@ArtRegPassword,@ArtRegConfirmPassword, @ArtRegGender, @ArtRegPhone, @ArtRegAddress)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ArtRegUsername", regArtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtRegEmail", regArtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtRegPassword", regArtPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtRegConfirmPassword", regArtComPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtRegGender", artGender.SelectedValue);
            cmd.Parameters.AddWithValue("@ArtRegPhone", regArtphone.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtRegAddress", regArtAddress.Text.Trim());
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("ArtistLoginPage.aspx");
        }

        //protected void loginBtn_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con;
        //    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //    con = new SqlConnection(strCon);
        //    con.Open();
        //    String query = "SELECT * FROM ArtistAccount WHERE Artist_username=@regEmail AND Artist_password=@regPassword";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@regEmail", email.Text.Trim());
        //    cmd.Parameters.AddWithValue("@regPassword", password.Text.Trim());
        //    SqlDataReader dtrInfo1 = cmd.ExecuteReader();
        //    if (dtrInfo1.Read())
        //    {
        //        int artID = dtrInfo1.GetInt32(dtrInfo1.GetOrdinal("Artist_id"));
        //        String artName = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_username"));
        //        String artGender = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_gender"));
        //        String artPhone = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_phone"));
        //        String address = dtrInfo1.GetString(dtrInfo1.GetOrdinal("Artist_Address"));

        //        Session["Artist_id"] = artID.ToString();
        //        Session["Artist_username"] = artName.ToString();
        //        Session["Artist_password"] = password.Text.Trim();
        //        Session["Artist_gender"] = artGender.ToString();
        //        Session["Artist_phone"] = artPhone.ToString();
        //        Session["Artist_Address"] = address.ToString();
        //        Response.Redirect("HomePage.aspx");
        //    }
        //    else
        //    {
        //        Label1.Text = "Account or Password Error";
        //        Label1.ForeColor = System.Drawing.Color.Red;
        //    }
        //    con.Close();
        //}



    }
}