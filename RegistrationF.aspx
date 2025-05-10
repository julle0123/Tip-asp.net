<%@ Page Title="" Language="C#" MasterPageFile="~/sProfile.master" AutoEventWireup="true" CodeFile="RegistrationF.aspx.cs" Inherits="RegistrationF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%; height:500px">
        <tr style="text-align:center; vertical-align:middle; background-color:#f7f9fb">
            <td ><br />
                <asp:Image runat="server" ID="imgFree" ImageUrl="~/img/career.png" Width="100px" Height="100px" style="border-radius:50%!important; box-shadow:0 4px 8px 0px #d5d5d5"/><br /><br />
                <asp:Label runat="server" ID="lblRegisF" Font-Size="24px" Font-Bold="true" style="margin-right:210px;">프리랜서 회원가입</asp:Label><br /><br />
                <asp:Label runat="server" ID="lblEmail" Font-Size="14px" Font-Bold="true" style="margin-right:330px;">이메일 주소</asp:Label><br />
                <asp:TextBox runat="server" ID="txtEmail" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblPasswd" Font-Size="14px" Font-Bold="true" style="margin-right:350px;">비밀번호</asp:Label><br />
                <asp:TextBox runat="server" ID="txtPasswd" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblAddress" Font-Size="14px" Font-Bold="true" style="margin-right:375px;">주소</asp:Label><br />
                <asp:TextBox runat="server" ID="txtAddress" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblPhone" Font-Size="14px" Font-Bold="true" style="margin-right:350px;">전화번호</asp:Label><br />
                <asp:TextBox runat="server" ID="txtPhone" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblName" Font-Size="14px" Font-Bold="true" style="margin-right:375px;">이름</asp:Label><br />
                <asp:TextBox runat="server" ID="txtName" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblCareer" Font-Size="14px" Font-Bold="true" style="margin-right:240px;">귀하의 경력을 적어주세요.</asp:Label><br />
                <asp:TextBox runat="server" ID="txtCareer" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br /><br />
                <asp:Label runat="server" ID="lblPart" Font-Size="14px" Font-Bold="true" style="margin-right:250px;">작업파트를 적어주세요.</asp:Label><br />
                <asp:TextBox runat="server" ID="txtPart" Width="400px" Height="25px" style="margin-top:5px; text-align:left" ></asp:TextBox><br /><br />
                <asp:CheckBox runat="server" ID="chkOk"/>찬성할건가요? 이용 약관 동의<br /><br />
                <asp:Button runat="server" ID="BtnRegistratio" Width="405px" Height="40px" Text="회원가입" Font-Bold="true" Font-Size="18px" OnClick="BtnRegistration_Click" CssClass="btn btn-primary"/><br /><br />계정이 이미 있습니까? 
                <asp:HyperLink runat="server" ID="HyperLink1" Text="로그인" NavigateUrl="~/Login.aspx"></asp:HyperLink><br /><br /><br />
            </td>
        </tr>
    </table>
</asp:Content>

