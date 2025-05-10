using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Diary : System.Web.UI.Page
{
    string selectedDate = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayBoardList();
    }

    //저장된 게시판 불러오기
    private void DisplayBoardList()
    {
        grvBoard.DataSource = (new ProjectFDao()).GetBoardList();
        grvBoard.DataBind();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        selectedDate = Calendar1.SelectedDate.ToShortDateString();
        DisplayBoardList(selectedDate);
    }

    protected void grvBoard_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    private void DisplayBoardList(string date)
    {
        grvBoard.DataSource = (new ProjectFDao()).GetUpload(date);
        grvBoard.DataBind();
    }

    protected void grvBoard_PageIndexChanging(object sender, EventArgs e)
    {

    }

}