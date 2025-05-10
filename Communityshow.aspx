<%@ Page Title="" Language="C#" MasterPageFile="~/Community.master" AutoEventWireup="true" CodeFile="Communityshow.aspx.cs" Inherits="bbsshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:100%" border="1">
        <tr>
            <td style="background-color:#CCCCFF" colspan="7">
                <asp:Label runat="server" ID="label1" Text="자유 게시판 글 상세보기" Width="100%" style="font-family:'맑은 고딕'; font-size:24px;  text-align:center; font-weight:700; background:#A9D0F5"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black; ">제목</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;">
                <asp:Label runat="server" ID="lblTitle"></asp:Label>
            </td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black; ">작성자</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblName"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black; ">작성일</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;">
                <asp:Label runat="server" ID="lblUploadDate"></asp:Label>
            </td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#81BEF7; border:3px solid black; ">조회수</td>
            <td style="width:20%; height:51px; text-align:center; font-family:'맑은 고딕'; font-size:16px; font-weight:700; background-color:#EFF5FB; border:3px solid black;">
                <asp:Label runat="server" ID="lblHits"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; height: 30px; text-align: center; font-family: '맑은 고딕'; font-size: 24px; font-weight:700; background-color:#81BEF7; border:3px solid black;" colspan="7">내용</td>
        </tr>
        <tr>
            <td style="width:100%; height:400px; text-align:left; font-family:'맑은 고딕';font-size:18px; background-color:#EFF5FB; border:3px solid black;" colspan="7">
                <asp:Label runat="server" ID="lblContents"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:500px; height: 50px; text-align: center; vertical-align: middle; background-color:#EFF5FB">
                <asp:Button runat="server" ID="btnList" Text="목록" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnList_Click" CssClass="btn btn-primary"/>
                <asp:Button runat="server" ID="btnModify" Text="수정" style="width:70px; margin-left: 5px; margin-right: 5px" OnClick="btnModify_Click" CssClass="btn btn-primary"/>
                <asp:Button runat="server" ID="btnDelete" Text="삭제" style="width:70px; margin-left:5px; margin-right:5px" OnClick="btnDelete_Click" CssClass="btn btn-primary"/>
            </td>
            <td style="width:500px; height:50px; text-align:center; vertical-align:middle; background-color:#EFF5FB" colspan="7">
                <asp:Label runat="server" ID="lblMessage" style="color:#ff0000"></asp:Label>
            </td>
        </tr>
        </table>
      <table style="width:1000px" border="1">
<tr>
            <td style="text-align:center; vertical-align:middle" colspan="5">
                <asp:GridView ID="grvbbsReply" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="1000px" OnPageIndexChanging="grvbbsReply_PageIndexChanging">
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
                    <RowStyle BackColor="#81BEF7" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#EFF5FB" ForeColor="black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#EFF5FB" Font-Bold="true" ForeColor="black" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        <tr>
            <td style="text-align:center;  font-family:'맑은 고딕'; font-size:12px; font-weight:700; background-color:#EFF5FB"><b>댓글</b></td>
            <td style="text-align:left; vertical-align:middle" colspan="3">
                <asp:TextBox ID="txtReply" runat="server" Width="100%" Height="23px" MaxLength="50"></asp:TextBox>
                </td>
            <td style="text-align:left; vertical-align:middle; background:#EFF5FB">
                <asp:Button ID="btnOk" runat="server" style="font-family:'맑은 고딕'; font-size:small; font-weight:700" Text="확인" Height="28px" OnClick="btnOk_Click" CssClass="btn btn-primary"/>
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

