using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ArtMagicWeb88
{
    public partial class testing1234 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM test", con))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
                    }
                }
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
            }
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = "INSERT INTO test VALUES(@Name,@Description,@Price,@ImgName,@ContentType,@Data)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@Price", decimal.Parse(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@ImgName", Path.GetFileName(FileUpload1.PostedFile.FileName));
                    cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                    cmd.Parameters.AddWithValue("@Data", bytes);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}