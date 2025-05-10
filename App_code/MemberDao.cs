using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// MemberDao의 요약 설명입니다.
/// </summary>
public class MemberDao
{
    public MemberDao()
    {
    }

    //로그인 동작하는 쿼리문
    public bool AuthenticateF(string email, string pwd)
    {
        bool isAuthen = false;

        //테이블이름 확인하고 2개를 사용하면 수정해야됨 #현재는 테이블 1개라 가정하에 만듬
        string sQuery = "select * from members where email = '" + email + "' and passwd = '" + this.GetMD5(pwd) + "' and status = 'true' and ugrade != 2 and  ugrade != 4";

        SqlDataReader mReader = DbMan.ExecuteReader(sQuery);

        if (mReader.Read()) isAuthen = true;

        mReader.Close();
        DbMan.Close();

        return isAuthen;
    }

    public bool AuthenticateC(string email, string pwd)
    {
        bool isAuthen = false;

        //테이블이름 확인하고 2개를 사용하면 수정해야됨 #현재는 테이블 1개라 가정하에 만듬
        string sQuery = "select * from members where email = '" + email + "' and passwd = '" + this.GetMD5(pwd) + "' and status = 'true' and ugrade != 1 and  ugrade != 4";

        SqlDataReader mReader = DbMan.ExecuteReader(sQuery);

        if (mReader.Read()) isAuthen = true;

        mReader.Close();
        DbMan.Close();

        return isAuthen;
    }

    //이름을 불러오는 쿼리문
    public string GetName(string email)
    {
        string name = null;

        string sQuery = "select name from members where email = '" + email + "'";

        SqlDataReader mReader = DbMan.ExecuteReader(sQuery);

        if(mReader.Read())
        {
            name = mReader["name"].ToString().TrimEnd();
        }

        mReader.Close();
        DbMan.Close();

        return name;
    }

    public MemberDo GetData(string email)
    {
        MemberDo mDo;

        string qrySelect = "select * from members where email = '" + email + "'";
        SqlDataReader mReader = DbMan.ExecuteReader(qrySelect);

        mReader.Read();

        mDo = new MemberDo(mReader["email"].ToString().TrimEnd(),
                mReader["passwd"].ToString().TrimEnd(),
                mReader["address"].ToString().TrimEnd(),
                mReader["phone"].ToString().TrimEnd(),
                mReader["name"].ToString().TrimEnd(),
                mReader["career"].ToString().TrimEnd(),
                mReader["part"].ToString().TrimEnd()
            );

        mReader.Close();
        DbMan.Close();

        return mDo;
    }

    //MD5 암호화
    private String GetMD5(string input)
    {
        using(MD5 md5 = MD5.Create())
        {
            byte[] inputBytes = Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }

            return sb.ToString();
        }
    }

    //이메일 중복검사 쿼리문
    public bool VerifyUserEmail(string email)
    {
        bool result = true;

        //테이블 하나로 가정하에 만들었으면 2개로 나뉘어지면 수정해야됨
        string sQuery = "select * from members where email = '" + email + "'";

        SqlDataReader myReader = DbMan.ExecuteReader(sQuery);

        if (myReader.Read()) result = false;

        myReader.Close();
        DbMan.Close();

        return result;
    }

    //회원가입 쿼리문
    public void RegisterFreeUsingQuery(MemberDo mDo)
    {
        string sQuery = "insert into members (email, passwd, address, phone, name, career, part, status, ugrade) values ('" +
            mDo.Email + "', '" + this.GetMD5(mDo.Passwd) + "', '" + mDo.Address + "', '" + mDo.Phone + "', '" + mDo.Name + "', '" +
            mDo.Career + "', '" + mDo.Part + "', 'true', 1)";

        DbMan.ExecuteNonQuery(sQuery);
        DbMan.Close();
    }

    //회원가입 쿼리문
    public void RegisterClientUsingQuery(MemberDo mDo)
    {
        string sQuery = "insert into members (email, passwd, address, phone, name, career, part, status, ugrade) values ('" +
            mDo.Email + "', '" + this.GetMD5(mDo.Passwd) + "', '" + mDo.Address + "', '" + mDo.Phone + "', '" + mDo.Name + "', '" +
            mDo.Career + "', '" + mDo.Part + "', 'true', 2)";

        DbMan.ExecuteNonQuery(sQuery);
        DbMan.Close();
    }

    //회원의 이메일 불러오기
    public int GetUgradeOfGradeid(string email)
    {
        int ugrade = 0;

        string qrySelect = "select ugrade from members where email='" + email + "'";

        SqlDataReader mReader = DbMan.ExecuteReader(qrySelect);
        if (mReader.Read()) ugrade = int.Parse(mReader["ugrade"].ToString());

        mReader.Close();
        DbMan.Close();

        return ugrade;
    }

    //회원의 등급(프리랜서, 고객, 관리자) 불러오기
    public int GetUgradeOfGradename(string gradename)
    {
        int ugrade = 0;

        string qrySelect = "select ugrade from usergrade where gradename='" + gradename + "'";

        SqlDataReader mReader = DbMan.ExecuteReader(qrySelect);
        if(mReader.Read()) ugrade =int.Parse(mReader["ugrade"].ToString());

        mReader.Close();
        DbMan.Close();

        return ugrade;
    }

    public bool CheckAuth(object email, int auth)
    {
        bool retValue = false;

        if(email != null)
        {
            if (this.GetUgradeOfGradeid(email.ToString()) >= auth) retValue = true;
        }

        return retValue;
    }
    public bool AuthenticateToSetNewPasswd(string email, string name)
    {
        bool result = false;
        //검색을 위한 쿼리문 작성
        string selectQry = "SELECT * FROM members WHERE email = '" + email + "' AND name ='" + name + "'";

        //쿼리문 실행하고, 결과를 SqlDataReader객체로 받아옴
        SqlDataReader myReader = DbMan.ExecuteReader(selectQry);
        if (myReader.Read()) result = true;
        //SqlDataReader 객체 소별및 데이터베이스 연결 해제
        myReader.Close();
        DbMan.Close();
        //결과를 리턴
        return result;
    }
    public void SetNewPasswd(string email, string pw)
    {
        //비밀번호 변경을 위한 쿼리문
        string updateQry = "UPDATE members SET passwd = '" + this.GetMD5(pw) + "' WHERE email = '" + email + "'";
        DbMan.ExecuteNonQuery(updateQry);
        //데이터베이스 연결 해제
        DbMan.Close();
    }

    public bool AuthenticateEmail(string email)
    {
        bool result = false;
        string selectQry = "SELECT * FROM members WHERE email = '" + email + "'";
        SqlDataReader myReader = DbMan.ExecuteReader(selectQry);
        if (myReader.Read()) result = true;
        myReader.Close();
        DbMan.Close();
        return result;
    }
    public void UpdateGrade(string email)
    {
        string qryUpdate = "UPDATE members SET ugrade = 4 WHERE email = '" + email + "'"; // AND passwd = '" + pw + "'";
        DbMan.ExecuteNonQuery(qryUpdate);
        DbMan.Close();
    }
    public bool AuthenticateRestore(string email, string name)
    {
        bool result = false;
        string selectQry = "SELECT * FROM members WHERE email = '" + email + "' AND name ='" + name + "'";

        SqlDataReader myReader = DbMan.ExecuteReader(selectQry);
        if (myReader.Read()) result = true;

        myReader.Close();
        DbMan.Close();
        return result;
    }
    public void UpdateGradeC(string email)
    {
        string qryUpdate = "UPDATE members SET ugrade = 2 WHERE email = '" + email + "'";
        DbMan.ExecuteNonQuery(qryUpdate);
        DbMan.Close();
    }
    public void UpdateGradeF(string email)
    {
        string qryUpdate = "UPDATE members SET ugrade = 1 WHERE email = '" + email + "'";
        DbMan.ExecuteNonQuery(qryUpdate);
        DbMan.Close();
    }
}