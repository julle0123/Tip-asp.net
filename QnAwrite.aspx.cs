using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QnAwrite : System.Web.UI.Page
{
    int no;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["email"] == null) Response.Redirect("QnAlist.aspx");

            switch (int.Parse(Request["md"]))
            {
                case 0:
                case 2:
                    txtId.Text = Session["email"].ToString();
                    break;

                case 1:
                    QnaDo bDo = (new QnaDao()).GetBoardDetails(int.Parse(Request["no"]));

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

        QnaDo mDo = new QnaDo(txtTitle.Text, txtContents.Text, txtId.Text, Session["email"].ToString());
        switch (int.Parse(Request["md"]))
        {
            case 0:
                no = (new QnaDao()).NewBoardArticle(mDo);
                break;
            case 1:
                no = int.Parse(Request["no"]);
                (new QnaDao()).UpdateBoard(mDo, no);
                break;
        }

        Response.Redirect("QnAlist.aspx");
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("QnAlist.aspx");
    }

    protected void txtContents_TextChanged(object sender, EventArgs e)
    {

    }
}