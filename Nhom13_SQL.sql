CREATE DATABASE qlybenhvien1;
USE qlybenhvien1;
GO

CREATE TABLE BenhNhan (
    MaBN VARCHAR(10) PRIMARY KEY,
    TenBN NVARCHAR(30),
    GioiTinh NVARCHAR(10),
    NgaySinh DATE,
    DiaChi NVARCHAR(255),
    SoDienThoai VARCHAR(15),  
    TinhTrangSucKhoe NVARCHAR(255)
);

CREATE TABLE BacSi (
    MaBS VARCHAR(10) PRIMARY KEY,
    TenBS NVARCHAR(30),
    GioiTinh NVARCHAR(10),
    NgaySinh DATE,
    DiaChi NVARCHAR(255),
    SoDienThoai VARCHAR(15),  
    ChuyenNganh NVARCHAR(30)
);

CREATE TABLE Thuoc (
    MaThuoc VARCHAR(10) PRIMARY KEY,
    TenThuoc NVARCHAR(30),
    DonGia FLOAT
);

CREATE TABLE DonThuoc (
    MaDT VARCHAR(10) PRIMARY KEY,
    MaBS VARCHAR(10) REFERENCES BacSi(MaBS),
    MaBN VARCHAR(10) REFERENCES BenhNhan(MaBN)  
);

CREATE TABLE CT_DonThuoc (
    MaDT VARCHAR(10),
    MaThuoc VARCHAR(10),
    SoLuong INT,
    CONSTRAINT PK_Ma PRIMARY KEY (MaDT, MaThuoc),
    FOREIGN KEY (MaThuoc) REFERENCES Thuoc(MaThuoc),
    FOREIGN KEY (MaDT) REFERENCES DonThuoc(MaDT)
);

CREATE TABLE DichVuKham (
    MaDV VARCHAR(10) PRIMARY KEY,
    TenDV NVARCHAR(30),
    DonGia FLOAT
);

CREATE TABLE HoaDon (
    MaHD VARCHAR(10) PRIMARY KEY,
    MaDT VARCHAR(10) REFERENCES DonThuoc(MaDT),
    MaBN VARCHAR(10) REFERENCES BenhNhan(MaBN),
    NgayLap DATE,
    TongTien FLOAT
);

CREATE TABLE HoaDon_DV (
    MaHD VARCHAR(10),
    MaDV VARCHAR(10),
    SoLuong FLOAT,
    CONSTRAINT PK_hoadon_DV PRIMARY KEY (MaHD, MaDV),
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    FOREIGN KEY (MaDV) REFERENCES DichVuKham(MaDV)
);


/*1. Chèn dữ liệu cho các bảng*/
--chèn dữ liệu vào bảng BenhNhan
INSERT INTO BenhNhan(MaBN, TenBN, GioiTinh, NgaySinh, DiaChi, SoDienThoai, TinhTrangSucKhoe)
VALUES
('BN01',N'Nguyễn Lan',N'Nữ','07/05/1994',N'Hà Nội','0264765778', N'Ho'),
('BN02',N'Nguyễn Vân',N'Nữ','06/03/1999',N'Hà Nội','0237724576', N'Sốt'),
('BN03',N'Nguyễn Hoa',N'Nữ','03/03/1996',N'Quảng Ninh','0232546284', N'Viêm xoang'),
('BN04',N'Phạm Hưng',N'Nam','09/10/1986',N'Hải Phòng','0232554883', N'Sốt'),
('BN05',N'Hoàng Hà',N'Nam','12/11/1992',N'Nam Định','0232236672', N'Co giật'),
('BN06',N'Lê Hoàng',N'Nam','08/30/1989',N'Thái Bình','0234457842', N'Ung thư phổi'),
('BN07',N'Nguyễn Dương',N'Nữ','02/15/1994',N'Lạng Sơn','0232335485', N'Viêm phổi'),
('BN08', N'Trần Hà Trang', N'Nữ', '09/15/2000', N'Tuyên Quang', '0223453267', N'Xoang'),
('BN09', N'Hà Phi Long', N'Nam', '02/02/1999', N'Hưng Yên', '0988965348', N'Cảm'),
('BN10', N'Dương Huy Hồng', N'Nam', '02/04/1989', N'Thường Tín', '0978065348', N'Đau đầu'),
('BN11', N'Nguyễn Trần Tiến Đạt', N'Nam', '10/10/2005', N'Hà Nội', '0989065350', N'Ngộ độc'),
('BN12', N'Bùi Huy Quang', N'Nam', '05/05/1999', N'Bắc Giang', '0988995355', N'Cảm'),
('BN13', N'Trần Anh Hiên', N'Nữ', '02/02/1979', N'Hưng Yên', '0980965347', N'Cảm'),
('BN14', N'Hoàng Phi Hồng', N'Nam', '02/12/1999', N'Thái Bình', '0988956128', N'Ngộ độc'),
('BN15', N'Đặng Văn Bằng', N'Nam', '02/02/2001', N'Điện Biên Phủ', '0988945348', N'Sốt');
--Truy vấn tất cả thông tin bệnh nhân
select * from BenhNhan;

--chèn dữ liệu vào bảng BacSi
INSERT INTO BacSi(MaBS, TenBS, GioiTinh, NgaySinh, DiaChi, SoDienThoai, ChuyenNganh)
VALUES 
('BS01', N'Nguyễn Tuấn', N'Nam', '1994-01-22', N'Hà Nội', '098899871', N'Đa Khoa'),
('BS02', N'Nguyễn Trần Đạt', N'Nam', '1994-01-22', N'Hà Nội', '098899872', N'Tai mũi họng'),
('BS03', N'Phạm Văn Khoa', N'Nam', '1994-01-22', N'Hà Nội', '098899873', N'Răng hàm mặt'),
('BS04', N'Lương Duy Công', N'Nam', '1994-01-22', N'Hà Nội', '098899874', N'Nội xương cơ khớp'),
('BS05', N'Phan Duy Nến', N'Nam', '1994-01-22', N'Hà Nội', '098899875', N'Da liễu'),
('BS06', N'Nguyễn Tuấn', N'Nam', '1994-01-22', N'Hà Nội', '098899871', N'Đa Khoa'),
('BS07', N'Trần Minh', N'Nam', '1985-05-15', N'Hồ Chí Minh', '098765432', N'Nội Khoa'),
('BS08', N'Lê Thị Mai', N'Nữ', '1990-11-30', N'Hải Phòng', '097123456', N'Ngoại Khoa'),
('BS09', N'Phạm Văn An', N'Nam', '1988-03-12', N'Đà Nẵng', '091234567', N'Chuyên Khoa Tim Mạch'),
('BS10', N'Ngô Thị Lan', N'Nữ', '1992-07-20', N'Quảng Ninh', '090876543', N'Chuyên Khoa Sản'),
('BS11', N'Vũ Hoàng Nam', N'Nam', '1980-09-05', N'Thừa Thiên Huế', '093456789', N'Chuyên Khoa Nhi'),
('BS12', N'Trịnh Thanh', N'Nữ', '1995-12-01', N'Bắc Ninh', '091234678', N'Chuyên Khoa Tâm Lý'),
('BS13', N'Nguyễn Văn Hòa', N'Nam', '1983-06-18', N'Vĩnh Phúc', '098765123', N'Chuyên Khoa Da Liễu'),
('BS14', N'Nguyễn Thị Hương', N'Nữ', '1986-04-10', N'Thái Nguyên', '090123456', N'Chuyên Khoa Tiêu Hóa'),
('BS15', N'Tô Văn Phúc', N'Nam', '1979-08-22', N'Long An', '091987654', N'Ngoại Khoa');
select * from BacSi;

--chèn dữ liệu vào bảng Thuoc 
INSERT INTO
Thuoc(MaThuoc,TenThuoc,DonGia)
VALUES	('T01',N'Vitamin','43000'),
		('T02',N'Kháng sinh','80000'),
		('T03',N'Tiêu hóa ','50000'),
		('T04',N'Tim Mạch','400000'),
		('T05',N'Huyết áp','100000'),
		('T06', N'Paracetamol', '25000'),
		('T07', N'Ibuprofen', '30000'),
		('T08', N'Amoxicillin', '150000'),
		('T09', N'Cetirizine', '20000'),
		('T10', N'Dexamethasone', '120000'),
		('T11', N'Salbutamol', '35000'),
		('T12', N'Lisinopril', '45000'),
		('T13', N'Atorvastatin', '90000'),
		('T14', N'Gliclazide', '60000'),
		('T15', N'Omeprazole', '70000');
select * from Thuoc;

--chèn dữ liệu vào bảng DonThuoc
INSERT INTO DonThuoc(MaDT, MaBS, MaBN)
VALUES 
	('DT01', 'BS01', 'BN02'),
	('DT02', 'BS01', 'BN01'),
	('DT03', 'BS02', 'BN03'), 
	('DT04', 'BS04', 'BN01'),  
	('DT05', 'BS05', 'BN03'),
    ('DT06', 'BS01', 'BN04'),
    ('DT07', 'BS02', 'BN05'),
    ('DT08', 'BS03', 'BN06'),
    ('DT09', 'BS04', 'BN07'),
    ('DT10', 'BS05', 'BN08'),
    ('DT11', 'BS01', 'BN09'),
    ('DT12', 'BS02', 'BN10'),
    ('DT13', 'BS03', 'BN11'),
    ('DT14', 'BS04', 'BN12'),
    ('DT15', 'BS05', 'BN13');
select * from DonThuoc;

--chèn dữ liệu vào bảng CT_DonThuoc
INSERT INTO
CT_DonThuoc(MaDT,MaThuoc,SoLuong)
VALUES	('DT02','T01',5),
		('DT02','T02',4),
		('DT03','T03',7),
		('DT05','T04',4),
		('DT04','T05',9),
		('DT01', 'T01', 3),
		('DT01', 'T03', 2),
		('DT02', 'T04', 6),
		('DT03', 'T05', 1),
		('DT04', 'T06', 5),
		('DT05', 'T07', 8),
		('DT06', 'T08', 4),
		('DT07', 'T09', 3),
		('DT08', 'T10', 2),
		('DT09', 'T01', 7);
select * from CT_DonThuoc;

--chèn dữ liệu vào bảng DichVuKham
INSERT INTO DichVuKham (MaDV, TenDV, DonGia)
VALUES ('DV01', N'Xét nghiệm', 400000),
		('DV02', N'Khám lâm sàng', 700000),
		('DV03', N'Siêu âm', 500000),
		('DV04', N'X quang', 550000),
		('DV05', N'Cơ sương khớp', 990000),
		('DV06', N'Nội soi', 560000),
		('DV07', N'CT scan', 1200000),
		('DV08', N'MRI', 1500000),
		('DV09', N'Phẫu thuật', 3000000),
		('DV10', N'Tiêm chủng', 200000),
		('DV11', N'Khám tim mạch', 800000),
		('DV12', N'Khám phụ khoa', 750000),
		('DV13', N'Khám nhi', 600000),
		('DV14', N'Tư vấn sức khỏe', 250000),
		('DV15', N'Điện tâm đồ', 450000),
		('DV16', N'Chụp X quang răng', 300000);
select * from DichVuKham;

-- Chèn dữ liệu vào bảng HoaDon
INSERT INTO HoaDon(MaHD, MaBN, MaDT, NgayLap, TongTien)
VALUES 
    ('HD01', 'BN01', 'DT01', '2021-08-06', 708000),
    ('HD02', 'BN02', 'DT02', '2020-08-06', 5550000),
    ('HD03', 'BN03', 'DT03', '2021-08-06', 7300000),
    ('HD04', 'BN04', 'DT04', '2020-08-06', 900000),
    ('HD05', 'BN05', 'DT05', '2021-08-06', 5500000), 
	('HD06', 'BN06', 'DT06', '2022-01-15', 850000),
    ('HD07', 'BN07', 'DT07', '2022-02-10', 6700000),
    ('HD08', 'BN08', 'DT08', '2022-03-20', 900000),
    ('HD09', 'BN09', 'DT09', '2022-04-25', 1200000),
    ('HD10', 'BN10', 'DT10', '2022-05-30', 4800000),
	('HD11', 'BN11', 'DT11', '2022-06-10', 600000),
    ('HD12', 'BN12', 'DT12', '2022-07-15', 1100000),
    ('HD13', 'BN13', 'DT13', '2022-08-20', 4500000),
    ('HD14', 'BN14', 'DT14', '2022-09-25', 300000),
    ('HD15', 'BN15', 'DT15', '2022-10-30', 7500000);

SELECT * FROM HoaDon;

-- Chèn dữ liệu vào bảng HoaDon_DV
INSERT INTO HoaDon_DV(MaHD, MaDV, SoLuong)
VALUES
    ('HD01', 'DV01', 3),
    ('HD02', 'DV02', 5),
    ('HD03', 'DV03', 3),
    ('HD04', 'DV04', 6),
    ('HD05', 'DV05', 2),
    ('HD06', 'DV05', 4),
    ('HD07', 'DV06', 2),
    ('HD08', 'DV07', 1),
    ('HD09', 'DV08', 3),
    ('HD10', 'DV09', 5),
	('HD11', 'DV10', 3),
    ('HD12', 'DV11', 4),
    ('HD13', 'DV12', 2),
    ('HD14', 'DV13', 1),
    ('HD15', 'DV14', 5);
SELECT * FROM HoaDon_DV;

 /*Bài tập lớn bắt đầu từ đây*/

 /*1. Tạo view*/
 --1. Tạo view để xem thông tin hóa đơn và bệnh nhân
CREATE VIEW View_HoaDon_BenhNhan AS
SELECT HD.MaHD, BN.TenBN, HD.NgayLap, HD.TongTien
FROM HoaDon HD
JOIN BenhNhan BN ON HD.MaBN = BN.MaBN;

SELECT * FROM View_HoaDon_BenhNhan;

--2. Tạo view để xem thông tin bác sĩ và đơn thuốc.
CREATE VIEW View_BacSi_DonThuoc AS
SELECT
	BS.MaBS,
	BS.TenBS,
	DT.MaDT,
	DT.MaBN
FROM BacSi BS
JOIN DonThuoc DT on BS.MaBS = DT.MaBS

SELECT *FROM View_BacSi_DonThuoc;

--3. View hóa đơn kèm dịch vụ.
CREATE VIEW View_HoaDon_DichVu AS
SELECT 
    HD.MaHD,
    HD.NgayLap,
    HD.TongTien,
    DV.TenDV,
    HD_DV.SoLuong
FROM 
    HoaDon HD
JOIN 
    HoaDon_DV HD_DV ON HD.MaHD = HD_DV.MaHD
JOIN 
    DichVuKham DV ON HD_DV.MaDV = DV.MaDV;

SELECT * FROM View_HoaDon_DichVu;

--4. View chi tiết bệnh nhân.
CREATE VIEW View_BenhNhan_ChiTiet AS
SELECT 
	BN.MaBN,
	BN.TenBN,
	BN.GioiTinh,
	BN.NgaySinh,
	BN.DiaChi,
	BN.SoDienThoai
FROM BenhNhan BN

SELECT * FROM View_BenhNhan_ChiTiet;

--5. View đơn thuốc được bác sĩ cấp cho bệnh nhân.
CREATE VIEW View_DT_BN AS
SELECT 
	DT.MaDT,
	BN.TenBN,
	BS.MaBS
FROM DonThuoc DT
JOIN BenhNhan BN ON DT.MaBN = BN.MaBN
JOIN BacSi BS ON DT.MaBS = BS.MaBS

SELECT * FROM View_DT_BN;

--6. View chi tiết thông tin đơn thuốc
CREATE VIEW View_DT_ThongTin AS
SELECT 
	CT.MaDT,
	T.MaThuoc,
	T.TenThuoc,
	CT.SoLuong,
	T.DonGia
FROM CT_DonThuoc CT
JOIN Thuoc T ON CT.MaThuoc = T.MaThuoc

SELECT * FROM View_DT_ThongTin;

--7. View hóa đơn chi tiết đơn thuốc.
CREATE VIEW View_HD_CT AS
SELECT 
	HD.MaHD,
	BN.MaBN,
	HD.NgayLap,
	DT.MaDT,
	HD.TongTien
FROM HoaDon HD
JOIN BenhNhan BN ON HD.MaBN = BN.MaBN
JOIN DonThuoc DT ON HD.MaDT = DT.MaDT;

SELECT * FROM View_HD_CT;

--8. View thông tin bác sĩ kèm bệnh nhân họ đã điều trị.
CREATE VIEW View_BS_BN AS
SELECT 
	BS.MaBS,
	BS.TenBS,
	BN.TenBN
FROM BacSi BS
JOIN DonThuoc DT ON BS.MaBS = DT.MaBS
JOIN BenhNhan BN ON DT.MaBN = BN.MaBN;

SELECT * FROM View_BS_BN;

--9. View tổng doanh thu theo ngày.
CREATE VIEW View_DoanhThuTheoNgay AS
SELECT 
    HD.NgayLap,
    SUM(HD.TongTien) AS TongDoanhThu
FROM 
    HoaDon HD
GROUP BY 
    HD.NgayLap;

SELECT * FROM View_DoanhThuTheoNgay;

--10. View đếm tổng số bệnh nhân.
CREATE VIEW View_SLBN AS
SELECT
	COUNT(MaBN) AS TongSoBenhNhan
FROM BenhNhan;

SELECT * FROM View_SLBN;

/*2. Xây dựng các procedure*/
--1. Thêm bệnh nhân mới.
CREATE PROCEDURE ThemBenhNhan
    @MaBN VARCHAR(10),
    @TenBN NVARCHAR(30),
    @GioiTinh NVARCHAR(10),
    @NgaySinh DATE,
    @DiaChi NVARCHAR(255),
    @SoDienThoai VARCHAR(15),  
    @TinhTrangSucKhoe NVARCHAR(255)
AS
BEGIN
    INSERT INTO BenhNhan (MaBN, TenBN, GioiTinh, NgaySinh, DiaChi, SoDienThoai, TinhTrangSucKhoe)
    VALUES (@MaBN, @TenBN, @GioiTinh, @NgaySinh, @DiaChi, @SoDienThoai, @TinhTrangSucKhoe);
END;

EXEC ThemBenhNhan 'BN18', N'Đỗ Hải Nam', N'Nam', '1992-01-01', N'Hà Nội', '0123487889', N'Đau Ruột Thừa';

--2. Cập nhật thông tin bệnh nhân mới.
CREATE PROCEDURE UpdateTTBN 
	@MaBN VARCHAR(10),
    @TenBN NVARCHAR(30),
    @GioiTinh NVARCHAR(10),
    @NgaySinh DATE,
    @DiaChi NVARCHAR(255),
    @SoDienThoai VARCHAR(15),  
    @TinhTrangSucKhoe NVARCHAR(255)
AS
BEGIN
	UPDATE BenhNhan
	 SET MaBN = @MaBN, TenBN = @TenBN, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh,
	 DiaChi = @DiaChi, SoDienThoai = @SoDienThoai, TinhTrangSucKhoe = @TinhTrangSucKhoe
	 WHERE MaBN = @MaBN;
END;

EXEC UpdateTTBN 'BN16', N'Trần Văn Nam', N'Nam', '1980-01-01', N'Hà Nội', '0123456789', N'Sức khỏe ổn định';

--3. Xóa bệnh nhân.
CREATE PROCEDURE XoaBenhNhan
	@MaBN VARCHAR(10)
AS
BEGIN DELETE FROM BenhNhan WHERE MaBN = @MaBN;
END;

EXEC XoaBenhNhan 'BN16';

--4. Lấy thông tin bệnh nhân.
CREATE PROCEDURE LayInfoBN
	@MaBN VARCHAR(10)
AS
BEGIN SELECT * FROM BenhNhan WHERE MaBN = @MaBN;
END;

EXEC LayInfoBN 'BN17';

--5. Thêm đơn vị thuốc mới.
CREATE PROCEDURE ThemThuocMoi
	@MaThuoc VARCHAR(10),
	@TenThuoc NVARCHAR(10),
	@DonGia FLOAT
AS
BEGIN 
	INSERT INTO Thuoc(MaThuoc, TenThuoc, DonGia)
	VALUES (@MaThuoc, @TenThuoc, @DonGia);
END;

EXEC ThemThuocMoi 'T35', N'Panadol', 10000;

--6. Lấy danh sách thuốc.
CREATE PROCEDURE DSThuoc
AS
BEGIN 
SELECT * FROM Thuoc;
END;

EXEC DSThuoc;

--7. Tính toán chi phí khám bệnh.
CREATE PROCEDURE ChiPhiKhamBenh
	@MaBN VARCHAR(10)
AS
BEGIN
	SELECT SUM(TongTien) AS ChiPhi
	FROM HoaDon
	WHERE MaBN = @MaBN;
END;

EXEC ChiPhiKhamBenh 'BN15';

--8. Thống kê số lượng bệnh nhân theo giới tính.
CREATE PROCEDURE ThongTinTheoGT
AS
BEGIN SELECT GioiTinh, COUNT(*) AS SoLuong
	FROM BenhNhan
	GROUP BY GioiTinh;
END;

EXEC ThongTinTheoGT

--9. Lấy thông tin theo tình trạng bệnh nhân.
CREATE PROCEDURE TTSKBN
	@TinhTrangSucKhoe NVARCHAR(255)
AS
BEGIN SELECT * FROM BenhNhan WHERE TinhTrangSucKhoe = @TinhTrangSucKhoe;
END;
 EXEC TTSKBN N'Sốt';

 --10. Thống kê số lượng bác sĩ ở hà nội.
CREATE PROCEDURE BSTDC
AS
BEGIN SELECT DiaChi, COUNT(*) AS N'Số Lượng'
	FROM BacSi
	WHERE DiaChi = N'Hà Nội'
	GROUP BY DiaChi;
END;

EXEC BSTDC;

/*3. Tạo trigger*/
--1. trigger thông báo khi thêm một bệnh nhân mới.
CREATE TRIGGER trg_AfterInsert_BenhNhan
ON BenhNhan
AFTER INSERT
AS
BEGIN
    PRINT N'Đã thêm một bệnh nhân mới!';
END;
EXEC sp_helptext 'trg_AfterInsert_BenhNhan';

--2. Thông báo thêm bác sĩ mới.
CREATE TRIGGER trg_SauKhiChen_BacSi
ON BacSi
AFTER INSERT
AS
BEGIN
    PRINT N'Đã thêm thông tin bác sĩ mới!';
END;
EXEC sp_helptext 'trg_SauKhiChen_BacSi';

INSERT INTO BacSi(MaBS, TenBS, GioiTinh, NgaySinh, DiaChi, SoDienThoai, ChuyenNganh)
VALUES 
('BS35', N'Đỗ Thị Linh', N'Nữ', '1970-01-20', N'Hà Nội', '0988342657', N'Khoa tai mũi họng');


--3. Thông tin thuốc mới
CREATE TRIGGER trg_SauKhiChen_Thuoc
ON Thuoc
AFTER INSERT
AS
BEGIN
    PRINT N'Đã thêm thông tin thuốc mới';
END;

INSERT INTO Thuoc (MaThuoc, TenThuoc, DonGia) VALUES ('T01', 'Paracetamol', 100);
--4. Cập nhật trạng thái sức khỏe bệnh nhân.
CREATE TRIGGER trg_UpdateTinhTrangSucKhoe
ON DonThuoc
AFTER INSERT 
AS
BEGIN
    UPDATE BenhNhan SET TinhTrangSucKhoe = N'Đang điều trị' WHERE MaBN = 'BN18';
    PRINT N'Đã cập nhật tình trạng bệnh nhân!';
END;

INSERT INTO DonThuoc (MaDT, MaBS, MaBN) VALUES ('DT35', 'BS01', 'BN18');
SELECT * FROM BenhNhan WHERE MaBN = 'BN18';
SELECT TinhTrangSucKhoe from BenhNhan Where MaBN = 'BN18';
--5. Ghi lại thông tin chi tiết đơn thuốc mới.
CREATE TRIGGER trg_SauKhiChen_CT_DonThuoc
ON CT_DonThuoc
AFTER INSERT
AS
BEGIN
    PRINT N'Thông tin chi tiết đơn thuốc mới đã được ghi nhận!';
END;
INSERT INTO CT_DonThuoc (MaDT, MaThuoc, SoLuong) VALUES ('DT35', 'T04', 2);
select MaThuoc from CT_DonThuoc Where MaDT = 'DT35';
--6. Tính tổng hóa đơn theo mã đơn thuốc.
CREATE TRIGGER trg_SauKhiChen_HoaDon
ON HoaDon
AFTER INSERT
AS
BEGIN
    DECLARE @MaDT VARCHAR(10);
    SELECT @MaDT = MaDT FROM inserted;
    DECLARE @TongTien FLOAT;
    SELECT @TongTien = SUM(SoLuong * DonGia)
    FROM CT_DonThuoc CT
    JOIN Thuoc T ON CT.MaThuoc = T.MaThuoc
    WHERE CT.MaDT = @MaDT;

    UPDATE HoaDon SET TongTien = @TongTien WHERE MaDT = @MaDT;
END;

IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_SauKhiChen_HoaDon')
DROP TRIGGER trg_SauKhiChen_HoaDon;

SELECT * FROM HoaDon WHERE MaDT = 'DT02';
--7. Ghi lại dịch vụ khám 
CREATE TRIGGER trg_SauKhiChen_DichVuKham
ON DichVuKham
AFTER INSERT
AS
BEGIN
    PRINT N'Dịch vụ khám đã được ghi nhận!';
END;
delete from DichVuKham where MaDV = 'DV20';
INSERT INTO DichVuKham (MaDV, TenDV, DonGia)
VALUES ('DV20', N'Siêu âm', 450000);
select TenDv, DonGia from DichVuKham where MaDV = 'DV20';
--8. Ngăn chặn chèn bệnh nhân có MaBN bị trùng.
CREATE TRIGGER ChanMaBNTL
ON BenhNhan
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i INNER JOIN BenhNhan bn ON i.MaBN = bn.MaBN)
    BEGIN
        RAISERROR(N'Mã bệnh nhân bị trùng!', 16, 1);
        ROLLBACK TRANSACTION;
        PRINT N'Chèn không thành công do mã bệnh nhân bị trùng!';
    END
    ELSE
    BEGIN
        INSERT INTO BenhNhan SELECT * FROM inserted;
        PRINT N'Chèn bệnh nhân thành công!';
    END
END;

INSERT INTO BenhNhan (MaBN, TenBN, GioiTinh, NgaySinh, DiaChi, SoDienThoai, TinhTrangSucKhoe)
VALUES ('BN01', N'Tran Van A', N'Nam', '1990-01-01', N'Hà Nội', '0123456789', N'Sức khỏe tốt');
--9.Tự động cập nhật khi xóa thuốc.
CREATE TRIGGER trg_UpdateCT_DonThuoc_AfterDelete
ON Thuoc
AFTER DELETE 
AS
BEGIN
    DELETE FROM CT_DonThuoc WHERE MaThuoc = 'T13';
    PRINT N'Đã xóa chi tiết đơn thuốc liên quan đến thuốc đã xóa!';
END;
INSERT INTO
Thuoc(MaThuoc,TenThuoc,DonGia)
VALUES	('T13', N'Atorvastatin', '90000');
DELETE FROM Thuoc WHERE MaThuoc = 'T13';
--10. Ghi lại thông tin bệnh nhân khi có thay đổi thông tin.
CREATE TRIGGER trg_SauKhiChen_BenhNhan
ON BenhNhan
AFTER UPDATE
AS
BEGIN
    PRINT N'Thông tin bệnh nhân cập nhật đã được ghi lại!';
END;

UPDATE BenhNhan
SET GioiTinh = N'Nữ'
WHERE MaBN = 'BN01';

select * from BenhNhan where MaBN = 'BN01';


/*4. phân quyền */

--Tạo role quản lý.
CREATE ROLE QuanLy;

--Tạo role cho nhân viên.
CREATE ROLE NhanVien;

--Tạo role cho khách hàng.
CREATE ROLE KhachHang;

--Gán quyền cho từng role.

--Quản lý có quyền cao nhất
GRANT SELECT, INSERT, UPDATE, DELETE ON BenhNhan TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON BacSi TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON Thuoc TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON DonThuoc TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON CT_DonThuoc TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON HoaDon TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON DichVuKham TO QuanLy;

--Nhân viên chỉ cần quyền SELECT và INSERT

GRANT SELECT, INSERT ON BacSi TO NhanVien;
GRANT SELECT, INSERT ON Thuoc TO NhanVien;
GRANT SELECT ON BenhNhan TO NhanVien;
GRANT SELECT, INSERT ON DonThuoc TO NhanVien;
GRANT SELECT ON CT_DonThuoc TO NhanVien;
GRANT SELECT ON HoaDon TO NhanVien;
GRANT SELECT ON DichVuKham TO NhanVien;

--Khách hàng chỉ có quyền SELECT để xem thông tin
GRANT SELECT ON BenhNhan TO KhachHang;
GRANT SELECT ON Thuoc TO KhachHang;
GRANT SELECT ON DichVuKham TO KhachHang;

--Gán user vào Role
EXEC sp_addrolemember 'QuanLy', 'UserManager';
EXEC sp_addrolemember 'NhanVien', 'UserStaff';
EXEC sp_addrolemember 'KhachHang', 'UserCustomer';


--Tạo tài khoản đăng nhập (login) 
CREATE LOGIN UserCustomer WITH PASSWORD = '1234567';
CREATE LOGIN UserManager WITH PASSWORD = '1234567';
CREATE LOGIN UserStaff WITH PASSWORD = '1234567';
--Tạo người dùng trong cơ sở dữ liệu.
USE qlybenhvien1;
CREATE USER UserCustomer FOR LOGIN UserCustomer;

USE qlybenhvien1;
CREATE USER UserManager FOR LOGIN UserManager;

USE qlybenhvien1;
CREATE USER UserStaff FOR LOGIN UserStaff;



--test case:
--Quản lý được phép INSERT, SELECT, UPDATE và DELETE.
INSERT INTO BenhNhan(MaBN, TenBN, GioiTinh, NgaySinh, DiaChi, SoDienThoai, TinhTrangSucKhoe)
VALUES
('BN19',N'Nguyễn Thị Lan Anh',N'Nữ','07/11/2004',N'Hà Nội','0264765982', N'Đau bụng');

select * from BenhNhan;

UPDATE BenhNhan SET TinhTrangSucKhoe = N'Đang điều trị' WHERE MaBN = 'BN19';

delete from BenhNhan WHERE MaBN = 'BN19';

--Nhân viên chỉ có quyền được INSERT và SELECT (trừ các bảng đó là BacSi, Thuoc và DonThuoc là được quyền INSERT còn lại sẽ chỉ được cấp quyền SELECT)
INSERT INTO BacSi(MaBS, TenBS, GioiTinh, NgaySinh, DiaChi, SoDienThoai, ChuyenNganh)
VALUES
('BN17', N'Trần Thạch Anh', N'Nam', '09/10/1992', N'Mê Linh', '0123456789', N'Đa khoa');

select * from BacSi;

--Khách hàng chỉ được phần quyền SELECT ở các bảng BenhNhan, Thuoc và DichVuKham.
select * from BenhNhan;






















