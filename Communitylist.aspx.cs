using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bbslist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null) 
        {
            
            ibtnWrite.Visible = true;
        }

        this.DisplayBoardList();
    }

    //저장된 게시판 불러오기
    private void DisplayBoardList()
    {
        grvBoard.DataSource = (new BbsDao()).GetBoardList();
        grvBoard.DataBind();
    }

    //저장된 게시판 불러오기
    private void DisplayBoardList(int iPage)
    {
        grvBoard.DataSource = (new BbsDao()).GetBoardList();
        grvBoard.PageIndex = iPage;
        grvBoard.DataBind();
    }


    protected void grvBoard_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    //저장된 게시판 넘버 불러오기
    protected void grvBoard_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvBoard.PageIndex = e.NewPageIndex;
        grvBoard.DataBind();
    }

    //게시판 작성 페이지로 이동
    protected void ibtnWrite_Click(object sender, EventArgs e)
    {
        Response.Redirect("Communitywrite.aspx?md=0");
    }

    //로그인 안되면 게시판을 볼수 없다.
    public string GetShowUrl(object no)
    {
        if (Session["email"] == null)
        {
            lblMessage.Text = "글 내용을 읽으려면 로그인 하세요...";
            return null;
        }

        else
        {
            return "Communityshow.aspx?no=" + no;
        }
    }
}