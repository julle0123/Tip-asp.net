<%@ Page Title="" Language="C#" MasterPageFile="~/Mypage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:700px">
        <tr>
            <td style="font-size:16px; text-align:right; vertical-align:middle; width:100px; font-weight:700">email</td>
            <td style="text-align:left; vertical-align:middle; width:300px">
                <asp:TextBox ID="txtId" runat="server" style="margin-bottom:5px" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:Label ID="lblResult" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            <td style="text-align:left; vertical-align:middle; width:300px">
                &nbsp;</td>
            </tr>
         <tr>
            <td style="font-size:16px; text-align:right; vertical-align:middle; height: 23px; font-weight:700">비밀번호</td>
            <td style="text-align:left; vertical-align:middle">
                <asp:TextBox ID="txtPw1" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="비밀번호를 입력해 주세요." ControlToValidate="txtPw1" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        <tr>
            <td style="font-size:16px; text-align:right; vertical-align:middle; width:100px; font-weight:700">비밀번호확인</td>
            <td style="text-align:left; vertical-align:middle">
                 <asp:TextBox ID="txtPw2" runat="server" TextMode="Password" style="margin-bottom:5px" CssClass="form-control form-control-lg"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle">
                <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToCompare="txtPw1" ControlToValidate="txtPw2" ForeColor="#CC0000">*</asp:CompareValidator>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle"></td>
            <td style="text-align:left; vertical-align:middle" colspan="2">
                 <asp:Button ID="SetDelete" runat="server" Text="탈퇴" OnClick="SetDelete_Click" CssClass="btn btn-danger" style="margin-right:10px; border:dotted 3px black"/>
                <asp:Button ID="btnCancel" runat="server" Text="취소" OnClick="btnCancel_Click" CausesValidation="false" CssClass="btn btn-warning"
                    style="border:dotted 3px black; color:#ffffff"/>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle"></td>
            <td style="text-align:left; vertical-align:middle" colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
                </td>
            </tr>
    </table>
</asp:Content>

