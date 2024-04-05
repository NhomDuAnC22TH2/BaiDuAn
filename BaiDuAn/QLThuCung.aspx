<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="QLThuCung.aspx.cs" Inherits="BaiDuAn.QLThuCung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <asp:BoundField DataField="TENSP" HeaderText="TENSP" SortExpression="TENSP" />
            <asp:CheckBoxField DataField="PHAI" HeaderText="PHAI" SortExpression="PHAI" />
            <asp:BoundField DataField="MAQG" HeaderText="MAQG" SortExpression="MAQG" />
            <asp:BoundField DataField="NGSINH" HeaderText="NGSINH" SortExpression="NGSINH" />
            <asp:BoundField DataField="GIA" HeaderText="GIA" SortExpression="GIA" />
            <asp:BoundField DataField="NGAYDANG" HeaderText="NGAYDANG" SortExpression="NGAYDANG" />
            <asp:BoundField DataField="SOLUOTXEM" HeaderText="SOLUOTXEM" SortExpression="SOLUOTXEM" />
           <asp:ImageField ItemStyle-HorizontalAlign="Center" DataImageUrlField="hinh"
                DataImageUrlFormatString="hinh/{0}"
                HeaderText="Ảnh sản phẩm" ControlStyle-Width="150px">
            </asp:ImageField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"/>
        </Columns>
    </asp:GridView>
    
</asp:Content>
