using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            if (Request.Url != null)
            {
                Session["returnUrl"] = Request.UrlReferrer.ToString();
            }
        }
        
    }

    //로그인 동작시 Dao로 로그인 불러오기
    protected void btnLoginF_Click(object sender, EventArgs e)
    {
        MemberDao mDao = new MemberDao();
        if (mDao.AuthenticateF(txtEmailF.Text, txtPasswdF.Text))
        {
            Session["email"] = txtEmailF.Text;

            Response.Redirect("MainPage.aspx");
        }
        else
        {
            //라벨이름.Text = "이메일 혹은 암호를 확인해주세요..."
        }
    }

    protected void btnLoginC_Click(object sender, EventArgs e)
    {
        
        MemberDao mDao = new MemberDao();
        if (mDao.AuthenticateC(txtEmailC.Text, txtPasswdC.Text))
        {
            Session["email"] = txtEmailC.Text;

            Response.Redirect("MainPage.aspx");
        }
        else
        {
            //라벨이름.Text = "이메일 혹은 암호를 확인해주세요..."
        }
        

    }
}