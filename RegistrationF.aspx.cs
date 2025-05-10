using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationF : System.Web.UI.Page
{
    //이메일 중복 검사 변수
    //static bool isIdDuChecked = false;

    MemberDao mDao;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //회원가입 동작시 Dao로 회원가입 저장하기
    protected void BtnRegistration_Click(object sender, EventArgs e)
    {
        /*
        if(!IsPostBack)
        {
            //라벨이름.Text = "ID 중복검사를 먼저 실행 해주세요";
            //return;
        }
        */

        MemberDo mDo = new MemberDo(txtEmail.Text, txtPasswd.Text, txtAddress.Text, txtPhone.Text,
            txtName.Text, txtCareer.Text, txtPart.Text);

        mDao = new MemberDao();

        mDao.RegisterFreeUsingQuery(mDo);
        Response.Redirect("login.aspx");
    }
}