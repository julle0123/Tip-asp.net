using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Community : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnBbs_Click(object sender, EventArgs e)
    {
        Response.Redirect("Communitylist.aspx");
    }

    protected void btnQnA_Click(object sender, EventArgs e)
    {
        Response.Redirect("QnAlist.aspx");
    }

    protected void btnNotice_Click(object sender, EventArgs e)
    {
        Response.Redirect("Noticelist.aspx");
    }
}
