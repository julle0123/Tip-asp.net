<%@ Page Title="" Language="C#" MasterPageFile="~/Community.master" AutoEventWireup="true" CodeFile="QnAlist.aspx.cs" Inherits="QnAlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
        <tr>
            <td style="text-align:left; vertical-align:top" colspan="2">
                <asp:Label runat="server" ID="lblTitle" BackColor="black" Font-Size="16px" Text="QnA게시판" Width="100%" Height="35px" style="font-family:'맑은 고딕'; font-weight: 700; font-size:24px; color:#ffffff; text-align:center;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:left; vertical-align:top" colspan="2">
                <asp:GridView runat="server" ID="grvBoard" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333"
                     GridLines="None" CaptionAlign="Bottom" style="font-family:'맑은 고딕'; font-size:small; width:100%" OnPageIndexChanging="grvBoard_PageIndexChanging" OnSelectedIndexChanged="grvBoard_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="no" HeaderText="번호" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                        <asp:HyperLinkField HeaderText="제목" DataNavigateUrlFields="no" DataNavigateUrlFormatString="QnAshow.aspx?no={0}" DataTextField="title"
                             ItemStyle-Width="50%" />
                        <asp:BoundField DataField="name" HeaderText="이름" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center"/>
                        <asp:TemplateField HeaderText="글쓴 날짜" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate> <%# Eval("uploadTime", "{0:yyyy년 MM달 dd일}") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="hits" HeaderText="조회" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    <RowStyle BackColor="#A4A4A4" />
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#585858" ForeColor="white" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="true" ForeColor="White" />
                    <HeaderStyle BackColor="#585858" Font-Bold="true" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width:80%; text-align:right; vertical-align:middle; background-color:#E6E6E6">
                <asp:Label runat="server" ID="lblMessage" ForeColor="Red" Width="300px"></asp:Label>
            </td>
            <td style="width:20%; text-align:center; vertical-align:middle; background-color:#E6E6E6">
                <asp:Button runat="server" ID="ibtnWrite" Width="130px" Height="31px" Text="작성" OnClick="ibtnWrite_Click" Visible="false" CssClass="btn btn-dark"/>
            </td>
        </tr>
        <tr>
            <td style="width:100%; height:10px; background-color:#000000" colspan="8">

            </td>
        </tr>
    </table>
</asp:Content>

