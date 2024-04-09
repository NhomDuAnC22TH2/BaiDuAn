using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace BaiDuAn
{
    public partial class ThemSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLSHOPConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //Tạo sql để thêm nhân viên
            string sql = "insert into SANPHAM(TENSP,MAQG,GIA,PHAI,HINH,NGAYDANG,NGSINH ,SOLUOTXEM)" +
                " values(@tensp,@maqg,@gia,@phai,@hinh,@ngaydang,@ngaysinh,@soluotxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //Truyền giá trị cho các tham số truyền vào
            cmd.Parameters.AddWithValue("@tensp", txtTenSP.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            if (rdDuc.Checked)
                cmd.Parameters.AddWithValue("@phai", true);
            else
                cmd.Parameters.AddWithValue("@phai", false);
            if (FHinh.HasFile)
            {
                string duong_dan = Server.MapPath("~/hinh/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@soluotxem", txtSLX.Text);
            cmd.Parameters.AddWithValue("@ngaysinh", txtNgaySinh.Text);
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@maqg", ddlQG.SelectedValue);
            
            //Thực hiện câu lệnh truy vấn sql
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("ThuCung.aspx");
            else
                lblketqua.Text = "Thêm sách thất bại";
        }
    }
}