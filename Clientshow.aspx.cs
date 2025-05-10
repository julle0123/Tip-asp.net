using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Clientshow : System.Web.UI.Page
{
    static int no;
    static ProjectCDo mDo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            no = int.Parse(Request["no"].ToString());

            mDo = (new ProjectCDao()).GetBoardDetails(no);

            lblName.Text = mDo.Name;
            lblContents.Text = mDo.Contents;
            if (mDo.Filename.Length > 0)
            {
                lblFname.Text = mDo.Filename;

                hyperDownload.Visible = true;

                Session["path"] = "Cnotice\\cnotice_" + no.ToString() + mDo.Filename.Substring(mDo.Filename.IndexOf("."));
                Session["fname"] = mDo.Filename;
            }
            lblHits.Text = mDo.Hits.ToString();
            lblTitle.Text = mDo.Title;
            lblUploadDate.Text = mDo.Uploadtime;
        }
    }
    private void DisplyReply(int iPage)
    {
        grvClientProReply.DataSource = mDo.ClientProReply;
        grvClientProReply.PageIndex = iPage;
        grvClientProReply.DataBind();
    }
    private void DisplayReply()
    {
        grvClientProReply.DataSource = (new ProjectCDao()).GetClientProReplyList(no);
        grvClientProReply.PageIndex = 0;
        grvClientProReply.DataBind();
    }
    protected void grvClientProReply_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DisplyReply(e.NewPageIndex);
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clientlist.aspx");
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clientwrite.aspx?md=1&no=" + no);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            lblMessage.Text = "본인이 작성한 글만 삭제할 수 있습니다.";
            return;
        }

        if ((Session["email"].ToString() == mDo.Author) || ((new MemberDao()).CheckAuth(Session["email"].ToString(), (new MemberDao()).GetUgradeOfGradename("고객"))))
        {
            if (Session["path"] != null)
            {
                string path = Request.PhysicalApplicationPath + "\\" + Session["path"].ToString();

                if (File.Exists(path)) File.Delete(path);

                Session["path"] = null;
                Session["fname"] = null;
            }
            (new ProjectCDao()).RemoveArticle(no);

            Response.Redirect("Clientlist.aspx");
        }
        else
        {
            lblMessage.Text = "본인이 작성한 글만 삭제할 수 있습니다.";
        }
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
            (new ProjectCDao()).InsertClientProReply(no, Session["email"].ToString(), txtReply.Text);
            txtReply.Text = "";
            DisplayReply();
    }

    protected void txtReply_TextChanged(object sender, EventArgs e)
    {
    }
}