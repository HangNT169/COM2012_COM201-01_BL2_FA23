/**
    1. Toán tử IN,COUNT(), AVG(), SUM(),MAX()...
        => COUNT: trả về số bản ghi phù hợp với tuỳ điền kiện
        => AVG : trả về giá trị trung bình của 1 cột tuỳ điều kiện
        => SUM : trả về tổng của 1 cột tuỳ điều kiện
        => MIN: trả về giá trị nhỏ nhất của cột đã chọn
        => MAX: trả về giá trị lớn nhất của cột đã chọn 
    VD: Đếm tổng số nhân viên có giới tính là nữ 
*/
SELECT COUNT(GioiTinh) as N'Đếm số lượng nhân viên'
FROM NhanVien
WHERE GioiTinh = N'Nữ'
/**
    2. GROUP BY
        => Dùng để nhóm các hàng có cùng giá trị vào với nhau 
        Cú pháp:
            SELECT cột(s)
            FROM table(Có thể có join)...
            WHERE điều kiện
            GROUP by cột(s)
            ORDER by cột(s)
    3. Having 
    => MỆNH đề thêm vào SQL dùng để hiển thị điều kiện cho các cột tự tạo ra (CHỨ KHÔNG PHẢI LÀ CỘT CÓ SẴN CỦA TABLE)
*/