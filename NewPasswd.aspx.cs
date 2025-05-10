using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewPasswd : System.Web.UI.Page
{
    static bool isAuthen = false;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAuthenticate_Click(object sender, EventArgs e)
    {
        if (txtId.Text.Length <= 0)
        {
            lblResult.Text = "사용자Id를 입력해 주세요.";
            return;
        }
        if (txtName.Text.Length <= 0)
        {
            lblResult.Text = "사용자 이름을 입력해 주세요.";
            return;
        }
        //본인 인증과정
        //사용자 ID를 가져와서 결과에 따라 조치를 취함 --> 익명 객체 활용
        if ((new MemberDao()).AuthenticateToSetNewPasswd(txtId.Text, txtName.Text))
        {
            isAuthen = true;
            lblResult.Text = "본인 인증에 성공하였습니다.";
        }
        else
            lblResult.Text = "본인 인증에 실패하였습니다.";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mymainpage.aspx");
    }

    protected void SetPasswd_Click(object sender, EventArgs e)
    {
        if (!isAuthen)
        {
            lblResult.Text = "먼저 본인 인증을 실시해 주세요.";
            return;
        }
        //사용자 비밀번호 변경
        (new MemberDao()).SetNewPasswd(txtId.Text, txtPw1.Text);
        Response.Redirect("login.aspx");
    }
}
