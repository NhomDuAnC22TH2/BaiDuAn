<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="ThuCung.aspx.cs" Inherits="BaiDuAn.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center">Danh sách Bé Yêu</h2>
     <div class="form-inline">
        chọn danh mục:<asp:DropDownList ID="ddlquocgiatc" runat="server" DataSourceID="DSQG" DataTextField="QUOCGIA" DataValueField="MAQG" AutoPostBack="True"></asp:DropDownList>
    </div>
     <div class="row mt-2">
        <asp:Repeater ID="rqtSP" runat="server" DataSourceID="DSSP" OnItemCommand="rqtSP_ItemCommand">
            <ItemTemplate>
                <div class=" col-md-3 mt-2 text-center">
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
        </asp:Repeater>
    </div>
            
    <asp:SqlDataSource ID="DSQG" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" 
        SelectCommand="SELECT * FROM [MAQG]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DSSP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" 
        SelectCommand="SELECT * FROM [SANPHAM] WHERE ([MAQG] = @MAQG)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlquocgiatc" Name="MAQG" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
