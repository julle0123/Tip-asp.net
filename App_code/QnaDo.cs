using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// QnaDo의 요약 설명입니다.
/// </summary>
public class QnaDo
{
    public QnaDo()
    {
    }

    private int no;
    public int No
    {
        get { return no; }
        set { no = value; }
    }

    private string title;
    public string Title
    {
        get { return title; }
        set { title = value; }
    }

    private string contents;
    public string Contents
    {
        get { return contents; }
        set { contents = value; }
    }

    private string author;
    public string Author
    {
        get { return author; }
        set { author = value; }
    }

    private string name;
    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private string uploadtime;
    public string Uploadtime
    {
        get { return uploadtime; }
        set { uploadtime = value; }
    }

    private int hits;
    public int Hits
    {
        get { return hits; }
        set { hits = value; }
    }
    private DataSet anAProReply;
    public DataSet QnAProReply
    {
        get { return anAProReply; }
        set { anAProReply = value; }
    }
    public QnaDo(string title, string contents, string author, string name)
    {
        this.title = title;
        this.contents = contents;
        this.author = author;
        this.name = name;
    }

    public QnaDo(int no, string title, string contents, string author, string name, string uploadtime, int hits)
    {
        this.no = no;
        this.title = title;
        this.contents = contents;
        this.author = author;
        this.name = name;
        this.uploadtime = uploadtime;
        this.hits = hits;
    }
}