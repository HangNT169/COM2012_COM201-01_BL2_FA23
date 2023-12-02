/**
    Cach comment trong SQL Server 
    Co 2 cach comment:
        1. Dung dau -- -- : Comment 1 dong 
        2. Dung /** Comment 1 khoi lenh */
    1. Câu lênh tạo cơ sở dữ liệu :
        CREATE DATABASE tên cơ sở dữ liệu; 
        => Dùng để tạo 1 database trong CSDL 
*/

CREATE DATABASE buoi1;
-- C1: Chon vao combobox cua database => Chon database muon su dung 
-- C2: Su dung USE ten database => Chi dinh database muon su dung (muon lam viec)
USE buoi1;
/**
    2.Xoa CSDL 
    DROP DATABASE tên database;
    => Dùng để xoá CSDL 
*/
DROP DATABASE buoi1;
-- Chú ý: KHÔNG ĐƯỢC XOÁ DATABASE MÀ CÁC BẠN ĐANG SỬ DỤNG (DANG USE)
/**
    3.Tạo bảng (CREATE TABLE)
    => Tạo bảng trong CSDL 
    Cú pháp:
        CREATE TABLE tên_table(
            tên cột 1 kiểu dữ liệu,
            tên cột 2 kiểu dữ liệu,
            tên cột 3 kiểu dữ liệu,
            .....
        )
*/
-- Tao table sinh vien gồm : mssv - varchar(50), tên - nvarchar(50), tuoi - int. MSSV - KHOÁ CHÍNH CỦA BẢNG 
-- KHOA CHINH => DUY NHAT TRONG BANG 
-- CO 2 CACH DE KHAI BAO KHOA CHINH 
    -- C1: Them trực tiếp PRIMARY KEY vào thuộc tính của khoá chính cùng dòng 
    -- C2: THEM PRIMARY KEY(TEN CUA THUOC TINH KHOA CHINH) => THEM Ở DONG CUOI CUNG
CREATE TABLE sinh_vien(
    mssv varchar(50) PRIMARY KEY ,
    ten nvarchar(50),
    tuoi int
)
-- Tạo table phòng học gồm : id - int , ten - varchar(50), toa - varchar(10). ID LÀ KHOÁ CHÍNH CỦA BẢNG 
CREATE TABLE phong_hoc(
    id int,
    ten nvarchar(50),
    toa varchar(10),
    PRIMARY KEY(id)
)
/**
    4. DROP TABLE 
        => Xoá bảng trong CSDL 
        DROP TABLE tên_table;
*/
DROP TABLE phong_hoc;

/**
    5.ALTER TABLE 
    => Thay đổi cấu trúc của 1 bảng : CÓ THỂ THÊM THUỘC TÍNH VÀO BẢNG / XOÁ THUỘC TÍNH TRONG BẢNG / SỬA THUỘC TÍNH TRONG BẢNG  
    Cú pháp:
        THÊM CỘT VÀO TABLE:
            ALTER TABLE tên_table
            ADD tên_cột kiểu dữ liệu;
        XOÁ CỘT KHỎI TABLE:
            ALTER TABLE tên_table
            DROP tên_cột kiểu dữ liệu;
        Sửa kiểu dữ liệu của 1 cột: ALTER/MODIFY COLUMN
            ALTER TABLE tên_table
            ALTER COLUMN tên_cột kiểu dữ liệu;
*/
-- Thêm trường ma - varchar(20) vào table phòng học 
ALTER TABLE phong_hoc
ADD ma varchar(20)
/**
    6.Thêm dữ liệu vào bảng - INSERT INTO.
    Có 2 cách để thêm dữ liệu vào bảng :
    C1: Chỉ định cột và giá trị được chèn theo 
        CÚ PHÁP:
            INSERT INTO tên table(cột 1, cột 2....)
            VALUES(value1,value2,...);
    C2: 
        Cú pháp: 
            INSERT INTO tên table
            VALUES(value1, value2,....);
        CHÚ Ý: ĐẢM BẢO THỨ TỰ CỦA CÁC GIÁ TRỊ THEO CÙNG THỨ TỰ CỦA CÁC CỘT TRONG BẢNG 
*/
-- THÊM DỮ LIỆU VÀO BẢNG SINH VIÊN 
-- KIỂM TRA BẢNG SINH VIÊN CÓ DỮ LIỆU CHƯA:
SELECT * FROM sinh_vien 
INSERT INTO sinh_vien(ten,mssv)
VALUES (N'Nguyễn Thuý Hằng','HE1304613'),
       (N'Nguyễn Thuý Hằn1','HE130462')
INSERT INTO sinh_vien
VALUES(N'HE123455',N'Nguyễn Văn A',10),
        (N'HE17777',N'Nguyễn Văn B',11)