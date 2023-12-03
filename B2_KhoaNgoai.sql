/**
    Tao CSDL: MSSV_3_12
    Tao bảng Thực vật gồm: id - int, ma - varchar(20), ten - nvarchar(20), gioi_tinh - bit, noi_sinh_song - nvarchar(50). Với ID là khoá chính
    Thêm vào bảng 5 bản ghi và hiển thị 5 bản ghi ra màn hình
*/

create database TH01451_3_12;
use TH01451_3_12;

create table thuc_vat(
	id int primary key ,
	ma varchar(20),
	ten nvarchar(20),
	gioitinh bit,
	noisinhsong nvarchar(50),
)

select * from thuc_vat
insert into thuc_vat(id,ma,ten,gioitinh,noisinhsong)
values (1,'H1',N'Nghia beo',1,N'Rung'),
	   (2,'H2',N'Ca',1,N'Duoi nuoc'),
	   (3,'H3',N'Meo',0,N'Nha'),
	   (4,'H4',N'Duck',1,N'Bo'),
	   (5,'H5',N'Cho',0,N'Nha')

-- IDENTITY => ID TỰ TĂNG => khoá chính tự tăng (KHÔNG CẦN PHẢI NHẬP KHOÁ CHÍNH)
-- NOT NULL => 1 CỘT BẮT BUỘC PHẢI NHẬP 
-- CHECK CỘT DUY NHẤT => UNIQUE 
-- VD: Tạo 1 bảng Sinh viên : id - int => KHOÁ CHÍNH TỰ TĂNG, mssv - varchar(20) - là duy nhất và không được phép null, ten - nvarchar(50), tuoi - int.
-- THÊM DỮ 5 LIỆU VÀO BẢNG VÀ HIỂN THỊ THÔNG TIN RA MÀN HÌNH

CREATE TABLE sinh_vien(
    id  INT PRIMARY KEY IDENTITY, -- ID la khoa chinh va ID tu tang 
    mssv VARCHAR(20) UNIQUE NOT NULL, -- MSSV => DUY NHAT VA KHONG DUOC PHEP NULL 
    ten NVARCHAR(50),
    tuoi INT 
)

INSERT INTO sinh_vien
VALUES('HE130464',N'Nguyễn Thuý Hằng',10)

INSERT INTO sinh_vien
VALUES('HE130465',N'Nguyễn Thuý Hằng1',14)

INSERT INTO sinh_vien
VALUES('HE130466',N'Nguyễn Thuý Hằng2',13)

SELECT * FROM sinh_vien


-- Tạo 1 bảng Giảng viên gồm :
    -- id - INT - Khoá chính - tự tăng
    -- ma_gv - VARCHAR(20) - DUY NHẤT - KHÔNG ĐƯỢC PHÉP ĐỂ TRỐNG
    -- ten - NVARCHAR(50) 
    -- bac - INT 
    -- tuoi - INT
    -- CCCD - VARCHAR(15)
-- Thêm vào bảng Giảng Viên 5 dòng dữ liệu 
-- Hiển thị thông tin của tất cả các giảng viên ra màn hình

-- 1.Khoá ngoại : FOREIGN KEY
-- KHOÁ NGOẠI 
-- Có 2 cách để tạo khoá ngoại: 
-- C1: <Tên cột> <kiểu dữ liệu> FOREIGN KEY REFERENCES <TÊN BẢNG KHOÁ CHÍNH>(<KIỂU DỮ LIỆU CỦA KHOÁ CHÍNH>)
-- C2: CONSTRAINT <TÊN KHOÁ NGOẠI => DO MÌNH ĐẶT > FOREIGN KEY (TÊN FK TRONG BẢNG)
-- CHÚ Ý: 
    -- TẠO TẤT CẢ CÁC BẢNG KHÔNG CÓ KHOÁ NGOẠI TRƯỚC 
    -- INSERT BẢNG KHÔNG CÓ KHOÁ NGOẠI TRƯỚC
-- VD: TẠO CSDL LUYENTAPBUOI2 
-- TẠO BẢNG :
    -- Bac(ID - INT - Tự tăng , ten - nvarchar(15)
    -- GiangVien(ID - INT - Tự tăng, MaGV - Varchar(20) - Duy nhat - không null, TenGV - NVARCHAR(50), bac_id - INT)
    -- VỚI BAC_ID LÀ KHOÁ NGOẠI CỦA BẢNG GIẢNG VIÊN 
-- THÊM DỮ LIỆU VÀO BẢNG (5 BẢNG GHI MỖI BẢNG)
CREATE DATABASE LUYENTAPBUOI2;

CREATE TABLE BAC(
	ID INT IDENTITY PRIMARY KEY, 
	ten nvarchar(15),
)

-- C1:
CREATE TABLE GIANGVIEN(
    ID INT PRIMARY KEY IDENTITY,
    MAGV VARCHAR(20) UNIQUE NOT NULL,
    TEN NVARCHAR(50),
    BAC_ID INT FOREIGN KEY REFERENCES Bac(id) -- C1: Tao KHOA NGOAI 
)
-- -- C2:
-- CREATE TABLE GIANGVIEN(
--     ID INT PRIMARY KEY IDENTITY,
--     MAGV VARCHAR(20) UNIQUE NOT NULL,
--     TEN NVARCHAR(50),
--     BAC_ID INT,
--     CONSTRAINT FK_Bac FOREIGN KEY (BAC_ID) REFERENCES BAC(ID)
-- )

INSERT INTO BAC
VALUES(N'Bậc 1')

INSERT INTO BAC
VALUES(N'Bậc 2')

INSERT INTO BAC
VALUES(N'Bậc 3')

INSERT INTO BAC
VALUES(N'Bậc 4')

INSERT INTO BAC
VALUES(N'Bậc 5')

SELECT * FROM BAC

INSERT INTO GIANGVIEN
VALUES('HangNT169',N'Nguyễn Thuý Hằng',1)

INSERT INTO GIANGVIEN
VALUES('PhongTT35',N'Trần Tuấn Phong',1)

INSERT INTO GIANGVIEN
VALUES('TienNH21',N'Nguyễn Hoàng Tiến',4)

SELECT * FROM GIANGVIEN

-- 1. Tạo CSDL TÊN LÀ: HANGNT169 yêu cầu gồm các bảng sau: 

-- GiangVien(ID - INT, MaGiangVien - VARCHAR(100), TenGiangVien - NVARCHAR(100), TenTaiKhoan - NVARCHAR(100), SoDienThoai - NVARCHAR(20)) 

-- MonHoc(ID - INT, MaMonHoc - VARCHAR(100), TenMonHoc - NVARCHAR(100), SoTinChi - INT, SoHocPhan - INT) 

-- PhanCongGiangVien(ID - INT,giang_vien_id - INT, mon_hoc_id - INT, SoLanDay - INT, TiLeDo - INT) 

-- ID: KHOÁ CHÍNH CỦA CÁC BẢNG - TỰ TĂNG, giang_vien_id - KHOÁ NGOẠI CỦA BẢNG PHÂN CÔNG GIẢNG VIÊN , mon_hoc_id - KHOÁ NGOẠI CỦA BẢNG PHÂN CÔNG GIẢNG VIÊN
-- MÃ GIẢNG VIÊN - GIẢNG VIÊN - DUY NHẤT KHÔNG ĐƯỢC NULL
-- MÃ MÔN HỌC - MÔN HỌC - DUY NHẤT KHÔNG ĐƯỢC ĐƯỢC NULL 

-- 2. THÊM DỮ LIỆU VÀO CÁC BẢNG. MỖI BẢNG THÊM 10 BẢN GHI

-- Tạo CSDL có tên do GV yêu cầu gồm các bảng sau: 

-- NhaCungCap(ID - INT,MaNCC - VARCHAR(20), TenNCC - NVARCHAR(100), DiaChi - NVARCHAR(100), DienThoai - NVARCHAR(100)) 

-- SanPham(ID - INT, MaSanPham - VARCHAR(20), TenSanPham - NVARCHAR(100) , DonViTinh - VARCHAR(10) , Soluong - INT , GiaBan - FLOAT) 

-- ChiTienNCC(ID - INT, NHA_CUNG_CAP_ID - INT, SAN_PHAM_ID - INT, GiaNhap - FLOAT , SoLuong - INT, NgayNhap - DATE) 

-- ID: KHOÁ CHÍNH CỦA CÁC BẢNG - TỰ TĂNG,
-- NHA_CUNG_CAP_ID - KHOÁ NGOẠI CỦA BẢNG ChiTienNCC , SAN_PHAM_ID - KHOÁ NGOẠI CỦA BẢNG ChiTienNCC
-- MaNCC - NhaCungCap - DUY NHẤT KHÔNG ĐƯỢC NULL
-- MaSanPham - SanPham - DUY NHẤT KHÔNG ĐƯỢC ĐƯỢC NULL 
-- NGÀY NHẬP TRONG BẢNG CHI TIẾP NCC ĐỂ DEFAULT LÀ NGÀY HIỆN TAI
-- 2. THÊM DỮ LIỆU VÀO CÁC BẢNG. MỖI BẢNG THÊM 10 BẢN GHI


