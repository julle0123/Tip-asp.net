using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// NoticeDao의 요약 설명입니다.
/// </summary>
public class NoticeDao
{
    public NoticeDao()
    {
    }

    //게시판 불러오기
    public DataSet GetBoardList()
    {
        string qrySelect = "select * from view_notice ORDER BY uploadTime Desc";

        return DbMan.DataAdapterFill(qrySelect, "bbs");
    }

    //
    public NoticeDo GetBoardDetails(int no)
    {
        NoticeDo mDo;

        string qryUpdate = "update Notice set hits = hits + 1 where no = " + no;

        DbMan.ExecuteNonQuery(qryUpdate);

        string qrySelect = "select * from view_notice where no = " + no;

        SqlDataReader myReader = DbMan.ExecuteReader(qrySelect);

        myReader.Read();

        mDo = new NoticeDo(int.Parse(myReader["no"].ToString().TrimEnd()),
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
        string qryDelete = "delete Notice where no = " + no.ToString();

        DbMan.ExecuteNonQuery(qryDelete);

        DbMan.Close();
    }

    //게시판 작성
    public int NewBoardArticle(NoticeDo mDo)
    {
        SqlCommand myCmd = new SqlCommand("procInsertNotice", DbMan.Open());
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

        myParam = new SqlParameter("@filename", SqlDbType.NVarChar, 100);
        myParam.Value = mDo.Name;
        myCmd.Parameters.Add(myParam);

        SqlParameter myParamOut = new SqlParameter("@no", SqlDbType.Int);
        myParamOut.Direction = ParameterDirection.Output;
        myCmd.Parameters.Add(myParamOut);

        return DbMan.ExecuteStoredProcedure(myCmd, myParamOut);
    }
    public void UpdateArticle(NoticeDo bDo, int no)
    {
        string qryUpdate = "UPDATE Notice SET title='" + bDo.Title + "', contents='" + bDo.Contents + "'";
        if (bDo.Filename != "")
            qryUpdate += ", filename='" + bDo.Filename + "'";
        qryUpdate += " WHERE no =" + no;

        DbMan.ExecuteNonQuery(qryUpdate);
        DbMan.Close();
    }
}