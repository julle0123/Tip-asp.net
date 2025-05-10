using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// QnaDao의 요약 설명입니다.
/// </summary>
public class QnaDao
{
    public QnaDao()
    {
    }

    //게시판 불러오기
    public DataSet GetBoardList()
    {
        string qrySelect = "select * from view_qna ORDER BY uploadTime Desc";

        return DbMan.DataAdapterFill(qrySelect, "bbs");
    }

    //
    public QnaDo GetBoardDetails(int no)
    {
        QnaDo mDo;

        string qryUpdate = "update QnA set hits = hits + 1 where no = " + no;

        DbMan.ExecuteNonQuery(qryUpdate);

        string qrySelect = "select * from view_qna where no = " + no;

        SqlDataReader myReader = DbMan.ExecuteReader(qrySelect);

        myReader.Read();

        mDo = new QnaDo(int.Parse(myReader["no"].ToString().TrimEnd()),
             myReader["title"].ToString().TrimEnd(),
             myReader["contents"].ToString().TrimEnd(),
             myReader["author"].ToString().TrimEnd(),
             myReader["name"].ToString().TrimEnd(),
             myReader["uploadtime"].ToString().TrimEnd(),
             int.Parse(myReader["hits"].ToString().TrimEnd())
             );

        myReader.Close();
        DbMan.Close();

        return mDo;
    }

    //게시판 삭제
    public void RemoveArticle(int no)
    {
        string qryDelete = "DELETE QnAReply WHERE QnAReplyno = " + no.ToString();

        DbMan.ExecuteNonQuery(qryDelete);
        qryDelete = "delete QnA where no = " + no.ToString();
        DbMan.ExecuteNonQuery(qryDelete);
        DbMan.Close();
    }

    //게시판 작성
    public int NewBoardArticle(QnaDo mDo)
    {
        SqlCommand myCmd = new SqlCommand("procInsertQna", DbMan.Open());
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

        SqlParameter myParamOut = new SqlParameter("@no", SqlDbType.Int);
        myParamOut.Direction = ParameterDirection.Output;
        myCmd.Parameters.Add(myParamOut);

        return DbMan.ExecuteStoredProcedure(myCmd, myParamOut);
    }
    public DataSet GetQnaReplyList(int dno)
    {
        string qrySelect = "SELECT * FROM view_QnAReply WHERE QnAReplyno=" + dno.ToString() + " ORDER BY uploaddate DESC";

        return DbMan.DataAdapterFill(qrySelect, "QnAReply");
    }
    public void InsertQnaReply(int dno, string author, string contents)
    {
        SqlCommand mCmd = new SqlCommand("procinsertqnareply", DbMan.Open());
        mCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter mParam = new SqlParameter("@QnAno", SqlDbType.Int);
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
    public void UpdateBoard(QnaDo dDo, int no)
    {
        string qryUpdate = "UPDATE QnA SET title='" + dDo.Title + "', contents='" + dDo.Contents + "'";

        qryUpdate += " WHERE no =" + no;

        DbMan.ExecuteNonQuery(qryUpdate);
        DbMan.Close();
    }
}