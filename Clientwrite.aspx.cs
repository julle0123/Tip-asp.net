using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientWrite : System.Web.UI.Page
{
    int no;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["email"] == null) Response.Redirect("login.aspx");

            if ((new MemberDao()).GetUgradeOfGradeid(Session["email"].ToString()) < (new MemberDao().GetUgradeOfGradename("고객"))) Response.Redirect("Clientlist.aspx");

            //txtId.Text = Session["email"].ToString();
            switch (int.Parse(Request["md"]))
            {
                case 0:
                case 2:
                    txtId.Text = Session["email"].ToString();
                    break;

                case 1:
                    ProjectCDo bDo = (new ProjectCDao()).GetBoardDetails(int.Parse(Request["no"]));

                    if (Session["email"].ToString() != bDo.Author)
                        return;
                    txtId.Text = bDo.Author;
                    txtTitle.Text = bDo.Title;
                    txtContents.Text = bDo.Contents;

                    break;
            }
        }

       

        Response.Write(txtContents.Text.Replace("\r\n", "<br>"));
    }

    private string GetFileName(string path)
    {
        return path.Substring(path.LastIndexOf(@"\") + 1);
    }

    protected void txtId_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnWirte_Click(object sender, EventArgs e)
    {
        string fname = "";

        if (FileUpload1.HasFile) fname = this.GetFileName(FileUpload1.FileName);

        ProjectCDo mDo = new ProjectCDo(txtTitle.Text, txtContents.Text, txtId.Text, Session["email"].ToString(), fname);

        switch (int.Parse(Request["md"]))
        {
            case 0:
                no = (new ProjectCDao()).NewBoardArticle(mDo);
                break;
            case 1:
                no = int.Parse(Request["no"]);
                (new ProjectCDao()).UpdateArticle(mDo, no);
                break;
        }

        if (fname != "")
        {
            string uFname = "cnotice_" + no.ToString() + fname.Substring(fname.IndexOf("."));
            FileUpload1.SaveAs(Server.MapPath(@"Cnotice\" + uFname));
        }
        Response.Redirect("Clientlist.aspx");
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clientlist.aspx");
    }

    protected void txtContents_TextChanged(object sender, EventArgs e)
    {

    }
}