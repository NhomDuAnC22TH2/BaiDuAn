using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BaiDuAn
{
    public partial class DangNhap : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string encryption(String password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            //encrypt the given password string into Encrypted data  
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            //Create a new string by using the encrypted data  
            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdata.Append(encrypt[i].ToString());
            }
            return encryptdata.ToString();
        }
        //Kết thúc hàm dùng để mã hóa password theo chuẩn MD5

        //Đây là button đăng nhập
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string email = TENTK.Text;
            string password = MKHAU.Text;
            string password_md5 = encryption(password);
            if (email.Length > 0 && password.Length > 0)
            {
                string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLSHOPConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(chuoi_ket_noi);

                conn.Open();
                string sql = "SELECT * FROM USERS WHERE TENTK = @Email AND MKHAU = @Password";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password_md5);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {

                        string text = "Chào mừng " + String.Format("{0}", reader["HOTEN"]);
                        DangNhap.MessageBox(this, text);
                        Session["ktDangNhap"] = 1;
                        Session["name"] = (string)reader["HOTEN"];
                        Boolean checkNhanVien = (Boolean)reader["KTRANV"];

                        if (checkNhanVien == true)
                        {
                            Session["ktNhanVien"] = 1;
                        }
                        else
                        {
                            Session["ktNhanVien"] = 0;
                        }
                        Response.Redirect("ThuCung.aspx");
                    }
                    else
                    {
                        Session["ktDangNhap"] = 0;
                        DangNhap.MessageBox(this, "Đăng nhập thất bại !");
                    }
                }
                //if (count > 0)
                //{
                //    Test.MessageBox(this, "Đăng nhập thành công !");
                //}
                //else
                //{
                //    Test.MessageBox(this, "Đăng nhập thất bại !");

                //}
            }
        }
        //Kết thúc button đăng nhập


        //Đây là button đăng ký
     
        //Kết thúc button đăng ký

        //Hàm dùng để xuất thông báo
        public static void MessageBox(System.Web.UI.Page page, string strMsg)
        {
            //+ character added after strMsg "')"
            ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "alertMessage", "alert('" + strMsg + "')", true);

        }


        // Kết thúc hàm dùng để xuất thông báo
    }
}
