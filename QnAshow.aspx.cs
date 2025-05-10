using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class QnAshow : System.Web.UI.Page
{
    static int no;
    static QnaDo mDo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            no = int.Parse(Request["no"].ToString());

            mDo = (new QnaDao()).GetBoardDetails(no);

            lblName.Text = mDo.Name;
            lblContents.Text = mDo.Contents;
            lblHits.Text = mDo.Hits.ToString();
            lblTitle.Text = mDo.Title;
            lblUploadDate.Text = mDo.Uploadtime;
        }
    }
    private void DisplyReply(int iPage)
    {
        grvQnAReply.DataSource = mDo.QnAProReply;
        grvQnAReply.PageIndex = iPage;
        grvQnAReply.DataBind();
    }
    private void DisplayReply()
    {
        grvQnAReply.DataSource = (new QnaDao()).GetQnaReplyList(no);
        grvQnAReply.PageIndex = 0;
        grvQnAReply.DataBind();
    }
    protected void grvQnAReply_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DisplyReply(e.NewPageIndex);
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("QnAlist.aspx");
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("QnAwrite.aspx?&md=1&no=" + no);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            lblMessage.Text = "본인이 작성한 글만 삭제할 수 있습니다.";
            return;
        }

        if ((Session["email"].ToString() == mDo.Author))
        {
            if (Session["path"] != null)
            {
                string path = Request.PhysicalApplicationPath + "\\" + Session["path"].ToString();

                if (File.Exists(path)) File.Delete(path);

                Session["path"] = null;
                Session["fname"] = null;
            }
            (new QnaDao()).RemoveArticle(no);

            Response.Redirect("QnAlist.aspx");
        }
        else
        {
            lblMessage.Text = "본인이 작성한 글만 삭제할 수 있습니다.";
        }
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        (new QnaDao()).InsertQnaReply(no, Session["email"].ToString(), txtReply.Text);

        txtReply.Text = "";
        DisplayReply();
    }
}