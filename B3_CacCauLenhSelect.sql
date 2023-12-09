CREATE DATABASE Buoi3
USE Buoi3


CREATE TABLE NHANVIEN(
	ID INT IDENTITY (1,1) PRIMARY KEY,
	MA VARCHAR (10) NOT NULL UNIQUE,
	TEN NVARCHAR(100),
	TUOI INT,
	GIOITINH BIT
)
SELECT * FROM NHANVIEN -- HIỂN THỊ TOÀN BỘ DỮ LIỆU CỦA BẢNG
INSERT INTO NHANVIEN (MA, TEN, TUOI, GIOITINH) VALUES
													  ('NV011', N'Trịnh Dương Linh', 37, 0),
													  ('NV012', N'Trần Tuần Phong', 20, 1)
/**
   2. Các câu lệnh SELECT 
    => Câu lệnh SELECT dùng để chọn lọc dữ liệu từ CSDL 
    => Trả về 1 TABLE 
    CÚ PHÁP :
        SELECT tên cột 1, tên cột 2.....
        FROM TABLE_NAME
*/
-- Hiển thị thông tin ma, tên của nhân viên 
SELECT ma,ten, TUOI -- LIỆT KÊ CÁC COLUMN (TÊN CỘT) THEO YÊU CẦU CỦA ĐỀ BÀI
FROM NHANVIEN

-- C1: Hien thi tat ca cac truong cua bang nhan vien 
SELECT id,ma,tuoi,GIOITINH,ten
FROM NHANVIEN
-- C2: Hien thị tất cả 
SELECT * 
FROM NHANVIEN
/**
    2.1 Cách đặt bí danh 
    => Đặt tên ngắn gọn 
    Cú pháp:
    SELECT cột 1, cột2 AS .....
    FROM table_name AS t
*/
SELECT ten AS N'Tên của nhân viên'
FROM NHANVIEN

/**
    2.2 DISTINCT 
    => Hiển thị 1 dữ liệu duy nhất => Không bị trùng lăp (LOẠI BỎ CÁC BẢN GHI TRÙNG LẶP)
    Cú pháp:
        SELECT DISTINCT tên cột
        FROM table_name
*/
SELECT DISTINCT GIOITINH
FROM NHANVIEN

/**
    2.3. WHERE 
     => Được sử dụng để lọc bản ghi  
     Cú pháp:
     SELECT côt 1,cột 2....
     FROM TABLE_NAME
     WHERE điều kiện cần lọc;
*/
-- VD1: Hiển thị mã, tên, tuổi của các nhân viên có giới tính là 0 
SELECT MA,TEN,TUOI
FROM NHANVIEN
WHERE GIOITINH = 0
-- VD2: Hiển thị danh sách nhân viên có giới tính là 0 và tuổi > 25
SELECT * 
FROM NHANVIEN
WHERE GIOITINH = 0 
AND TUOI > 25
-- Đề bài : 
    -- VÀ (Cả 2 điều kiện) => AND => ĐỂ KẾT HỢP 2 ĐIỀU KIỆN 
    -- HOẶC (1 TRONG 2 ĐIỀU KIỆN) => OR => HOẶC ĐIỀU KIỆN NÀY HOẶC ĐIỀU KIỆN KHÁC ..
/**
    ĐIỀU KIỆN:
        - SO SÁNH : >,<,>=,<=,=,KHÁC(C1: DÙNG: !=, C2: DÙNG >< )
*/
/** 
    2.4. LIKE 
      SELECT CỘT...
      FROM TABLE_NAME
      WHERE cột1 LIKE 'a%' => Tìm bất kỳ giá trị nào BẮT ĐẦU BẰNG a (GIỐNG HÀM STARTWITH TRONG JAVA)
            CỘT 1 LIKE '%a' => Tìm bất kỳ giá trị nào KẾT THÚC BẰNG a (GIỐNG HÀM ENDWITH TRONG JAVA)
            CỘT 1 LIKE '%a%' => Tìm bất kỳ giá trị nào CHỨA KÝ TỰ a trong cột 1(CONTAINS)
*/
-- VD1: Tìm kiếm nhân viên có tên bắt đầu bằng N
SELECT * 
FROM NHANVIEN
WHERE ten LIKE 'n%'
-- VD2: Tìm kiếm nhân viên có tên kết thúc bằng G 
SELECT * 
FROM NHANVIEN
WHERE ten LIKE '%G'
-- VD3: Tìm kiếm nhân viên trong tên chứa chữ B
SELECT * 
FROM NHANVIEN
WHERE ten LIKE '%b%'