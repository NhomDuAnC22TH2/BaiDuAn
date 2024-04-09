﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="BaiDuAn.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
						<img src="hinh/logo_pet_yeu.png" alt="" height="100"/>
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
							<form method="POST" class="needs-validation" novalidate="" autocomplete="off">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="name">Name</label>
									<asp:TextBox id="HOTEN" type="text" class="form-control" name="name" value="" required autofocus runat="server" />
									<div class="invalid-feedback">
										Name is required	
									</div>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">E-Mail Address</label>
									<asp:TextBox id="TENTK" type="email" class="form-control" name="email" value="" required runat="server" />
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="password">Password</label>
									<asp:TextBox id="MKHAU" type="password" class="form-control" name="password" required runat="server" />
								    <div class="invalid-feedback">
								    	Password is required
							    	</div>
								</div>
								<div class="d-flex align-items-center">
									<div class="form-check">
										<input type="checkbox" name="admin" id="admin" class="form-check-input">
										<label for="admin" class="form-check-label">Admin</label>
									</div>
								</div>
								<p class="form-text text-muted mb-3">
									By registering you agree with our terms and condition.
								</p>
							
								<div class="align-items-center d-flex">
	<asp:button type="submit" id="submit" class="btn btn-primary ms-auto" onclick="btnDangKy_Click" runat="server" Text="Register">
									
									</asp:button>
								</div>
								
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Already have an account? <a href="DangNhap.aspx" class="text-dark">Login</a>
							</div>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">
						Copyright &copy; 2017-2021 &mdash; Your Company 
					</div>
				</div>
			</div>
		</div>
	</section>

</asp:Content>
