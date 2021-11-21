USE furama_resort_management;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO nhan_vien(ho_ten_nv,ngay_sinh,so_cmnd,luong,sdt,email,dia_chi,ma_vi_tri,ma_bo_phan,ma_trinh_do)
VALUES('Nguyen Trung Kien','1998-01-01','1223456','10000','123345666','kiennguyen@gmail,com','Da Nang',2,3,2),
('Nguyen Cong Khanh','1998-05-05','3323456','15000','111345666','khanhnguyen@gmail,com','Quang Nam',5,1,1),
('Nguyen Van Dong','1998-07-07','1223259','13000','122225666','dong@gmail,com','Da Nang',1,3,3),
('Dang Huu Du','1990-06-06','9877456','17000','999345666','dudang@gmail,com','Quang Nam',6,4,4),
('Vo Nhat Anh','2000-11-11','3323456','19000','222345666','nhatanh@gmail,com','Quang Binh',4,2,3);
SELECT * FROM khach_hang;
SET SQL_SAFE_UPDATES = 0;


INSERT INTO khach_hang(ho_ten_kh,ngay_sinh_kh,sdt_kh,email,dia_chi,ma_loai_khach)
VALUES('Ho Ngoc Ha','2004-04-27','0987654','hangoc@gmail.com','Da Nang',5),
('Nguyen Thanh Cong','1992-01-22','0933654','congthanh@gmail.com','Quang Binh',3),
('Ho Quang Hieu','1991-11-12','0982224','hieu@gmail.com','Quang Tri',1),
('Nguyen Thi Van','2000-09-27','0987004','tvan@gmail.com','Da Nang',2),
('Tran Hong Gia Dong','1995-07-27','0982124','dongtran@gmail.com','Da Nang',1);

INSERT INTO vi_tri(ten_vi_tri)
VALUES('Le Tan'),
	('Phuc vu'),
    ('Chuyen Vien'),
    ('Giam sat'),
    ('Quan Ly'),
    ('Giam Doc');
INSERT INTO trinh_do(ten_trinh_do)
VALUES ('Trung Cap'),
	   ('Cao Dang'),
       ('Dai hoc'),
	   ('Sau Dai hoc');
INSERT INTO bo_phan(ten_bo_phan)
VALUES('Sale_Marketing'),
	  ('Hanh Chinh'),
	  ('Phuc vu'),
	  ('Quan ly');
      
INSERT INTO kieu_thue(ten_kieu_thue,gia_thue)
VALUES('Nam','24000'),('Thang','2000'),('Ngay','100'),('Gio','15');
INSERT INTO loai_dich_vu(ten_loai_dich_vu)
VALUES('Villa'),('House'),('Room');

INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai)
VALUES('massage',20,'$','kha dung'),
	  ('thuc an',10,'$','khong kha dung'),
      ('nuoc uong',7,'$','kha dung'),
      ('xe dua don',50,'$','kha dung'),
      ('don dep',30,'$','khong kha dung');
INSERT INTO loai_khach(ten_loai_khach)
VALUES ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');

INSERT INTO dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,trang_thai,ma_kieu_thue,ma_loai_dich_vu)
VALUES('Villa trên núi',400,3,20,'5000','kha dung',2,1),
	  ('House trên núi',200,3,10,'2000','kha dung',3,2),
      ('Room vip',100,1,5,'1000','kha dung',4,3),
      ('Villa hướng biển',450,4,25,'7000','kha dung',3,1),
      ('Room thường',50,1,4,'500','kha dung',1,3);
      
INSERT INTO hop_dong(ngay_lam_hd,ngay_ket_thuc,tien_dat_coc,tong_tien,ma_dich_vu,ma_khach_hang,ma_nhan_vien)
VALUES ('2019-01-01','2019-01-08',2000,10000,4,3,2),
       ('2016-06-01','2016-07-01',3000,15000,1,5,3),
       ('2020-10-01','2020-10-08',2000,10000,2,3,4),
       ('2020-01-21','2020-03-21',1000,7000,3,4,1);

INSERT INTO hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
VALUES(2,1,1),
	  (3,2,1),
      (4,3,4),
      (5,4,3);
	
SELECT* FROM hop_dong_chi_tiet;
DELETE FROM hop_dong ;

