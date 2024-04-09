<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="ThemSP.aspx.cs" Inherits="BaiDuAn.ThemSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2>TRANG THÊM SÁCH MỚI</h2>
    <hr />
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Tên Thú Cưng</label>
                <asp:TextBox ID="txtTenSP" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqTenSP" CssClass="text-danger" runat="server" ControlToValidate="txtTenSP" ErrorMessage="Tên thú cưng không được bỏ trống"></asp:RequiredFieldValidator>
            </div>
           <div class="row mb-2">
        <div class="col-md-2">Giới tính</div>
        <div class="col-md-10">
            <asp:RadioButton ID="rdDuc" runat="server" Checked="true" Text="Đực" GroupName="GT" />
            <asp:RadioButton ID="rdCai" runat="server" Text="Cái" GroupName="GT" />
        </div>
    </div>
        </div>
        <div class="form-group">
            <label style="display: block;">Ngày Sinh</label>
            <asp:TextBox ID="txtNgaySinh" type="date" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqNgaySinh" CssClass="text-danger" runat="server" ControlToValidate="txtNgaySinh" ErrorMessage="Ngày cập nhật không được bỏ trống"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label style="display: block;">Đơn giá</label>
            <asp:TextBox ID="txtGia" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqGia" CssClass="text-danger" runat="server" ControlToValidate="txtGia" ErrorMessage="Đơn giá không được bỏ trống"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="regGia" CssClass="text-danger" runat="server" ControlToValidate="txtGia" ErrorMessage="Đơn giá phải là kiểu số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />
            <asp:CompareValidator ID="compGia" runat="server" ErrorMessage="Đơn giá phải lớn hơn 0" ControlToValidate="txtGia" Type="Currency" ValueToCompare="0" Operator="GreaterThan" CssClass="text-danger"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <label style="display: block;">Ngày cập nhật</label>
            <asp:TextBox ID="txtNgayCapNhat" type="date" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqNgayCapNhat" CssClass="text-danger" runat="server" ControlToValidate="txtNgayCapNhat" ErrorMessage="Ngày cập nhật không được bỏ trống"></asp:RequiredFieldValidator>
        </div>
         <div class="form-group col-md-6">
                <label style="display: block;">Số lượt xem</label>
                <asp:TextBox ID="txtSLX" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqSLX" CssClass="text-danger" runat="server" ControlToValidate="txtSLX" ErrorMessage="Tên thú cưng không được bỏ trống"></asp:RequiredFieldValidator>
            </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Hình</label>
                <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file"></asp:FileUpload>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label style="display: block;">Danh mục QG</label>
                <asp:DropDownList ID="ddlQG" CssClass="text-center" runat="server" DataSourceID="DSQG" DataTextField="QUOCGIA" DataValueField="MAQG"></asp:DropDownList>
                <asp:SqlDataSource ID="DSQG" runat="server" ConnectionString="<%$ ConnectionStrings:QLSHOPConnectionString %>" SelectCommand="SELECT * FROM [MAQG]"></asp:SqlDataSource>
            </div>
        </div>
        
        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary"  Text="Thêm" OnClick="btnSave_Click" />
        <asp:Label ID="lblketqua" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
