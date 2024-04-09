<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="ThuCung.aspx.cs" Inherits="BaiDuAn.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center">Danh sách Bé Yêu</h2>
    <div class="col-md-6">
           
            </div>
    <div class="row">
    <div class="col-md-3">
        <ul class="list-group">
            <a class="list-group-item active">Danh Mục</a>
            <asp:Repeater ID="rptMAQG" runat="server" DataSourceID="DSQG" OnItemCommand="rqtMAQG_ItemCommand" >
                <ItemTemplate>
                    <a href="ThuCung.aspx?MAQG=<%#Eval("MAQG") %>" class="list-group-item list-group-item-action"><%#Eval("QUOCGIA") %></a>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
     <div class="col-md-9 row" >
        <asp:ListView ID="lvSP" runat="server" DataSourceID="DSSP" >
            <ItemTemplate>
                <div class="col-4">
                    <a href="#">
                        <img src="hinh/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TENSP") %><br/>
                    Giá bán: <span class="price"><%# Eval("GIA","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btAddToCart" runat="server" CssClass="btn btn-info"
                        Text="Thêm vào giỏ" CommandArgument='<%# Eval("MASP") %>'
                        OnClick="btAddToCart_Click" />
                </div>
            </ItemTemplate>
           <%-- <EmptyDataTemplate>
                <div class="alert alert-info">
                    Không có sách bạn tìm
                </div>
            </EmptyDataTemplate>--%>
        </asp:ListView>
    </div>
    </div>       
    <asp:SqlDataSource ID="DSQG" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" 
        SelectCommand="SELECT * FROM [MAQG]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DSSP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" 
        SelectCommand="SELECT * FROM [SANPHAM] WHERE ([MAQG] = @MAQG) ">
        <SelectParameters>
         <asp:QueryStringParameter DefaultValue="5" Name="MAQG"  QueryStringField="MAQG" />
         
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
