﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
namespace BaiDuAn.Models
{
    public class Cart
    {
        //khai báo danh sách dùng để lưu trữ các sản phẩm (CartItem)
        private List<CartItem> _items;

        //phương thức khởi tạo giỏ hàng
        public Cart()
        {
            _items = new List<CartItem>();
        }
        //phương thức trả về danh sách các sản phẩm trong giỏ
        public List<CartItem> Items { get { return _items; } }
        //phương thức thêm sản phẩm vào giỏ
        public void Add(int masp)
        {
            //truy xuất CSDL để lấy thông tin về sản phẩm cần thêm vào giỏ hàng
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLSHOPConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from SANPHAM where MASP=@masp", conn);
            cmd.Parameters.AddWithValue("@masp", masp);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //tạo đối tượng CartItem
                CartItem sp = new CartItem
                {
                    MaSP = masp,

                    TenSP = dr["TENSP"].ToString(),
                    Hinh = dr["HINH"].ToString(),
                    DonGia = int.Parse(dr["GIA"].ToString()),

                    SoLuong = 1
                };
                //thêm vào giỏ (đề nghị sinh viên tự lập trình
                // cho trường hợp sản phẩm đã có trong giỏ)
                _items.Add(sp);
            }
        }
        //Phương thức cập nhật số lượng,
        public void Update(int masp, int soluong)
        {
            int index = findID(masp);
            if (index != -1)
            {
               if(soluong > 0)
                {
                    _items[index].SoLuong = soluong;
                }
                else
                {
                    _items.RemoveAt(index);
                }
            }
        }
        //phương thức xoá sản phẩm khỏi giỏ,
        public void Delete(int masp)
        {
            int index = findID(masp);
            if(index != -1 ){
                _items.RemoveAt(index);
            }
        }
        private int findID (int masp)
        {
            for(int i=0; i<_items.Count; i++)
            {
                if(_items[i].MaSP == masp)
                {
                    return i;
                }
            }
            return -1;
        }
        //tính tổng thành tiền
        public int Total
        {
            get
            {
                int tong = 0;
                foreach (CartItem item in _items)
                {
                    tong += item.ThanhTien;
                }
                return tong;
            }
        }
    }
}