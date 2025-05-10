<%@ Page Title="" Language="C#" MasterPageFile="~/Community.master" AutoEventWireup="true" CodeFile="Noticeshow.aspx.cs" Inherits="Noticeshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%" border="1">
        <tr>
            <td style="background-color:#CCCCFF" colspan="7">
                <asp:Label runat="server" ID="label1" Text="공지사항 상세보기" Width="100%" style="font-family:'맑은 고딕'; font-size:24px;  text-align:center; font-weight:700; background:#F78181"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F78181; border:3px solid black; ">제목</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F6CECE; border:3px solid black;">
                <asp:Label runat="server" ID="lblTitle"></asp:Label>
            </td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F78181; border:3px solid black;">작성자</td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F6CECE; border:3px solid black" colspan="5">
                <asp:Label runat="server" ID="lblName"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:10%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F78181; border:3px solid black;">작성일</td>
            <td style="width:10%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F6CECE; border:3px solid black;">
                <asp:Label runat="server" ID="lblUploadDate"></asp:Label>
            </td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F78181; border:3px solid black;">조회수</td>
            <td style="width: 3%; height: 51px; text-align: center; font-family: '맑은 고딕'; font-size:16px; font-weight:700; background-color:#F6CECE; border:3px solid black;">
                <asp:Label runat="server" ID="lblHits"></asp:Label>
            </td>
            <td style="width:5%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; background-color:#F78181; border:3px solid black;">첨부</td>
            <td style="width: 150px; height: 51px; text-align: center; font-family: '맑은 고딕'; font-size:16px; font-weight:700; background-color:#F6CECE; border:3px solid black;">
                <asp:Label runat="server" ID="lblFname"></asp:Label>
            </td>
            <td style="width:100px; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#F6CECE" colspan="7">
                <asp:HyperLink runat="server" ID="hyperDownload" Text="Download" NavigateUrl="~/download.aspx" Target="_blank" Visible="false"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 30px; text-align: center; font-family: '맑은 고딕'; font-size: 24px; font-weight:700; background-color:#F78181; border:3px solid black;" colspan="7">내용</td>
        </tr>
        <tr>
            <td style="width:100%; height:400px; text-align:left; font-family:'맑은 고딕';font-size:18px; background-color:#F6CECE; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblContents"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:550px; height: 50px; text-align: center; vertical-align: middle; background-color:#F6CECE; border:3px solid black;">
                <asp:Button runat="server" ID="btnList" Text="목록" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnList_Click" CssClass="btn btn-danger"/>
                <asp:Button runat="server" ID="btnModify" Text="수정" style="width:70px; margin-left: 5px; margin-right: 5px" OnClick="btnModify_Click" CssClass="btn btn-danger"/>
                <asp:Button runat="server" ID="btnDelete" Text="삭제" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnDelete_Click" CssClass="btn btn-danger"/>
            </td>
            <!--
            <td style="width:500px; height:50px; text-align:center; vertical-align:middle; background-color:#eeeeff" colspan="7">
                <asp:Label runat="server" ID="lblMessage" style="color:#ff0000"></asp:Label>
            </td>
            -->
        </tr>
        </table>
</asp:Content>

