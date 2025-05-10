using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class ProjectCDo
{
    public ProjectCDo()
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

    private string filename;
    public string Filename
    {
        get { return filename; }
        set { filename = value; }
    }
    private DataSet clientProReply;
    public DataSet ClientProReply
    {
        get { return clientProReply; }
        set { clientProReply = value; }
    }
    public ProjectCDo(string title, string contents, string author, string name, string filename)
    {
        this.title = title;
        this.contents = contents;
        this.author = author;
        this.name = name;
        this.filename = filename;
    }

    public ProjectCDo(int no, string title, string contents, string author, string name, string uploadtime, int hits, string filename)
    {
        this.no = no;
        this.title = title;
        this.contents = contents;
        this.author = author;
        this.name = name;
        this.uploadtime = uploadtime;
        this.hits = hits;
        this.filename = filename;
    }
}