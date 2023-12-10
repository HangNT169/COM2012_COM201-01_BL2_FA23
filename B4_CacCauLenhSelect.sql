/**
    2.5: SELECT TOP 
    => Mệnh đề được sử dụng để chỉ định số lượng bản ghi trả về 
    Cú pháp:
        SELECT TOP number(1,2,3...) các cột...
        FROM table_name 
        WHERE điều kiện;
*/
-- Hiển thị danh sách 5 nhân viên có tuổi >20 
SELECT TOP 5 * 
FROM NhanVien
WHERE TUOI > 20
-- Hiển thị danh sách 3 nhân viên có tên bắt đầu bằng N 
-- và tuổi trong phạm vi từ 20 - 30 và có giới tính là 1
-- tuổi trong phạm vi từ 20 - 30 => tuoi >= 20 và tuổi <= 30
-- C1: 
SELECT TOP 3 *
FROM NHANVIEN
WHERE TEN LIKE 'N%'
AND (tuoi >=20 AND TUOI <=30) -- tuoi trong pham vi tu 20 - 30 
AND GIOITINH = 1
-- C2: Between ... and 
SELECT TOP 3 *
FROM NHANVIEN
WHERE TEN LIKE 'N%'
AND (tuoi BETWEEN 20 AND 30) -- tuoi trong pham vi tu 20 - 30 
AND GIOITINH = 1
SELECT * FROM NHANVIEN
/**
    2.5. Xoá DB, table
    => Xoá toàn bộ DB, table => DROP 
    DROP DATABASE tên CSDL;
    DROP TABLE tên bảng;
    2.6. DELETE 
    => Xoá các bản ghi có trong TABLE 
*/
-- Xoá table 
DROP TABLE NHANVIEN;
-- Xoá dữ liệu có trong bảng nhân viên
-- Xoá toàn bộ dữ liệu (DELETE)
DELETE FROM NHANVIEN
-- Xoá tất cả các nhân viên có giới tính là 1 
-- Xoá theo điều kiện cụ thể
DELETE FROM Nhanvien  
WHERE gioitinh = 1
Select * from nhanvien
INSERT INTO NHANVIEN (MA, TEN, TUOI, GIOITINH) VALUES ('NV001', N'Nguyễn Văn A', 25, 1),
													  ('NV002', N'Nguyễn Văn B', 30, 0),
													  ('NV003', N'Nguyễn Văn C', 27, 1),
													  ('NV004', N'Nguyễn Văn D', 22, 0),
													  ('NV005', N'Nguyễn Văn E', 28, 1),
													  ('NV006', N'Nguyễn Văn F', 20, 0),
													  ('NV007', N'Nguyễn Văn G', 41, 0),
													  ('NV008', N'Nguyễn Văn H', 34, 1),
													  ('NV009', N'Nguyễn Văn I', 37, 0),
													  ('NV010', N'Nguyễn Văn K', 20, 1)
/**
    2.7. UPDATE 
    => Được dùng để sửa đổi dữ liệu các bản ghi hiện có trong bảng 
    Cú pháp:
        UPDATE table_name
        SET cột 1 = xx, cột 2 = xx
        WHERE điều kiện;
*/                                 
-- Update nhân viên có mã là NV001 với giới tính chuyển thành Nữ và tuổi chuyển thành 10
UPDATE NhanVien
SET gioitinh = 0, tuoi = 10
WHERE ma = 'NV001'
SELECT * FROM NHanVien
/**
   2.8 Sắp xếp - ORDER BY 
    => Dùng để sắp xếp dữ liệu kết quả theo chiều tăng dần hoặc giảm dần 
    CHÚ Ý: ORDER BY LUÔN LUÔN Ở CUỐI CÙNG TRONG CÂU TRUY VẤN 
    Cú pháp:
        SELECT cột 1,cột2..
        FROM table_name
        Where diều kiện(AND/OR/NOT...)
        ...
        ORDER BY cột 1 ASC/DESC
*/
-- Hiển thị danh sách nhân viên sắp xếp theo chiều giảm dần của tuổi 
SELECT * 
FROM NHANVIEN 
ORDER by tuoi DESC
-- Nếu k viết gì ở cuối (DESC/ASC) => DEFAULT là sắp xếp tăng dần. Muốn giảm dần thì viết thêm DESC ở cuối
-- Hiển thị danh sách nhân viên có giới tính là 0 và tên kết thúc bằng P và được sắp xếp theo chiều tăng dần của tuôi
SELECT * 
FROM NhanVien 
WHERE gioitinh = 0
AND ten LIKE '%B'
ORDER BY tuoi  -- ORDER BY LUON LUON O CUOI CUNG TRONG CAU SELECT 
INSERT INTO NhanVien
VALUES(N'NV0019','avcsdfsd b',10,0)
/**
    2.9 Toán tử SQL: AND, OR, NOT, Bettween...AND 
        AND: Kết hợp các mệnh đề( các mệnh đề đều phải đúng)
        OR: 1 trong các mệnh đề đúng
        NOT : Hiển thị bản ghi nếu (các)điều kiện KHÔNG ĐÚNG (PHỦ ĐỊNH) - CHÍNH LÀ DẤU ! TRONG LẬP TRÌNH 
        BETWEEN ... AND : TRONG KHOẢNG BAO GỒM GIÁ TRỊ BẮT ĐẦU VÀ GIÁ TRỊ KẾT THÚC
*/