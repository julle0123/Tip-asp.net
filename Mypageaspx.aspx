<%@ Page Title="" Language="C#" MasterPageFile="~/Mypage.master" AutoEventWireup="true" CodeFile="Mypageaspx.aspx.cs" Inherits="Mypageaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:100%; height:200px">
        <tr>
            <td>
                <asp:Label ID="lblId" runat="server" Font-Size="14px" Font-Bold="true">이메일 주소</asp:Label>
                 <asp:TextBox runat="server" ID="txtEmail" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:Label ID="lblpass" runat="server" Font-Size="14px" Font-Bold="true">비밀번호</asp:Label>
                 <asp:TextBox runat="server" ID="txtPass" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:Label ID="lbladdress" runat="server" Font-Size="14px" Font-Bold="true">주소</asp:Label>
                 <asp:TextBox runat="server" ID="txtaddress" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg" ></asp:TextBox>
                <asp:Label ID="lblphone" runat="server" Font-Size="14px" Font-Bold="true">전화번호</asp:Label>
                 <asp:TextBox runat="server" ID="txtphone" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:Label ID="lblname" runat="server" Font-Size="14px" Font-Bold="true">이름</asp:Label>
                 <asp:TextBox runat="server" ID="txtname" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg" ></asp:TextBox>
                <asp:Label runat="server" ID="lblCareer" Font-Size="14px" Font-Bold="true" style="text-align:center">경력</asp:Label>
                <asp:TextBox runat="server" ID="txtCareer" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:Label runat="server" ID="lblPart" Font-Size="14px" Font-Bold="true" style="text-align:center">작업파트</asp:Label>
                <asp:TextBox runat="server" ID="txtPart" style="width:500px; height:25px; border-radius:5em; margin:auto" CssClass="form-control form-control-lg" ></asp:TextBox>
            </td>
        </tr>
        </table>
</asp:Content>