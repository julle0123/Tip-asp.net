using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class restore : System.Web.UI.Page
{
    static bool isAuthen = false;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAuthenticateF_Click(object sender, EventArgs e)
    {
        if (txtIdF.Text.Length <= 0)
        {
            lblResultF.Text = "사용자Id를 입력해 주세요.";
            return;
        }
        if (txtNameF.Text.Length <= 0)
        {
            lblResultF.Text = "사용자 이름을 입력해 주세요.";
            return;
        }

        if ((new MemberDao()).AuthenticateRestore(txtIdF.Text, txtNameF.Text))
        {
            isAuthen = true;
            lblResultF.Text = "본인 인증에 성공하였습니다.";
        }
        else
            lblResultF.Text = "본인 인증에 실패하였습니다.";
    }

    protected void btnCancelF_Click(object sender, EventArgs e)
    {
        Response.Redirect("mymainpage.aspx");
    }

    protected void SetRestoreF_Click(object sender, EventArgs e)
    {
        if (!isAuthen)
        {
            lblResultC.Text = "먼저 본인 인증을 실시해 주세요.";
            return;
        }
        if (txtPw1F.Text.Length <= 0)
        {
            lblpassCheckF.Text = "비밀번호를 입력해 주세요";
            return;
        }
        if (txtPw2F.Text.Length <= 0)
        {
            lblpassCheckF.Text = "비밀번호를 입력해 주세요";
            return;
        }

        (new MemberDao()).UpdateGradeF(txtIdC.Text);
        Response.Redirect("login.aspx");
    }

    protected void btnAuthenticate_Click(object sender, EventArgs e)
    {
        if (txtIdC.Text.Length <= 0)
        {
            lblResultC.Text = "사용자Id를 입력해 주세요.";
            return;
        }
        if (txtNameC.Text.Length <= 0)
        {
            lblResultC.Text = "사용자 이름을 입력해 주세요.";
            return;
        }

        if ((new MemberDao()).AuthenticateRestore(txtIdC.Text, txtNameC.Text))
        {
            isAuthen = true;
            lblResultC.Text = "본인 인증에 성공하였습니다.";
        }
        else
            lblResultC.Text = "본인 인증에 실패하였습니다.";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mymainpage.aspx");
    }

    protected void SetRestore_Click(object sender, EventArgs e)
    {
        if (!isAuthen)
        {
            lblResultC.Text = "먼저 본인 인증을 실시해 주세요.";
            return;
        }
        if (txtPw1C.Text.Length <= 0)
        {
            lblpassCheckC.Text = "비밀번호를 입력해 주세요";
            return;
        }
        if (txtPw2C.Text.Length <= 0)
        {
            lblpassCheckC.Text = "비밀번호를 입력해 주세요";
            return;
        }

        (new MemberDao()).UpdateGradeC(txtIdC.Text);
        Response.Redirect("login.aspx");
    }
}