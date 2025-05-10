using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            //로그인 안되었을 경우 로그인 해주세요...
            if (Session["email"] == null)
            {
                lblLogin.Text = "로그인을 해주세요...";
            }

            //이미 로그인 되었을때 회원정보 불러오기 및 버튼 이름 변경
            else
            {
                btnLogin.Text = "로그아웃";

                MemberDao mDao = new MemberDao(); //이거는 라벨에다가 이름을 넣기위한 호출변수 선언
                lblLogin.Text = mDao.GetName(Session["email"].ToString()) + "님 반갑습니다.";
            }
        }
        

    }

    protected void btnLogin_Click(object sender, EventArgs e)//메인페이지 -> 로그인 창
    {
        //로그인 안되었을 경우 로그인aspx로 이동
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }

        //이미 로그인 되었을때 다시 버튼을 눌렀을경우 로그아웃 및 버튼 이름 변경
        else
        {
            Session["email"] = null;

            btnLogin.Text = "로그인";
            lblLogin.Text = "로그인 해주세요...";

            Response.Redirect(Session["returnUrl"].ToString());
            //버튼이름.img링크 = "~경로";
            //라벨이름.Text = "로그인 해주세요.";
        }
        

    }

    /*
    protected void btnRegist_Click(object sender, EventArgs e)//메인페이지 -> 바로 회원가입 창
    {

    }*/

    protected void btnBlog_Click(object sender, EventArgs e)//네이버 블로그로 새창 띄우기
    {
        Response.Redirect("https://campaign.naver.com/lifelogblog/");
    }

    protected void btnFree_Click(object sender, EventArgs e)//메인페이지에 프리랜서.aspx 불러오기
    {
        //프리랜서 게시판 이동
        Response.Redirect("Freelist.aspx");
    }

    protected void btnClient_Click(object sender, EventArgs e)//메인페이지에 고객.aspx 불러오기
    {
        Response.Redirect("Clientlist.aspx");
    }

    protected void btnCommu_Click(object sender, EventArgs e)//메인페이지에 커뮤니티.aspx 불러오기
    {
        Response.Redirect("Communitylist.aspx");
    }

    protected void btnMypage_Click(object sender, EventArgs e)//메인페이지에 마이페이지.aspx 불러오기
    {
        Response.Redirect("mymainpage.aspx");
    }

    protected void btnMap_Click(object sender, EventArgs e)//메인페이지에 프로젝트맵.aspx 불러오기
    {
        Response.Redirect("Diary.aspx");
    }


    protected void btnLogo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
}
