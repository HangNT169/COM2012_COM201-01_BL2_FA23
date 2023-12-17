CREATE DATABASE B12
GO
USE B12 

CREATE TABLE ChucVu(
    Id INT PRIMARY KEY IDENTITY,
    Ma VARCHAR(20) UNIQUE,
    Ten NVARCHAR(50) DEFAULT NULL
)


-- Tạo bảng cửa hàng
CREATE TABLE CuaHang(
    Id INT PRIMARY KEY IDENTITY,
    Ma VARCHAR(20) UNIQUE,
    Ten NVARCHAR(50) DEFAULT NULL,
    DiaChi NVARCHAR(100) DEFAULT NULL,
    ThanhPho NVARCHAR(20) DEFAULT NULL,
    QuocGia NVARCHAR(30) DEFAULT NULL,
)

CREATE TABLE NhanVien(
    Id INT PRIMARY KEY IDENTITY,
    Ma VARCHAR(20) UNIQUE,
    Ten NVARCHAR(50) DEFAULT NULL,
    TenDem NVARCHAR(50) DEFAULT NULL,
    Ho NVARCHAR(50) DEFAULT NULL,
    GioiTinh NVARCHAR(10) DEFAULT NULL,
    DiaChi NVARCHAR(100) DEFAULT NULL,
    Sdt VARCHAR(20) DEFAULT NULL,
    IdCH INT FOREIGN KEY REFERENCES CuaHang(Id),
    IdCV INT FOREIGN KEY REFERENCES ChucVu(Id),
    TrangThai INT DEFAULT 0
)
INSERT INTO ChucVu(Ma,Ten)
VALUES('TP',N'Trưởng Phòng'),
		('NV',N'Nhân Viên')

INSERT INTO ChucVu
VALUES('LC',N'Lao Công'),
		('BV',N'Bảo Vệ')

INSERT INTO CuaHang
VALUES('CH01',N'Cửa hàng 1',N'Tên1','Ha noi','Viet nam'),
    ('CH02',N'Cửa hàng 2',N'Tên1','Ha noi','Viet nam'),
    ('CH03',N'Cửa hàng 3',N'Tên1','Ha noi','Viet nam'),
    ('CH04',N'Cửa hàng 4',N'Tên1','Ha noi','Viet nam'),
    ('CH05',N'Cửa hàng 5',N'Tên1','Ha noi','Viet nam'),
    ('CH06',N'Cửa hàng 1',N'Tên1','Ha noi','Viet nam')

INSERT INTO NhanVien(Ma,Ten,TenDem,Ho,GioiTinh,Sdt,IdCH,IdCV,TrangThai,DiaChi)
VALUES('NV01',N'Dung',N'Anh',N'Nguyen','Nam','0123456789',1,2,0,N'Hà nội'),
('NV02',N'Dung',N'Anh',N'Nguyen','Nam','0123456789',1,1,0,N'Lạng Sơn'),
('NV03',N'Dung1',N'Anh',N'Nguyen',N'Nữ','0123456789',1,3,0,N'Nam Định'),
('NV04',N'Dung2',N'Anh',N'Nguyen','Nam','0123456789',3,1,0,N'Thái bình'),
('NV05',N'Dung4',N'Anh',N'Nguyen','Nam','0123456789',1,2,1,N'Hà nội')
SELECT * FROM CuaHang;
SELECT * FROM ChucVu;
SELECT * FROM NhanVien
/**
    2.10. Join các bảng 
        Dùng để join dữ liệu từ 2 bảng đổ lên dựa vào 1 cột liên quan(DỰA VÀO KHOÁ NGOẠI)
    Các loại join:
        - INNER JOIN => Trả về các bản ghi có giá trị khớp nhau trong 2 bảng. Mặc định của Join là inner join
        - LEFT (OUTER) JOIN => Trả về tất cả bản ghi có giá trị ở bảng bên trái và giá trị khớp nhau của 2 bảng 
        - RIGHT (OUTER) JOIN => Trả về tất cả bản ghi có giá trị ở bảng bên phải và giá trị khớp nhau của 2 bảng 
        - FULL (OUTER) JOIN => Trả về tất cả các bản ghi có ở trong bảng(Bao gồm cả bên trái hoặc bên phải)
    Cú pháp:
        - INNER JOIN:
            SELECT các cột
            FROM table1
            INNER JOIN table2
            ON table1.cột1 = table2.cột2
            WHERE ....(TUỲ ĐỀ NẾU CÓ ĐIỀU KIỆN)
    // Output:
    Nhan vien ID, Họ và tên, Giới tính, SĐT, Tên chức vụ, Tên cửa hàng, Trạng thái 
*/
-- Các cột của table có thể + vào với nhau . Muốn đổi tên cột trong table => AS
SELECT ID AS N'Nhân viên ID', (Ho + ' '+TenDem +' '+ Ten) AS N'Họ và tên', GioiTinh, Sdt, TrangThai
FROm NhanVien
-- Hiển thị danh sách nhân viên gồm : Mã nhân viên, Tên ,Giới tính, Tên chức vụ
SELECT nv.Ma,nv.Ten,nv.GioiTinh,cv.Ten
FROM NhanVien AS nv
INNER JOIN ChucVu AS cv
ON nv.IdCV = cv.id
-- Hiển thị danh sách nhân viên gồm: Mã nhân viên, Tên , SĐT, Trạng Thái, Mã chức vụ, Tên chức vụ
-- Hiển thị danh sách nhân viên gồm: Mã, Họ và tên, SDT, Mã chức vụ, Mã cửa hàng, Tên chức vụ, Tên cửa hàng
-- Hiển thị danh sách nhân viên gồm: Mã, Họ và tên, SDT, Mã chức vụ, Mã cửa hàng, Tên chức vụ, Tên cửa hàng. Với Tên chức vụ bắt đầu bằng chữ T và sắp xếp theo chiều tăng dần của mã cửa hàng