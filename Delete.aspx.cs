using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    static bool isAuthen = false;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SetDelete_Click(object sender, EventArgs e)
    {
        if ((new MemberDao()).AuthenticateEmail(txtId.Text))
        {
            isAuthen = true;
            
        }
        else
            lblResult.Text = "이메일이 틀렸습니다.";

        (new MemberDao()).UpdateGrade(txtId.Text);
        Session["email"] = null;
        Response.Redirect("login.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mymainpage.aspx");
    }
}