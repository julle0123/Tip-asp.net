<%@ Page Title="" Language="C#" MasterPageFile="~/sProfile.master" AutoEventWireup="true" CodeFile="Clientshow.aspx.cs" Inherits="Clientshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:100%" border="1">
        <tr>
            <td style="background-color:#CCCCFF; border:solid; border-color:black; border-width:3px"" colspan="7">
                <asp:Label runat="server" ID="label1" Text="고객 프로젝트 글 상세보기" Width="100%" style="font-family:'맑은 고딕'; font-size:24px;  text-align:center; font-weight:700; background:#86B404"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#E6F8E0; border:3px solid black; ">제목</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#ECF8E0; border:3px solid black;">
                <asp:Label runat="server" ID="lblTitle"></asp:Label>
            </td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#E6F8E0; border:3px solid black;">작성자</td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#ECF8E0; border:3px solid black" colspan="5">
                <asp:Label runat="server" ID="lblName"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:10%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#E6F8E0; border:3px solid black;">작성일</td>
            <td style="width:10%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#ECF8E0; border:3px solid black;">
                <asp:Label runat="server" ID="lblUploadDate"></asp:Label>
            </td>
            <td style="width:5%; height:51px; text-align:center;  font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#E6F8E0; border:3px solid black;">조회수</td>
            <td style="width: 3%; height: 51px; text-align: center; font-family: '맑은 고딕'; font-size:16px; font-weight:700; background-color:#ECF8E0; border:3px solid black;">
                <asp:Label runat="server" ID="lblHits"></asp:Label>
            </td>
            <td style="width:5%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; background-color:#E6F8E0; border:3px solid black;">첨부</td>
            <td style="width: 150px; height: 51px; text-align: center; font-family: '맑은 고딕'; font-size:16px; font-weight:700; background-color:#ECF8E0; border:3px solid black;">
                <asp:Label runat="server" ID="lblFname"></asp:Label>
            </td>
            <td style="width:100px; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#E6F8E0" colspan="7">
                <asp:HyperLink runat="server" ID="hyperDownload" Text="Download" NavigateUrl="~/download.aspx" Target="_blank" Visible="false"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 30px; text-align: center; font-family: '맑은 고딕'; font-size: 24px; font-weight:700; background-color:#E6F8E0; border:3px solid black;" colspan="7">내용</td>
        </tr>
        <tr>
            <td style="width:100%; height:400px; text-align:left; font-family:'맑은 고딕';font-size:18px; background-color:#ECF8E0; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblContents"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:500px; height: 50px; text-align: center; vertical-align: middle; background-color:#ECF8E0; border:3px solid black;">
                <asp:Button runat="server" ID="btnList" Text="목록" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnList_Click" CssClass="btn btn-success"/>
                <asp:Button runat="server" ID="btnModify" Text="수정" style="width:70px; margin-left: 5px; margin-right: 5px" OnClick="btnModify_Click" CssClass="btn btn-success"/>
                <asp:Button runat="server" ID="btnDelete" Text="삭제" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnDelete_Click" CssClass="btn btn-success"/>
            </td>
            <td style="width:500px; height:50px; text-align:center; vertical-align:middle; background-color:#ECF8E0; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblMessage" style="color:#ff0000"></asp:Label>
            </td>
        </tr>
        </table>
     <table style="width:1000px" border="1">
           <tr>
            <td style="text-align:center; vertical-align:middle" colspan="5">
                <asp:GridView ID="grvClientProReply" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%" OnPageIndexChanging="grvClientProReply_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="작성자">
                            <ItemTemplate><b><%#Eval("name") %></b></ItemTemplate>
                            <ItemStyle Width="100px" HorizontalAlign="Center"/>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="내용">
                            <ItemTemplate>
                                <%#Eval("contents") %>
                               <!-- <a href='mailto:<%#Eval("name") %>'><%#Eval("name") %></a>-->
                                [<%#Eval("uploaddate","{0:yyyy/MM/dd}") %>]
                                </ItemTemplate>
                            <ItemStyle Width="550px" HorizontalAlign="Left" />
                            </asp:TemplateField>
                        </Columns>
                    <RowStyle BackColor="#D8F781" ForeColor="#333333" />
                    <FooterStyle BackColor="#4B8A08" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#86B404" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#86B404" Font-Bold="true" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        <tr>
            <td style="text-align:center;  font-family:'맑은 고딕'; font-size:12px; font-weight:700; background-color:#D0F5A9"><b>댓글</b></td>
            <td style="text-align:left; vertical-align:middle" colspan="3">
                <asp:TextBox ID="txtReply" runat="server" Width="100%" Height="23px" MaxLength="50" OnTextChanged="txtReply_TextChanged"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle">
                <asp:Button ID="btnOk" runat="server" style="font-family:'맑은 고딕'; font-size:small; font-weight:700" Text="확인" Height="28px" OnClick="btnOk_Click" CssClass="btn btn-success"/>
                </td>
            </tr>
        <tr>
            <td></td>
            <td style="text-align:left; vertical-align:middle">
                <asp:Label ID="Label2" runat="server" ForeColor="#CC0000" style="font-family:'맑은 고딕'; font-size:small; "></asp:Label>
                </td>
            <!--
            <td style="text-align:left; vertical-align:middle" colspan="3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReply" ErrorMessage="댓글을 입력해 주세요..." style="font-family:'맑은 고딕'; font-size:small; font-weight:700"></asp:RequiredFieldValidator>
                </td>
            -->
            </tr>
        </table>
</asp:Content>

