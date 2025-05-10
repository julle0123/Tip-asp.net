<%@ Page Title="" Language="C#" MasterPageFile="~/Community.master" AutoEventWireup="true" CodeFile="QnAshow.aspx.cs" Inherits="QnAshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%" border="1">
        <tr>
            <td style="background-color:#CCCCFF" colspan="7">
                <asp:Label runat="server" ID="label1" Text="QnA글 상세보기" Width="100%" style="font-family:'맑은 고딕'; font-size:24px; color:#ffffff;  text-align:center; font-weight:700; background:#000000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; color:#ffffff; background-color:#424242; border:3px solid black; ">제목</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#D8D8D8; border:3px solid black;">
                <asp:Label runat="server" ID="lblTitle"></asp:Label>
            </td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; color:#ffffff; background-color:#424242; border:3px solid black; ">작성자</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#D8D8D8; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblName"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; color:#ffffff; background-color:#424242; border:3px solid black; ">작성일</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#D8D8D8; border:3px solid black;">
                <asp:Label runat="server" ID="lblUploadDate"></asp:Label>
            </td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; color:#ffffff; background-color:#424242; border:3px solid black; ">조회수</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#D8D8D8; border:3px solid black;">
                <asp:Label runat="server" ID="lblHits"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 30px; text-align: center; font-family: '맑은 고딕'; font-size: 24px; font-weight:700; color:#ffffff; background-color:#000000; border:3px solid black;" colspan="7">내용</td>
        </tr>
        <tr>
            <td style="width:100%; height:400px; text-align:left; font-family:'맑은 고딕';font-size:18px; background-color:#D8D8D8; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblContents"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:500px; height: 50px; text-align: center; vertical-align: middle; background-color:#D8D8D8">
                <asp:Button runat="server" ID="btnList" Text="목록" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnList_Click" CssClass="btn btn-dark" />
                <asp:Button runat="server" ID="btnModify" Text="수정" style="width:70px; margin-left: 5px; margin-right: 5px" OnClick="btnModify_Click" CssClass="btn btn-dark"/>
                <asp:Button runat="server" ID="btnDelete" Text="삭제" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnDelete_Click" CssClass="btn btn-dark"/>
            </td>
            <td style="width:500px; height:50px; text-align:center; vertical-align:middle; background-color:#D8D8D8" colspan="7">
                <asp:Label runat="server" ID="lblMessage" style="color:#ff0000"></asp:Label>
            </td>
        </tr>
        </table>
     <table style="width:1000px" border="1">
<tr>
            <td style="text-align:center; vertical-align:middle" colspan="5">
                <asp:GridView ID="grvQnAReply" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="1000px" OnPageIndexChanging="grvQnAReply_PageIndexChanging">
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
                    <RowStyle BackColor="#D8D8D8" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#000000" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#000000" Font-Bold="true" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        <tr>
            <td style="text-align:center;  font-family:'맑은 고딕'; font-size:12px; font-weight:700; color:#ffffff; background-color:#000000"><b>댓글</b></td>
            <td style="text-align:left; vertical-align:middle" colspan="3">
                <asp:TextBox ID="txtReply" runat="server" Width="100%" Height="23px" MaxLength="50"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle; background-color:#D8D8D8">
                <asp:Button ID="btnOk" runat="server" style="font-family:'맑은 고딕'; font-size:small; font-weight:700" Text="확인" Height="28px" OnClick="btnOk_Click" CssClass="btn btn-dark"/>
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

