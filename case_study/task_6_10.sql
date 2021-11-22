-- task 6:Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3)
SELECT dv.ma_dich_vu ,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
FROM dich_vu dv 
INNER JOIN hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
INNER JOIN loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE not( month(ngay_lam_hd) IN (1,2,3) and year(ngay_lam_hd) = 2019);

-- task 7:Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại 
-- dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019

SELECT dv.ma_dich_vu ,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
FROM dich_vu dv
INNER JOIN hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
INNER JOIN loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE year(ngay_lam_hd) = 2018 AND dv.ma_loai_dich_vu 
NOT IN (SELECT dv.ma_dich_vu
	    FROM dich_vu dv 
        INNER JOIN hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
		WHERE year(hd.ngay_lam_hd)= 2019);
        
-- task 8:(dùng 3 cách) Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- c1
SELECT DISTINCT ho_ten_kh
FROM khach_hang;

-- c2
SELECT ho_ten_kh
FROM khach_hang
UNION
SELECT ho_ten_kh
FROM khach_hang;

-- task 9:Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
 
 SELECT month(ngay_lam_hd) AS 'tháng' , COUNT(id_hop_dong) AS 'số khách đặt phòng'
 FROM hop_dong 
 WHERE year(ngay_lam_hd) = 2019
 GROUP BY MONTH (ngay_lam_hd);
 
-- task 10: Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
--  (được tính dựa trên việc count các IDHopDongChiTiet)
 
 SELECT hd.ma_hop_dong , hd.ngay_lam_hd, hd.ngay_ket_thuc,hd.tien_dat_coc, COUNT(hdct.ma_dich_vu_di_kem) AS 'SoLuongDichVuDiKem'
 FROM hop_dong hd
 INNER JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
 GROUP BY hd.ma_hop_dong;