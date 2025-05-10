using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class ProjectCDao
{
    public ProjectCDao()
    {
    }

    //게시판 불러오기
    public DataSet GetBoardList()
    {
        string qrySelect = "select * from view_clientproject ORDER BY uploadTime Desc";

        return DbMan.DataAdapterFill(qrySelect, "bbs");
    }

    //
    public ProjectCDo GetBoardDetails(int no)
    {
        ProjectCDo mDo;

        string qryUpdate = "update Clientproject set hits = hits + 1 where no = " + no;

        DbMan.ExecuteNonQuery(qryUpdate);

        string qrySelect = "select * from view_clientproject where no = " + no;

        SqlDataReader myReader = DbMan.ExecuteReader(qrySelect);

        myReader.Read();

        mDo = new ProjectCDo(int.Parse(myReader["no"].ToString().TrimEnd()),
             myReader["title"].ToString().TrimEnd(),
             myReader["contents"].ToString().TrimEnd(),
             myReader["author"].ToString().TrimEnd(),
             myReader["name"].ToString().TrimEnd(),
             myReader["uploadtime"].ToString().TrimEnd(),
             int.Parse(myReader["hits"].ToString().TrimEnd()),
             myReader["filename"].ToString().TrimEnd()
             );

        myReader.Close();
        DbMan.Close();

        return mDo;
    }

    //게시판 삭제
    public void RemoveArticle(int no)
    {
        string qryDelete = "DELETE ClientProReply WHERE projectno = " + no.ToString();

        DbMan.ExecuteNonQuery(qryDelete);
        qryDelete = "delete Clientproject where no = " + no.ToString();
        DbMan.ExecuteNonQuery(qryDelete);
        DbMan.Close();
    }

    //게시판 작성
    public int NewBoardArticle(ProjectCDo mDo)
    {
        SqlCommand myCmd = new SqlCommand("procInsertClient", DbMan.Open());
        myCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter myParam;

        myParam = new SqlParameter("@title", SqlDbType.NChar, 20);
        myParam.Value = mDo.Title;
        myCmd.Parameters.Add(myParam);

        myParam = new SqlParameter("@contents", SqlDbType.NVarChar, 500);
        myParam.Value = mDo.Contents;
        myCmd.Parameters.Add(myParam);

        myParam = new SqlParameter("@author", SqlDbType.Char, 20);
        myParam.Value = mDo.Author;
        myCmd.Parameters.Add(myParam);

        myParam = new SqlParameter("@name", SqlDbType.NChar, 10);
        myParam.Value = mDo.Name;
        myCmd.Parameters.Add(myParam);

        myParam = new SqlParameter("@fname", SqlDbType.NVarChar, 100);
        myParam.Value = mDo.Filename;
        myCmd.Parameters.Add(myParam);

        SqlParameter myParamOut = new SqlParameter("@no", SqlDbType.Int);
        myParamOut.Direction = ParameterDirection.Output;
        myCmd.Parameters.Add(myParamOut);

        return DbMan.ExecuteStoredProcedure(myCmd, myParamOut);
    }
    public DataSet GetClientProReplyList(int dno)
    {
        string qrySelect = "SELECT * FROM view_ClientProReply WHERE projectno=" + dno.ToString() + " ORDER BY uploaddate DESC";

        return DbMan.DataAdapterFill(qrySelect, "ClientProReply");
    }
    public void InsertClientProReply(int dno, string author, string contents)
    {
        SqlCommand mCmd = new SqlCommand("proReplyClientproject", DbMan.Open());
        mCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter mParam = new SqlParameter("@Clientno", SqlDbType.Int);
        mParam.Value = dno;
        mCmd.Parameters.Add(mParam);
        mParam = new SqlParameter("@author", SqlDbType.Char, 20);
        mParam.Value = author;
        mCmd.Parameters.Add(mParam);

        mParam = new SqlParameter("@contents", SqlDbType.NVarChar, 50);
        mParam.Value = contents;
        mCmd.Parameters.Add(mParam);

        DbMan.ExecuteNonQuery(mCmd);
        DbMan.Close();
    }
    public void UpdateArticle(ProjectCDo bDo, int no)
    {
        string qryUpdate = "UPDATE Clientproject SET title='" + bDo.Title + "', contents='" + bDo.Contents + "'";
        if (bDo.Filename != "")
            qryUpdate += ", filename='" + bDo.Filename + "'";
        qryUpdate += " WHERE no =" + no;

        DbMan.ExecuteNonQuery(qryUpdate);
        DbMan.Close();
    }
}