using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using QL_Kho.DT0;

namespace QL_Kho.Data
{
    class DAO
    {
        
        //thêm
        public static int them_CTN(ChiTietNhap a)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@maCTN", a.MaCTN),
                new SqlParameter("@maPN", a.MaPN),
                new SqlParameter("@maHH", a.MaHH),
                new SqlParameter("@soLuong", a.SoLuong),
                new SqlParameter("@donGia", a.DonGia),
            };
            return Dataprovider.ExecuteNonQuery("them_CTN", para);
        }
      
        public static int them_PN(PhieuNhap a)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@maPN", a.MaPN),
                new SqlParameter("@ngayNhap", a.NgayNhap),
                new SqlParameter("@tongTien", a.TongTien),
            };
            return Dataprovider.ExecuteNonQuery("them_PN", para);
        }
        
        //sua
        public static int sua_CTN(ChiTietNhap a)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@maCTN", a.MaCTN),
                new SqlParameter("@maPN", a.MaPN),
                new SqlParameter("@maHH", a.MaHH),
                new SqlParameter("@soLuong", a.SoLuong),
                new SqlParameter("@donGia", a.DonGia),

            };
            return Dataprovider.ExecuteNonQuery("sua_CTN", para);
        }
      
        public static int sua_PN(PhieuNhap a)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@maPN", a.MaPN),
                new SqlParameter("@ngayNhap", a.NgayNhap),
                new SqlParameter("@tongTien", a.TongTien),
            };
            return Dataprovider.ExecuteNonQuery("sua_PN", para);
        }
       
        //xóa
        public static int xoa_CTN(ChiTietNhap a)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@maCTN", a.MaCTN),


            };
            return Dataprovider.ExecuteNonQuery("xoa_CTN", para);
        }
        
       
        public static int xoa_PN(PhieuNhap a)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@maPN", a.MaPN),


            };
            return Dataprovider.ExecuteNonQuery("xoa_PN", para);
        }
        
        public static DataTable xuat_pn()
        {
            return Dataprovider.GetData("xuat_PN");
        }
        public static DataTable xuat_ctn(string ma)
        {
            return Dataprovider.GetData("xuat_CTN2" + "'" + ma + "'");
        }
        public static DataTable xuat_px()
        {
            return Dataprovider.GetData("xuat_PX");
        }
        public static DataTable xuat_ctx(string ma)
        {
            return Dataprovider.GetData("xuat_CTX2" + "'" + ma + "'");
        }
        public static DataTable xuat_hh()
        {
            return Dataprovider.GetData("xuat_HH");
        }
        public static DataTable xuat_hh_tk()
        {
            return Dataprovider.GetData("xuat_hh_tk");
        }
        public static DataTable xuat_ncc()
        {
            return Dataprovider.GetData("xuat_NCC");
        }
    }
}
