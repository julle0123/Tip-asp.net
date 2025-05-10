using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Session["path"].ToString();
        string fname = Session["fname"].ToString();

        string serverFname = Server.MapPath(path);

        try
        {
            Response.Clear();
            Response.AddHeader("Content-Disposition", "filename = " + Server.UrlEncode(fname));

            Response.ContentType = "multipart/form-data";
            Response.WriteFile(serverFname);
            Response.End();
        }
        catch
        {

        }
    }
}