DROP DATABASE IF EXISTS furama_resort_management;
CREATE DATABASE furama_resort_management;
USE furama_resort_management;

CREATE TABLE vi_tri(
ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do(
ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
ten_trinh_do VARCHAR(45)
);

CREATE TABLE loai_khach(
ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_khach VARCHAR(45)
);

CREATE TABLE bo_phan(
ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
ten_bo_phan VARCHAR(45)
);

CREATE TABLE loai_dich_vu(
ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu_di_kem VARCHAR(45),
gia DOUBLE,
don_vi INT,
trang_thai VARCHAR(45)
);

CREATE TABLE kieu_thue(
ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
ten_kieu_thue VARCHAR(45),
gia_thue DOUBLE
);

CREATE TABLE nhan_vien(
ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
ho_ten_nv VARCHAR(45),
ngay_sinh DATE,
so_cmnd VARCHAR(45),
luong VARCHAR(45),
sdt VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
ma_vi_tri INT,
ma_bo_phan INT,
ma_trinh_do INT,
FOREIGN KEY(ma_vi_tri) REFERENCES vi_tri(ma_vi_tri) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ma_bo_phan) REFERENCES bo_phan(ma_bo_phan) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ma_trinh_do) REFERENCES trinh_do(ma_trinh_do) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE khach_hang(
ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
ho_ten_kh VARCHAR(45),
ngay_sinh_kh DATE ,
sdt_kh VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
ma_loai_khach INT ,
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE dich_vu(
ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu VARCHAR(45),
dien_tich INT,
so_tang INT,
so_nguoi_toi_da INT,
chi_phi_thue VARCHAR(45),
trang_thai VARCHAR(45),
ma_kieu_thue INT,
ma_loai_dich_vu INT,
FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hop_dong(
ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
ngay_lam_hd DATE,
ngay_ket_thuc DATE,
tien_dat_coc INT,
tong_tien INT,
ma_dich_vu INT,
ma_khach_hang INT,	
ma_nhan_vien INT,
FOREIGN KEY(ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ma_dich_vu) REFERENCES dich_vu (ma_dich_vu) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hop_dong_chi_tiet(
ma_hdct INT PRIMARY KEY AUTO_INCREMENT,
so_luong INT,
ma_hop_dong INT,
ma_dich_vu_di_kem INT,
FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(ma_hop_dong) REFERENCES hop_dong(ma_hop_dong) ON UPDATE CASCADE ON DELETE CASCADE
);