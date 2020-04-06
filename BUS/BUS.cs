using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QL_Kho.DT0;
using QL_Kho.Data;
using System.Data;

namespace QL_Kho.BUS
{
    class BUS
    {
        
        public static int sua_PN(PhieuNhap a)
        {
            return DAO.sua_PN(a);
        }
       
        //xoa
        public static int xoa_CTN(ChiTietNhap a)
        {
            return DAO.xoa_CTN(a);
        }
        
        public static int xoa_PN(PhieuNhap a)
        {
            return DAO.xoa_PN(a);
        }
        
        //Thêm
        public static int them_ctn(ChiTietNhap a)
        {
            return DAO.them_CTN(a);
        }
      
        public static int them_pn(PhieuNhap a)
        {
            return DAO.them_PN(a);
        }
      

    }
}
