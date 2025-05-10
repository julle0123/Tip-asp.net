using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mypage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["email"] == null)
            {
                btnDelete.Text = "복구하기";
            }

            else
            {
                btnDelete.Text = "회원탈퇴";

            }
        }
    }

    protected void btnMydata_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mypageaspx.aspx");
    }

    protected void btnPasswd_Click1(object sender, EventArgs e)
    {
        Response.Redirect("NewPasswd.aspx");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (btnDelete.Text == "회원탈퇴")
        {
            Response.Redirect("Delete.aspx");
        }
        else
        {
            Response.Redirect("restore.aspx");
        }
    }
}
