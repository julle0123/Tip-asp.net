<%@ Page Title="" Language="C#" MasterPageFile="~/Mypage.master" AutoEventWireup="true" CodeFile="restore.aspx.cs" Inherits="restore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width:100%; height:500px">
        <tr style="text-align:center; vertical-align:middle; background-color:#f7f9fb">
            <td style="width:500px; height:400px">
                <asp:Label runat="server" ID="Label1" Font-Size="24px" Font-Bold="true">고객</asp:Label><br /><br />
               <asp:Label ID="lblIdC" runat="server" style="font-size:16px; font-weight:700;" >이메일 : </asp:Label>
                <asp:TextBox ID="txtIdC" runat="server" CssClass="form-control form-control-lg"></asp:TextBox><br /><br />

                <asp:Label ID="lblnameC" runat="server" style="font-size:16px; font-weight:700;" >이름 : </asp:Label>
                <asp:TextBox ID="txtNameC" runat="server" CssClass="form-control form-control-lg"></asp:TextBox><br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAuthenticateC" runat="server" Text="본인인증" OnClick="btnAuthenticate_Click" CausesValidation="false" Height="25px" CssClass="btn btn-primary" style="margin-right:5px"/>
                <asp:Button ID="btnCancelC" runat="server" Text="취소" OnClick="btnCancel_Click" Height="25px" CausesValidation="false" CssClass="btn btn-danger"/>
                <asp:Label ID="lblResultC" runat="server" ForeColor="#CC0000"></asp:Label>

                <br /><br />
                <asp:Label ID="lblpassC" runat="server" style="font-size:16px; font-weight:700;">비밀번호 : </asp:Label>
                <asp:TextBox ID="txtPw1C" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox><br />
                 <asp:Label ID="lblpassCheckC" runat="server" ForeColor="#CC0000"></asp:Label>&nbsp; <br />

                 <asp:Label ID="lblpass2C" runat="server" style="font-size:16px; font-weight:700;" >비밀번호 확인: </asp:Label>
                 <asp:TextBox ID="txtPw2C" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidatorC" runat="server" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToCompare="txtPw1C" ControlToValidate="txtPw2C" ForeColor="#CC0000">*</asp:CompareValidator><br /><br />
  
                 <asp:Button ID="SetRestoreC" runat="server" Text="복구" OnClick="SetRestore_Click" style="margin-bottom:5px" CssClass="btn btn-warning"/>

                <asp:ValidationSummary ID="ValidationSummary1C" runat="server" ForeColor="#CC0000" />

                </td>
              <td style="width:500px; height:400px">
                  <asp:Label runat="server" ID="lblFree" Font-Size="24px" Font-Bold="true">프리랜서</asp:Label><br /><br />
               <asp:Label ID="lblIdF" runat="server" style="font-size:16px; font-weight:700;" >이메일 : </asp:Label>
                <asp:TextBox ID="txtIdF" runat="server" CssClass="form-control form-control-lg"></asp:TextBox><br /><br />

                <asp:Label ID="lblnameF" runat="server" style="font-size:16px; font-weight:700;" >이름 : </asp:Label>
                <asp:TextBox ID="txtNameF" runat="server" CssClass="form-control form-control-lg"></asp:TextBox><br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAuthenticateF" runat="server" Text="본인인증" OnClick="btnAuthenticateF_Click" CausesValidation="false" Height="25px" CssClass="btn btn-primary" style="margin-right:5px"/>
                <asp:Button ID="btnCancelF" runat="server" Text="취소" OnClick="btnCancelF_Click" CausesValidation="false" CssClass="btn btn-danger"/>
                <asp:Label ID="lblResultF" runat="server" ForeColor="#CC0000"></asp:Label>

                <br /><br />
                <asp:Label ID="lblpassF" runat="server" style="font-size:16px; font-weight:700;" >비밀번호 : </asp:Label>
                <asp:TextBox ID="txtPw1F" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox><br />
                <asp:Label ID="lblpassCheckF" runat="server" ForeColor="#CC0000"></asp:Label>&nbsp; <br />

                 <asp:Label ID="lblpass2F" runat="server" style="font-size:16px; font-weight:700;" >비밀번호 확인: </asp:Label>
                 <asp:TextBox ID="txtPw2F" runat="server" TextMode="Password" CssClass="form-control form-control-lg"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidatorF" runat="server" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToCompare="txtPw1F" ControlToValidate="txtPw2F" ForeColor="#CC0000">*</asp:CompareValidator><br /><br />
  
                 <asp:Button ID="SetRestoreF" runat="server" Text="복구" OnClick="SetRestoreF_Click" style="height: 25px" CssClass="btn btn-warning"/>

                <asp:ValidationSummary ID="ValidationSummary1F" runat="server" ForeColor="#CC0000" />

                </td>
            </tr>

        </table>
    
</asp:Content>
