using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Freeshow : System.Web.UI.Page
{
    static int no;
    static ProjectFDo mDo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            no = int.Parse(Request["no"].ToString());

            mDo = (new ProjectFDao()).GetBoardDetails(no);

            lblName.Text = mDo.Name;
            lblContents.Text = mDo.Contents;
            if (mDo.Filename.Length > 0)
            {
                lblFname.Text = mDo.Filename;

                hyperDownload.Visible = true;

                Session["path"] = "Fnotice\\fnotice_" + no.ToString() + mDo.Filename.Substring(mDo.Filename.IndexOf("."));
                Session["fname"] = mDo.Filename;
            }
            lblHits.Text = mDo.Hits.ToString();
            lblTitle.Text = mDo.Title;
            lblUploadDate.Text = mDo.Uploadtime;
        }
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("Freelist.aspx");
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("Freewrite.aspx?md=1&no=" + no);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            lblMessage.Text = "본인이 작성한 글만 삭제할 수 있습니다.";
            return;
        }

        if ((Session["email"].ToString() == mDo.Author) || ((new MemberDao()).CheckAuth(Session["email"].ToString(), (new MemberDao()).GetUgradeOfGradename("프리랜서"))))
        {
            if (Session["path"] != null)
            {
                string path = Request.PhysicalApplicationPath + "\\" + Session["path"].ToString();

                if (File.Exists(path)) File.Delete(path);

                Session["path"] = null;
                Session["fname"] = null;
            }
            (new ProjectFDao()).RemoveArticle(no);

            Response.Redirect("Freelist.aspx");
        }
        else
        {
            lblMessage.Text = "본인이 작성한 글만 삭제할 수 있습니다.";
        }
    }
    private void DisplyReply(int iPage)
    {
        grvClientProReply.DataSource = mDo.FreeProReply;
        grvClientProReply.PageIndex = iPage;
        grvClientProReply.DataBind();
    }
    private void DisplayReply()
    {
        grvClientProReply.DataSource = (new ProjectFDao()).GetFreeLancerProReplyList(no);
        grvClientProReply.PageIndex = 0;
        grvClientProReply.DataBind();
    }
    protected void grvFreeLancerProReply_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DisplyReply(e.NewPageIndex);
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        (new ProjectFDao()).InsertFreeLancerProReply(no, Session["email"].ToString(), txtReply.Text);

        txtReply.Text = "";
        DisplayReply();
    }
}