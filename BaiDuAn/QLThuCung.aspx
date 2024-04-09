<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="QLThuCung.aspx.cs" Inherits="BaiDuAn.QLThuCung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <div class="form-inline">
          <a href="ThemSP.aspx" class="btn btn-primary">Thêm sách mới</a>
        </div>

    </div>
    <asp:SqlDataSource ID="DSSP" runat="server" ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" DeleteCommand="DELETE FROM [SANPHAM] WHERE [MASP] = @MASP" InsertCommand="INSERT INTO [SANPHAM] ([MASP], [TENSP], [PHAI], [MAQG], [NGSINH], [GIA], [NGAYDANG], [SOLUOTXEM], [HINH]) VALUES (@MASP, @TENSP, @PHAI, @MAQG, @NGSINH, @GIA, @NGAYDANG, @SOLUOTXEM, @HINH)" SelectCommand="SELECT * FROM [SANPHAM]" UpdateCommand="UPDATE [SANPHAM] SET [TENSP] = @TENSP, [PHAI] = @PHAI, [MAQG] = @MAQG, [NGSINH] = @NGSINH, [GIA] = @GIA, [NGAYDANG] = @NGAYDANG, [SOLUOTXEM] = @SOLUOTXEM, [HINH] = @HINH WHERE [MASP] = @MASP">
        <DeleteParameters>
            <asp:Parameter Name="MASP" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MASP" Type="Int32" />
            <asp:Parameter Name="TENSP" Type="String" />
            <asp:Parameter Name="PHAI" Type="Boolean" />
            <asp:Parameter Name="MAQG" Type="String" />
            <asp:Parameter Name="NGSINH" Type="DateTime" />
            <asp:Parameter Name="GIA" Type="Double" />
            <asp:Parameter Name="NGAYDANG" Type="DateTime" />
            <asp:Parameter Name="SOLUOTXEM" Type="Int32" />
            <asp:Parameter Name="HINH" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENSP" Type="String" />
            <asp:Parameter Name="PHAI" Type="Boolean" />
            <asp:Parameter Name="MAQG" Type="String" />
            <asp:Parameter Name="NGSINH" Type="DateTime" />
            <asp:Parameter Name="GIA" Type="Double" />
            <asp:Parameter Name="NGAYDANG" Type="DateTime" />
            <asp:Parameter Name="SOLUOTXEM" Type="Int32" />
            <asp:Parameter Name="HINH" Type="String" />
            <asp:Parameter Name="MASP" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="dvSP" runat="server" AutoGenerateColumns="False" DataKeyNames="MASP" DataSourceID="DSSP" Width="1412px">
        <Columns>
           
            <asp:BoundField DataField="MASP" HeaderText="MASP" ReadOnly="True" SortExpression="MASP" />
            <asp:BoundField DataField="TENSP" HeaderText="TENSP"  SortExpression="TENSP" />
            <asp:CheckBoxField DataField="PHAI" HeaderText="PHAI" SortExpression="PHAI" />
            <asp:BoundField DataField="MAQG" HeaderText="MAQG"  SortExpression="MAQG" />
            <asp:BoundField DataField="NGSINH" HeaderText="NGSINH"  SortExpression="NGSINH" />
            <asp:BoundField DataField="GIA" HeaderText="GIA" SortExpression="GIA" />
            <asp:BoundField DataField="NGAYDANG" HeaderText="NGAYDANG"   SortExpression="NGAYDANG" />
            <asp:BoundField DataField="SOLUOTXEM" HeaderText="SOLUOTXEM" SortExpression="SOLUOTXEM" />
           <asp:ImageField ItemStyle-HorizontalAlign="Center" DataImageUrlField="hinh"
                DataImageUrlFormatString="hinh/{0}" ReadOnly="true"
                HeaderText="Ảnh sản phẩm" ControlStyle-Width="100px">
            </asp:ImageField>
             <asp:TemplateField ItemStyle-Wrap="false">
                 <ItemTemplate>
                     <asp:Button ID="btSua" runat="server" CssClass="btn btn-success" CommandName="Edit" Text="Sửa" />
                     <asp:Button ID="btXoa" OnClientClick="return confirm('Bạn có muốn xoá sách này?')" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Xoá" />
                 </ItemTemplate>
                <EditItemTemplate>
                       <asp:Button ID="btCapnhat" runat="server" CssClass="btn btn-success" CommandName="Update" Text="Ghi" />
                       <asp:Button ID="btKhong" runat="server" CssClass="btn btn-warning" CommandName="Cancel" Text="Không" />
                </EditItemTemplate>
          <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div class="alert alert-info">
                Không có sách bạn tìm
            </div>
        </EmptyDataTemplate>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

</asp:Content>
