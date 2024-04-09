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
    public partial class DangKy : System.Web.UI.Page
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
        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            string Ten = HOTEN.Text;
            string email = TENTK.Text;
            string password = MKHAU.Text;
            string password_md5 = encryption(password);
            if (email.Length > 0 && password.Length > 0)
            {
                string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLSHOPConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(chuoi_ket_noi);

                conn.Open();

                string sql = "INSERT INTO USERS(HOTEN,TENTK,MKHAU,KTRANV) values (@Ten,@Email,@Password,@KTraNV)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Ten", Ten);
                cmd.Parameters.AddWithValue("@Email", email);


                cmd.Parameters.AddWithValue("@Password", password_md5);
                cmd.Parameters.AddWithValue("@KTraNV", 0);

                int check = cmd.ExecuteNonQuery();
                if (check > 0)
                {
                    DangKy.MessageBox(this, "Đăng ký thành công !");
                }
                else
                {
                    DangKy.MessageBox(this, "Đăng ký thất bại !");
                }

            }
        }
        public static void MessageBox(System.Web.UI.Page page, string strMsg)
        {
            //+ character added after strMsg "')"
            ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "alertMessage", "alert('" + strMsg + "')", true);

        }
    }
}