using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMagicWeb88
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        public string PageTitle { get; set; } = "Default PageTitle of Global Super Company";
        

        protected void Page_Load(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();

        }
    }
}