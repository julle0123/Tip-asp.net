using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationF : System.Web.UI.Page
{

    MemberDao mDao;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnRegistration_Click(object sender, EventArgs e)
    {
        MemberDo mDo = new MemberDo(txtEmail.Text, txtPasswd.Text, txtAddress.Text, txtPhone.Text,
            txtName.Text);

        mDao = new MemberDao();

        mDao.RegisterClientUsingQuery(mDo);
        Response.Redirect("login.aspx");
    }
}