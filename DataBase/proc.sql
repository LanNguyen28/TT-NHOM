alter proc xoa_PX(@maPX char(10))
as
begin
delete Chitietxuat
where maPX=@maPX
delete PhieuXuat
where maPX = @maPX
end
go
create proc xuat_CTX2(@maPX char(10))
as
begin

select maCTX as [Mã CTX],maHH as [Mã Hàng Hóa],soLuong as [Số Lượng],donGia as [Đơn giá] from Chitietxuat
where maPX=@maPX
end
go
create trigger tt_x on Chitietxuat for update,insert,delete
as
begin
declare @MAPXCU char(10),@MAPXMOI char(10)
select @MAPXCU=maPX from deleted
select @MAPXMOI=maPX from inserted
update PhieuXuat
set tongTien=(select sum(donGia*soLuong) from Chitietxuat  where maPX=@MAPXMOI)
where maPX=@MAPXMOI
update PhieuXuat
set tongTien=(select sum(donGia*soLuong) from Chitietxuat  where maPX=@MAPXCU)
where maPX=@MAPXCU
end
go


update HangHoa
set soluong= slhh
from (select HH.MaHH, (CTN.soLuong-CTX.soLuong) as slhh from HangHoa HH, Chitietnhap CTN, Chitietxuat CTX where HH.maHH=CTN.maHH and HH.maHH=CTX.maHH group by HH.maHH, CTN.soLuong, CTX.soLuong)
as A
where HangHoa.maHH=A.maHH


go

create proc tk_xuat
as
 begin
 select HH.maHH as N'Mã HH', tenHH as N'Tên HH', tenNCC as N'Tên NCC',sum(CTX.soluong) as 'SL Xuất', donGia as N'Đơn giá', sum(CTX.donGia*CTX.soLuong) as N'Tiền Xuất'
 from HangHoa HH, NCC,  Chitietxuat  CTX
 where HH.maNCC=NCC.maNCC and HH.maHH=CTX.maHH
 group by HH.maHH, tenHH, tenNCC, donGia
 end


 go
 create proc tk_nhap
 as
 begin
 select HH.maHH as N'Mã HH', tenHH as N'Tên HH', tenNCC as N'Tên NCC',sum(CTN.soluong) as 'SL Nhập', donGia as N'Đơn giá', sum(CTN.donGia*CTN.soLuong) as N'Tiền Nhập'
 from HangHoa HH, NCC,  Chitietnhap  CTN
 where HH.maNCC=NCC.maNCC and HH.maHH=CTN.maHH
 group by HH.maHH, tenHH, tenNCC, donGia 
 end


 go
 create proc tk_hh
 as
 begin
 select  maHH as N'Mã Hàng hóa', tenHH as N'Tên Hàng hóa', tenNCC as N'Nhà cung cấp' , soluong as 'Số lượng'
 from HangHoa HH, NCC
 where HH.maNCC=NCC.maNCC
 end

 create proc xuat_hh_tk
as begin
select maHH as[Mã Hàng Hóa],tenHH as [Tên Hàng Hóa],tenNCC as[Tên NCC],soluong as[ Số Lượng] from HangHoa,NCC
where HangHoa.maNCC=NCC.maNCC
end

alter trigger update_sln on Chitietnhap for insert as
begin
declare @mactn1 char(10),@sl1 int,@mahh1 char(10)
select @mactn1=mactn from inserted
select @sl1=soluong,@mahh1=MaHH from Chitietnhap where Mactn=@mactn1
update HangHoa
set soluong=soluong+@sl1
where MaHH=@mahh1
  end

  go 
alter trigger update_slx on Chitietxuat for insert as
begin
declare @mactx1 char(10),@sl1 int,@mahh1 char(10)
select @mactx1=mactx from inserted
select @sl1=soluong,@mahh1=MaHH from Chitietnhap where Mactn=@mactx1
update HangHoa
set soluong=soluong-@sl1
where MaHH=@mahh1
  end


go

alter trigger update_sln2 on Chitietnhap for update as
begin
update HangHoa
set soluong= slhh
from (select HH.MaHH, (CTN.soLuong-CTX.soLuong) as slhh from HangHoa HH, Chitietnhap CTN, Chitietxuat CTX where HH.maHH=CTN.maHH and HH.maHH=CTX.maHH group by HH.maHH, CTN.soLuong, CTX.soLuong)
as A
where HangHoa.maHH=A.maHH
  end
  go
alter trigger update_slx2 on Chitietxuat for update as
begin
update HangHoa
set soluong= slhh
from (select HH.MaHH, (CTN.soLuong-CTX.soLuong) as slhh from HangHoa HH, Chitietnhap CTN, Chitietxuat CTX where HH.maHH=CTN.maHH and HH.maHH=CTX.maHH group by HH.maHH, CTN.soLuong, CTX.soLuong)
as A
where HangHoa.maHH=A.maHH
  end

 



 alter proc xoa_PN(@maPN char(10))
as
begin
delete Chitietnhap
where maPN=@maPN
delete PhieuNhap
where maPN = @maPN
end
go
create proc xuat_CTN2(@maPN char(10))
as
begin

select maCTN as [Mã CTN],maHH as [Mã Hàng Hóa],soLuong as [Số Lượng],donGia as [Đơn giá] from Chitietnhap
where maPN=@maPN
end
go
create trigger tt on Chitietnhap for update,insert,delete
as
begin
declare @MAPNCU char(10),@MAPNMOI char(10)
select @MAPNCU=maPN from deleted
select @MAPNMOI=maPN from inserted
update PhieuNhap
set tongTien=(select sum(donGia*soLuong) from Chitietnhap  where maPN=@MAPNMOI)
where maPN=@MAPNMOI
update PhieuNhap
set tongTien=(select sum(donGia*soLuong) from Chitietnhap  where maPN=@MAPNCU)
where maPN=@MAPNCU
end
go



use Quan_Ly_Kho
select count(*) from TaiKhoan where acc='admin' and pass ='1'
select * from TaiKhoan