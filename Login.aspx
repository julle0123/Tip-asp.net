<%@ Page Title="" Language="C#" MasterPageFile="~/sProfile.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:100%; height:500px">
        <tr style="text-align:center; vertical-align:middle; background-color:#f7f9fb">
            <td style="width:500px; height:400px">
                <asp:Image runat="server" ID="imgFree" ImageUrl="~/img/career.png" Width="100px" Height="100px" style="border-radius:50%!important; box-shadow:0 4px 8px 0px #d5d5d5"/><br /><br />
                <asp:Label runat="server" ID="lblFree" Font-Size="24px" Font-Bold="true" style="margin-right:320px;">프리랜서</asp:Label><br /><br />
                <asp:Label runat="server" ID="lblEmailF" Font-Size="14px" Font-Bold="true" style="margin-right:365px;">이메일</asp:Label><br />
                <asp:TextBox runat="server" ID="txtEmailF" Width="400px" Height="25px" style="margin-top:18px; text-align:left"></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblPasswdF" Font-Size="14px" Font-Bold="true" style="margin-right:350px;">비밀번호</asp:Label><br />
                <asp:TextBox runat="server" ID="txtPasswdF" Width="400px" Height="25px" style="margin-top:18px; text-align:left" ></asp:TextBox><br /><br/><br /><br />
                <asp:Button runat="server" ID="btnLoginF" Width="405px" Height="40px" Text="로그인" Font-Bold="true" Font-Size="18px" OnClick="btnLoginF_Click" CssClass="btn btn-primary"/><br /><br />계정이 없으십니까? 
                <asp:HyperLink runat="server" ID="hyperF" Text="계정만들기" NavigateUrl="~/RegistrationF.aspx"></asp:HyperLink>
            </td>
            <td style="width: 500px; height: 400px">
                <asp:Image runat="server" ID="ingClient" ImageUrl="~/img/client.png" Width="100px" Height="100px" style="border-radius:50%!important; box-shadow:0 4px 8px 0px #d5d5d5"/><br /><br />
                <asp:Label runat="server" ID="lblClient" Font-Size="24px" Font-Bold="true" style="margin-right:365px;">고객</asp:Label><br /><br />
                <asp:Label runat="server" ID="lblEmailC" Font-Size="14px" Font-Bold="true" style="margin-right:365px;">이메일</asp:Label><br />
                <asp:TextBox runat="server" ID="txtEmailC" Width="400px" Height="25px" style="margin-top:18px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblPasswdC" Font-Size="14px" Font-Bold="true" style="margin-right:350px;">비밀번호</asp:Label><br />
                <asp:TextBox runat="server" ID="txtPasswdC" Width="400px" Height="25px" style="margin-top:18px; text-align:left" ></asp:TextBox><br /><br /><br /><br />
                <asp:Button runat="server" ID="btnLoginC" Width="405px" Height="40px" Text="로그인" Font-Bold="true" Font-Size="18px" OnClick="btnLoginC_Click" CssClass="btn btn-primary"/><br /><br />계정이 없으십니까? 
                <asp:HyperLink runat="server" ID="hyperC" Text="계정만들기" NavigateUrl="~/RegistrationC.aspx"></asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

