<%@ Page Title="" Language="C#" MasterPageFile="~/sProfile.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%; height:300px;">
        <tr>
            <td style="text-align:center; width:100%;vertical-align:top; font-size:16px" colspan="2">
                <asp:Label runat="server" ID="lblTitle" BackColor="#FFBF00" Text="이달의 프로젝트" Width="100%" style="margin-bottom:0px; font-weight: 700; color:black" Height="25px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; vertical-align:top; width:50%; height:200px" colspan="1">
                <asp:GridView runat="server" ID="grvclient" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CaptionAlign="Bottom" 
                    style="font-family: '맑은 고딕'; font-size: small;" OnPageIndexChanging="grvclient_PageIndexChanging"  Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="글쓴 날짜" ItemStyle-Width="50%" ItemStyle-HorizontalAlign="left"><ItemTemplate> <%# Eval("uploadTime", "{0:yyyy년 MM달 dd일}") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField HeaderText="제목" DataNavigateUrlFields="no" DataNavigateUrlFormatString="Clientshow.aspx?no={0}" DataTextField="title" ItemStyle-Width="50%" ><ItemStyle Width="50%"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>

                    <RowStyle BackColor="#F5DA81" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#F5ECCE" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#F5ECCE" Font-Bold="true" ForeColor="Black" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>

            <td style="text-align:center; vertical-align:top; width:50%; height:200px" colspan="2">
                <asp:GridView runat="server" ID="grvfree" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CaptionAlign="Bottom" 
                    style="font-family:'맑은 고딕'; font-size:small; " OnPageIndexChanging="grvclient_PageIndexChanging"  Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="글쓴 날짜" ItemStyle-Width="50%" ItemStyle-HorizontalAlign="left"><ItemTemplate> <%# Eval("uploadTime", "{0:yyyy년 MM달 dd일}") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField HeaderText="제목" DataNavigateUrlFields="no" DataNavigateUrlFormatString="Freeshow.aspx?no={0}" DataTextField="title" ItemStyle-Width="50%" ><ItemStyle Width="100%"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>

                    <RowStyle BackColor="#F5DA81" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#F5ECCE" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#F5ECCE" Font-Bold="true" ForeColor="Black" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>