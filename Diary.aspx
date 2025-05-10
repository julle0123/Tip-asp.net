<%@ Page Title="" Language="C#" MasterPageFile="~/sProfile.master" AutoEventWireup="true" CodeFile="Diary.aspx.cs" Inherits="Diary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
        <tr>
            <td style="text-align:left; vertical-align:middle" colspan="3">
                <asp:Label ID="lblTitle" runat="server" Text="일정표" BackColor="#E6E0F8" style="font-family:'맑은 고딕'; font-size:medium; font-weight:700; margin-bottom:24px; text-align:center" Width="100%"></asp:Label>
                </td>
        </tr>
        <tr>
            <td style="text-align:center; vertical-align:middle; width:25%; height:300px">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="100%" Width="100%" OnSelectionChanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="#E0E0F8" Font-Bold="true" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="true" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#9F81F7" BorderColor="Black" Font-Bold="true" />
                    <TodayDayStyle BackColor="#819FF7" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#E0E0F8" ForeColor="#CC0000" />
                </asp:Calendar>
            </td>
            <td style="text-align:center; vertical-align:top" colspan="2">
                <asp:Label runat="server" ID="Label1" BackColor="LightBlue" Font-Size="16px" Text="프로젝트" Width="100%" Height="20px" style="font-family:'맑은 고딕'; font-weight: 700; background:#BCA9F5"></asp:Label>
                <asp:GridView runat="server" ID="grvBoard" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333"
                     GridLines="None" CaptionAlign="Bottom" style="font-family:'맑은 고딕'; font-size:small; width:100%" OnPageIndexChanging="grvBoard_PageIndexChanging" OnSelectedIndexChanged="grvBoard_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="no" HeaderText="번호" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                        <asp:HyperLinkField HeaderText="제목" DataNavigateUrlFields="no" DataNavigateUrlFormatString="Freeshow.aspx?no={0}" DataTextField="title"
                             ItemStyle-Width="50%" />
                        <asp:BoundField DataField="name" HeaderText="이름" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center"/>
                        <asp:TemplateField HeaderText="글쓴 날짜" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate> <%# Eval("uploadTime", "{0:yyyy년 MM달 dd일}") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="hits" HeaderText="조회" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    <RowStyle BackColor="#A9A9F5" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#E0E0F8" ForeColor="black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#CEF6D8" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#E0E0F8" Font-Bold="true" ForeColor="black" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>

        </tr>
        </table>
</asp:Content>

