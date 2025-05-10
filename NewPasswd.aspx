<%@ Page Title="" Language="C#" MasterPageFile="~/Mypage.master" AutoEventWireup="true" CodeFile="NewPasswd.aspx.cs" Inherits="NewPasswd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width:700px">
        <tr>
            <td colspan="3" style="text-align:left; vertical-align:middle">
                <asp:Label ID ="Label1" Width="700px" runat="server" Text="비밀번호 재설정" BackColor="#F6E3CE" style="font-size:16px; font-weight:700; text-align:center"></asp:Label>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle; width:100px; font-size:16px; font-weight:700">email</td>
            <td style="text-align:left; vertical-align:middle; width:300px">
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle; width:300px">
                &nbsp;</td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle; width:100px; font-size:16px; font-weight:700">성명</td>
            <td style="text-align:left; vertical-align:middle; width:300px">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle">
                &nbsp;</td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle; height: 28px;"></td>
            <td style="text-align:left; vertical-align:middle; height: 28px;" colspan="2">
                <asp:Button ID="btnAuthenticate" runat="server" Text="본인인증" OnClick="btnAuthenticate_Click" CausesValidation="false" Hegiht="25px" style="margin-right:5px; text-align:center" CssClass="btn btn-primary"/>
                <asp:Button ID="btnCancel" runat="server" Text="취소" OnClick="btnCancel_Click" CausesValidation="false" Hegiht="25px" CssClass="btn btn-warning"/>
                <asp:Label ID="lblResult" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle; height: 23px; font-size:16px; font-weight:700">새비밀번호</td>
            <td style="text-align:left; vertical-align:middle; height: 23px;">
                <asp:TextBox ID="txtPw1" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="비밀번호를 입력해 주세요." ControlToValidate="txtPw1" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle; width:100px; font-size:16px; font-weight:700">비밀번호확인</td>
            <td style="text-align:left; vertical-align:middle">
                 <asp:TextBox ID="txtPw2" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle">
                <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToCompare="txtPw1" ControlToValidate="txtPw2" ForeColor="#CC0000">*</asp:CompareValidator>
                </td>
            </tr>
        <tr>
            <td style="text-align:right; vertical-align:middle"></td>
            <td style="text-align:left; vertical-align:middle" colspan="2">
                 <asp:Button ID="SetPasswd" runat="server" Text="비밀번호변경" OnClick="SetPasswd_Click" Hegiht="25px" CssClass="btn btn-warning"/>
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

