/*
a. (2?) T?o csdl QLBanHang g?m 3 b?ng: 
+ CongTy(MaCT,TenCT,TrangThai,ThanhPho)
+ SanPham(MaSP, TenSP, MauSac,Gia,SoluongCo)
+ Cungung(MaCT,MaSP, SoLuongBan)
b. (4?) Th�m c�c r�ng bu?c v�o c�c b?ng trong CSDL Qu?n l� sinh vi�n:
B?ng s?n ph?m:
- M�u s?c m?c ??nh l� m�u ??
- T�n s?n ph?m ph?i l� duy nh?t
B?ng cung ?ng:
- S? l??ng b�n >0
c. (2?) Nh?p d? li?u: 3 c�ng ty, 3 s?n ph?m, 6 cung ?ng
d. (2?) T?o l?nh th?c thi hi?n th? th�ng tin c?a c�c b?ng
*/

CREATE DATABASE QLBanHang

USE QLBanHang

CREATE TABLE CongTy(
	[M� C�ng Ty] char(10) PRIMARY KEY,
	[T�n C�ng Ty] nvarchar(20),
	[Tr?ng Th�i] int,
	[Th�nh Ph?] nvarchar(50)
)

CREATE TABLE SanPham(
	[M� S?n Ph?m] char(10) PRIMARY KEY,
	[T�n S?n Ph?m] nvarchar(20),
	[M�u S?c] nvarchar(20),
	[Gi�] money,
	[S? L??ng C�] int
)

CREATE TABLE CungUng(
	[M� C�ng Ty] char(10),
	[M� S?n Ph?m] char(10),
	[S? L??ng B�n] int,
	CONSTRAINT [Ahihi ?? Ng?c] PRIMARY KEY([M� C�ng Ty], [M� S?n Ph?m])
)

-- B
ALTER TABLE SanPham
ADD CONSTRAINT [R�ng Bu?c M�u S?c]
DEFAULT N'??' FOR [M�u S?c]

ALTER TABLE SanPham DROP CONSTRAINT [R�ng Bu?c M�u S?c]
-- R�ng bu?c kh�a ph? unique
ALTER TABLE SanPham ADD CONSTRAINT [T�n S?n Ph?m Duy Nh?t] UNIQUE([T�n S?n Ph?m])

ALTER TABLE CungUng ADD CONSTRAINT [S? L??ng B�n > 10] CHECK([S? L??ng B�n] > 0)

INSERT INTO CongTy VALUES('CT01', N'C�ng Ty 01', 1, N'C?u Gi?y, H� N?i'),
						  ('CT02', N'C�ng Ty 02', 1, N'Hai B� Tr?ng, H� N?i'),
						  ('CT03', N'C�ng Ty 02', 0, N'Long Bi�n, H� N?i')
SELECT * FROM CongTy
INSERT INTO SanPham VALUES('SP01', N'S?n Ph?m 01', N'V�ng', 10000, 1000),
						  ('SP02', N'S?n Ph?m 02', N'Xanh L�', 10000, 1000)

SELECT * FROM SanPham
INSERT INTO SanPham([M� S?n Ph?m], [T�n S?n Ph?m], [Gi�], [S? L??ng C�]) VALUES('SP04', N'S?n Ph?m 04', 45000, 100)

