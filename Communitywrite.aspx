<%@ Page Title="" Language="C#" MasterPageFile="~/Community.master" AutoEventWireup="true" CodeFile="Communitywrite.aspx.cs" Inherits="bbswrite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:100%; background-color:#CCCCFF">
        <tr>
            <td colspan="3" style="text-align:center; vertical-align:middle; ">
                <asp:Label ID="Label1" runat="server" BackColor="#CCCCFF" Text="자유게시판" Width="100%" style="font-family: '맑은 고딕'; font-size: 24px; font-weight: 700; background:#A9D0F5"></asp:Label>
                </td>
            </tr>
        <tr>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black;">
                <asp:Label ID="Label2" runat="server" Text="작성자" style="font-family:'맑은 고딕'; font-size:20px" Height="35px"></asp:Label>
                </td>
            
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;" colspan="3">
                <asp:TextBox ID="txtId" runat="server" ReadOnly="true" Width="800px" Height="35px" style="font-family:'맑은고딕'; background-color:#ffffff" OnTextChanged="txtId_TextChanged"></asp:TextBox>
                </td>
            </tr>
        <tr>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black;">
                  <asp:Label ID="Label3" runat="server" Text="제목" Width="200px" style="font-family:'맑은 고딕'; font-size:20px" Height="35px"></asp:Label>
                </td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;" colspan="3">
                <asp:TextBox ID="txtTitle" runat="server" style="width:800px; font-family:'맑은 고딕'; height:35px; background-color:#ffffff"></asp:TextBox>
                </td>
            </tr>
        <tr>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black">
                 <asp:Label ID="Label4" runat="server" Text="내용" Width="200px" style="font-family:'맑은 고딕'; font-size:20px"></asp:Label>
                </td>
             <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;">
                <asp:TextBox ID="txtContents" runat="server" Height="350px" Width="800px" TextMode="MultiLine" style="font-family:'맑은 고딕'; margin-left:2px; margin-top: 0px; background-color:#ffffff" ></asp:TextBox>
                </td>
            </tr>
        <tr>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black">
                <asp:Label ID="Label5" runat="server" Text="파일첨부" Width="200px" style="font-family:'맑은 고딕'; font-size:20px"></asp:Label>
                </td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="800px" style="font-family:'맑은 고딕'; background-color:#ffffff"/>
                <br />
                </td>
            </tr>
        <tr>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black"></td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black">
                <asp:Button ID="btnWirte" runat="server" Width="100px" Height="30px" OnClick="btnWirte_Click" Text="작성" style="margin-left:5px; margin-right:5px" CssClass="btn btn-primary"/>
                <asp:Button ID="btnList" runat="server" CausesValidation="false" Width="100px" Height="30px" OnClick="btnList_Click" Text="목록" style="margin-left: 5px; margin-right: 5px" CssClass="btn btn-primary"/>
                </td>
            </tr>
        <tr>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black"></td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red" style="font-family:'맑은 고딕';" />
                </td>
            </tr>
        </table>
</asp:Content>

