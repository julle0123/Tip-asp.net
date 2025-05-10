using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mypageaspx : System.Web.UI.Page
{
    static string email;
    static MemberDo mDo;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["email"] != null)
        {

            mDo = (new MemberDao()).GetData(Session["email"].ToString());
            txtEmail.Text = mDo.Email;
            txtPass.Text = mDo.Passwd;
            txtaddress.Text = mDo.Address;
            txtphone.Text = mDo.Phone;
            txtname.Text = mDo.Name;
            txtCareer.Text = mDo.Career;
            txtPart.Text = mDo.Part;
        }

    }
}