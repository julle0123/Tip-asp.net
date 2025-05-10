using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MemberDo의 요약 설명입니다.
/// </summary>
public class MemberDo
{

    private string email;
    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    private string passwd;
    public string Passwd
    {
        get { return passwd; }
        set { passwd = value; }
    }

    private string address;
    public string Address
    {
        get { return address; }
        set { address = value; }
    }

    private string phone;
    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }

    private string name;
    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private string career;
    public string Career
    {
        get { return career; }
        set { career = value; }
    }

    private string part;
    public string Part
    {
        get { return part; }
        set { part = value; }
    }

    private bool status;
    public bool Status
    {
        get { return status; }
        set { status = value; }
    }

    private int ugrade;
    public int Ugrade
    {
        get { return ugrade; }
        set { ugrade = value; }
    }

    public MemberDo()
    {
    }

    public MemberDo(string email, string pwd, string addr, string phone, string name, string career, string part)
    {
        this.email = email;
        this.passwd = pwd;
        this.address = addr;
        this.phone = phone;
        this.name = name;
        this.career = career;
        this.part = part;
    }

    public MemberDo(string email, string pwd, string addr, string phone, string name)
    {
        this.email = email;
        this.passwd = pwd;
        this.address = addr;
        this.phone = phone;
        this.name = name;

    }

}