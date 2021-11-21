USE furama_resort_management;

-- task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
SELECT *
FROM nhan_vien
WHERE(ho_ten_nv LIKE '%T%'
        OR ho_ten_nv LIKE '%H%'
        OR ho_ten_nv LIKE '%K%')
        AND length(ho_ten_nv) <= 15;
        
-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * 
FROM khach_hang 
WHERE (18 < (year(curdate())- year(ngay_sinh_kh)) < 50) AND dia_chi = 'Da Nang' OR 'Quang Tri';

-- task 4:Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 
SELECT kh.ma_khach_hang, kh.ho_ten_kh , lk.ten_loai_khach , COUNT(hd.ma_hop_dong) as 'số lần đặt phòng'
FROM khach_hang kh
INNER JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
INNER JOIN loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach ='Diamond'
GROUP BY kh.ma_khach_hang
ORDER BY COUNT(hd.ma_hop_dong);

-- task 5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, 
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, 
-- với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.ma_khach_hang ,kh.ho_ten_kh ,lk.ten_loai_khach ,hd.ma_hop_dong, dv.ten_dich_vu,hd.ngay_lam_hd ,hd.ngay_ket_thuc ,
	SUM(dv.chi_phi_thue +( hdct.so_luong*dvdk.gia)) as 'tong_tien'
FROM khach_hang kh
LEFT JOIN loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
LEFT JOIN hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
LEFT JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang;

