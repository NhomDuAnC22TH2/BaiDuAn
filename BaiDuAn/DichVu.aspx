<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="DichVu.aspx.cs" Inherits="BaiDuAn.DichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row mt-2">
        <asp:Repeater ID="rqtDV" runat="server" DataSourceID="DSDV" >
            <ItemTemplate>
                <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="hinh/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TENDV") %><br/>
                    Giá bán: <span class="price"><%# Eval("GIA","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btDV" runat="server" CssClass="btn btn-info"
                        Text="Thêm vào giỏ" CommandArgument='<%# Eval("MADV") %>'
                        OnClick="btDV_Click" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="DSDV" runat="server" ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" SelectCommand="SELECT * FROM [DICHVU]"></asp:SqlDataSource>
</asp:Content>
