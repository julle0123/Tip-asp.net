﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Community.master" AutoEventWireup="true" CodeFile="Communitylist.aspx.cs" Inherits="bbslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <table style="width:100%">
        <tr>
            <td style="text-align:left; vertical-align:top" colspan="2">
                <asp:Label runat="server" ID="lblTitle" BackColor="#A9E2F3" Font-Size="16px" Text="고객 프로젝트" Width="100%" Height="25px" style="font-family:'맑은 고딕'; font-weight: 700; text-align:center"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:left; vertical-align:top" colspan="2">
                <asp:GridView runat="server" ID="grvBoard" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333"
                     GridLines="None" CaptionAlign="Bottom" style="font-family:'맑은 고딕'; font-size:small; width:100%; top: 1px; left: 0px;" OnPageIndexChanging="grvBoard_PageIndexChanging" OnSelectedIndexChanged="grvBoard_SelectedIndexChanged"  CssClass="alert alert-primary">
                    <Columns>
                        <asp:BoundField DataField="no" HeaderText="번호" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                        <asp:HyperLinkField HeaderText="제목" DataNavigateUrlFields="no" DataNavigateUrlFormatString="Communityshow.aspx?no={0}" DataTextField="title"
                             ItemStyle-Width="50%" />
                        <asp:BoundField DataField="name" HeaderText="이름" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center"/>
                        <asp:TemplateField HeaderText="글쓴 날짜" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate> <%# Eval("uploadTime", "{0:yyyy년 MM달 dd일}") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="hits" HeaderText="조회" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    <RowStyle BackColor="#E0F2F7" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                    <PagerStyle BackColor="#EFF5FB" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                    <HeaderStyle BackColor="#EFF5FB" Font-Bold="true" ForeColor="Black" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width:80%; text-align:right; vertical-align:middle; background-color:#EFF8FB; height: 32px;">
                <asp:Label runat="server" ID="lblMessage" ForeColor="Red" Width="300px"></asp:Label>
            </td>
            <td style="width:20%; text-align:center; vertical-align:middle; background-color:#EFF8FB; height: 32px;">
                <asp:Button runat="server" ID="ibtnWrite" Width="130px" Height="31px" Text="작성" OnClick="ibtnWrite_Click" Visible="false" style="background-color:#A9D0F5; color:black; font-size:16px; font-weight: 700; border:none" CssClass="btn btn-primary"/>
            </td>
        </tr>
        <tr>
            <td style="width:100%; height:5px; background-color:#A9E2F3; text-align:center" colspan="8"></td>
        </tr>
    </table>
</asp:Content>