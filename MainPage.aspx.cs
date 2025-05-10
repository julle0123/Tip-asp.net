using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DisplayBoardList();
        DisplayBoardList1();
    }
    private void DisplayBoardList()
    {
        grvfree.DataSource = (new ProjectFDao()).GetBoardList();
        grvfree.DataBind();
    }
    private void DisplayBoardList(int iPage)
    {
        grvfree.DataSource = (new ProjectFDao()).GetBoardList();
        grvfree.PageIndex = iPage;
        grvfree.DataBind();
    }
    protected void grvfree_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvfree.PageIndex = e.NewPageIndex;
        grvfree.DataBind();
    }
    private void DisplayBoardList1()
    {
        grvclient.DataSource = (new ProjectCDao()).GetBoardList();
        grvclient.DataBind();
    }
    private void DisplayBoardList1(int iPage)
    {
        grvclient.DataSource = (new ProjectCDao()).GetBoardList();
        grvclient.PageIndex = iPage;
        grvclient.DataBind();
    }
    protected void grvclient_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvclient.PageIndex = e.NewPageIndex;
        grvclient.DataBind();
    }

    protected void grvfree_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}