CREATE DATABASE QLSHOP
GO
USE [QLSHOP]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[SOHD] [int] NOT NULL,
	[MASP] [char](4) NOT NULL,
	[SL] [int] NULL,
 CONSTRAINT [pk_cthd] PRIMARY KEY CLUSTERED 
(
	[SOHD] ASC,
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DICHVU]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DICHVU](
	[MADV] [char](4) NOT NULL,
	[TENDV] [nvarchar](100) NULL,
	[GIA] [float] NOT NULL,
 CONSTRAINT [pk_dv] PRIMARY KEY CLUSTERED 
(
	[MADV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVHD]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVHD](
	[SOHD] [int] NOT NULL,
	[MADV] [char](4) NOT NULL,
	[SL] [int] NULL,
 CONSTRAINT [pk_dvhd] PRIMARY KEY CLUSTERED 
(
	[SOHD] ASC,
	[MADV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[SOHD] [int] NOT NULL,
	[NGHD] [date] NULL,
	[MAKH] [char](4) NULL,
	[MANV] [char](4) NULL,
	[TRIGIA] [float] NULL,
 CONSTRAINT [pk_hd] PRIMARY KEY CLUSTERED 
(
	[SOHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MAKH] [char](4) NOT NULL,
	[HOTEN] [varchar](40) NULL,
	[DCHI] [varchar](50) NULL,
	[SODT] [varchar](20) NULL,
	[NGSINH] [date] NULL,
	[NGDK] [date] NULL,
	[DOANHSO] [float] NULL,
 CONSTRAINT [pk_kh] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [char](4) NOT NULL,
	[HOTEN] [varchar](40) NULL,
	[SODT] [varchar](20) NULL,
	[NGSINH] [date] NULL,
 CONSTRAINT [pk_nv] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 3/29/2024 7:46:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MASP] [char](4) NOT NULL,
	[TENSP] [varchar](40) NOT NULL,
	[PHAI] [varchar](10) NULL,
	[QUOCGIA] [varchar] (20) NULL,
	[NGSINH] [date] NULL,
	[GIA] [float] NOT NULL,
	[NGAYDANG] [date] NULL,
	[SOLUOTXEM] [int] NULL,
	[Hinh] [varchar] (50) NOT NULL,
 CONSTRAINT [pk_sp] PRIMARY KEY CLUSTERED 
(
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [fk01_CTHD] FOREIGN KEY([SOHD])
REFERENCES [dbo].[HOADON] ([SOHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [fk01_CTHD]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [fk02_CTHD] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MASP])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [fk02_CTHD]
GO
ALTER TABLE [dbo].[DVHD]  WITH CHECK ADD  CONSTRAINT [fk01_DVHD] FOREIGN KEY([SOHD])
REFERENCES [dbo].[HOADON] ([SOHD])
GO
ALTER TABLE [dbo].[DVHD] CHECK CONSTRAINT [fk01_DVHD]
GO
ALTER TABLE [dbo].[DVHD]  WITH CHECK ADD  CONSTRAINT [fk02_DVHD] FOREIGN KEY([MADV])
REFERENCES [dbo].[DICHVU] ([MADV])
GO
ALTER TABLE [dbo].[DVHD] CHECK CONSTRAINT [fk02_DVHD]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [fk01_HD] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [fk01_HD]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [fk02_HD] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [fk02_HD]
GO
insert into KHACHHANG values('KH01','NUYEN VAN A','731 Tran Hung Dao, Q5, TpHCM','8823451','11/10/1960','02/07/2006',13060000)
insert into KHACHHANG values('KH02','TRAN NGOC HAN','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','03/07/2006',280000)
insert into KHACHHANG values('KH03','TRAN NGOC LINH','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into KHACHHANG values('KH04','TRAN MINH TRONG','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into KHACHHANG values('KH05','LE MINH NHAT','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','04/10/2006',21000)
insert into KHACHHANG values('KH06','LE HOAI THUONG','227 Nguyen Van Cu, Q5, TpHCM','8631738','01/12/1981','02/11/2006',915000)
insert into KHACHHANG values('KH07','NGUYEN VAN TAM','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into KHACHHANG values('KH08','PHAM THI HANG','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','11/12/2006',365000)
insert into KHACHHANG values('KH09','NGUYEN HUY HOANG','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','05/01/2007',70000)
insert into KHACHHANG values('KH10','LE XUAN TRUONG','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','09/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into NHANVIEN values('NV01','NGUYEN QUOC DAT','927345678','12/13/2004')
insert into NHANVIEN values('NV02','HUYNH VAN TRUONG','987567390','07/21/2004')
insert into NHANVIEN values('NV03','PHAM NGOC DUONG','997047382','08/04/2004')
insert into NHANVIEN values('NV04','NGUYEN BUI QUOC TAN','913758498','09/24/2004')

-------------------------------
-- SANPHAM
insert into SANPHAM values('SP01','Alaska Malamute','DUC','Alaska','03/22/2023',10000,CAST(0x00009E4A00000000 AS DateTime),111)
insert into SANPHAM values('SP02','Alaska Malamute','CAI','Alaska','02/22/2023',10000,CAST(0x00009E4A00000000 AS DateTime),111)
insert into SANPHAM values('SP03','Shiba','DUC','JAPAN','10/01/2023',19000,CAST(0x00009E4A00000000 AS DateTime),222)
insert into SANPHAM values('SP04','Shiba','CAI','JAPAN','10/01/2023',19000,CAST(0x00009E4A00000000 AS DateTime),222)
insert into SANPHAM values('SP05','Chó ngao Anh','DUC','England','01/02/2023',100000,CAST(0x00009E4A00000000 AS DateTime),333)
insert into SANPHAM values('SP06','Chó ngao Anh','CAI','England','01/02/2023',100000,CAST(0x00009E4A00000000 AS DateTime),333)
insert into SANPHAM values('SP07','Chó núi Bernese','DUC','THUY DIEN','03/02/2023',15000,CAST(0x00009E4A00000000 AS DateTime),444)
insert into SANPHAM values('SP08','Chó núi Bernese','CAI','THUY DIEN','03/02/2023',10000,CAST(0x00009E4A00000000 AS DateTime),444)
insert into SANPHAM values('SP09','Beauceron','DUC','PHAP','02/01/2023',35000,CAST(0x00009E4A00000000 AS DateTime),555)
insert into SANPHAM values('SP10','Beauceron','CAI','PHAP','02/01/2023',29000,CAST(0x00009E4A00000000 AS DateTime),555)
insert into SANPHAM values('SP11','Briard','DUC','PHAP','10/02/2023',58000,CAST(0x00009E4A00000000 AS DateTime),666)
insert into SANPHAM values('SP12','Briard','CAI','PHAP','10/02/2023',50000,CAST(0x00009E4A00000000 AS DateTime),666)
insert into SANPHAM values('SP13','Bullmastiff','DUC','England','02/03/2023',54000,CAST(0x00009E4A00000000 AS DateTime),777)
insert into SANPHAM values('SP14','Bullmastiff','CAI','England','02/03/2023',50000,CAST(0x00009E4A00000000 AS DateTime),777)
insert into SANPHAM values('SP15','Goldens','DUC','MY','01/05/2023',10000,CAST(0x00009E4A00000000 AS DateTime),888)
insert into SANPHAM values('SP16','Goldens','CAI','MY','01/05/2023',9000,CAST(0x00009E4A00000000 AS DateTime),888)
insert into SANPHAM values('SP17','Chó sói Ailen','DUC','Rome','04/04/2023',78000,CAST(0x00009E4A00000000 AS DateTime),999)
insert into SANPHAM values('SP18','Chó sói Ailen','CAI','Rome','04/04/2023',78000,CAST(0x00009E4A00000000 AS DateTime),999)
insert into SANPHAM values('SP19','Chó ngao Tây Ban Nha','DUC','TAY BAN NHA','02/02/2023',23000,CAST(0x00009E4A00000000 AS DateTime),1000)
insert into SANPHAM values('SP20','Chó ngao Tây Ban Nha','CAI','TAY BAN NHA','02/02/2023',23000,CAST(0x00009E4A00000000 AS DateTime),1000)
insert into SANPHAM values('SP21','Basset Hound','DUC','EngLand','02/02/2023',20000,CAST(0x00009E4A00000000 AS DateTime),123)
insert into SANPHAM values('SP22','Basset Hound','CAI','EngLand','02/02/2023',20000,CAST(0x00009E4A00000000 AS DateTime),123)
insert into SANPHAM values('SP23','Beagle','DUC','England','04/02/2023',46000,CAST(0x00009E4A00000000 AS DateTime),234)
insert into SANPHAM values('SP24','Beagle','CAI','England','04/02/2023',46000,CAST(0x00009E4A00000000 AS DateTime),234)
insert into SANPHAM values('SP25','Welsh Corgi','DUC','Wales','02/01/2023',23000,CAST(0x00009E4A00000000 AS DateTime),345)
insert into SANPHAM values('SP26','Welsh Corgi','CAI','Wales','02/01/2023',20000,CAST(0x00009E4A00000000 AS DateTime),345)
insert into SANPHAM values('SP27','Pug','DUC','China','12/06/2023',6000,CAST(0x00009E4A00000000 AS DateTime),456)
insert into SANPHAM values('SP28','Pug','CAI','China','12/06/2023',6000,CAST(0x00009E4A00000000 AS DateTime),456)
insert into SANPHAM values('SP29','Pitzanian Spitz','DUC','BAC CHAU AU','10/04/2023',51000,CAST(0x00009E4A00000000 AS DateTime),567)
insert into SANPHAM values('SP30','Pitzanian Spitz','CAI','BAC CHAU AU','10/04/2023',51000,CAST(0x00009E4A00000000 AS DateTime),567)
insert into SANPHAM values('SP31','Poodle','DUC','PHAP','06/03/2023',10000,CAST(0x00009E4A00000000 AS DateTime),678)
insert into SANPHAM values('SP32','Poodle','CAI','PHAP','06/03/2023',10000,CAST(0x00009E4A00000000 AS DateTime),678)
insert into SANPHAM values('SP33','Chihuahua','DUC','Mexico','08/03/2023',18000,CAST(0x00009E4A00000000 AS DateTime),789)
insert into SANPHAM values('SP34','Chihuahua','CAI','Mexico','08/03/2023',18000,CAST(0x00009E4A00000000 AS DateTime),789)

-------------------------------
-- DICHVU
insert into DICHVU values('DV01','DV cham soc thu cung',100000)
insert into DICHVU  values('DV02','DV tam spa, lam dep',200000)
insert into DICHVU  values('DV03','DV go roi , trai long',50000)
insert into DICHVU  values('DV04','Cat mai mong',50000)
insert into DICHVU  values('DV05','DV cham soc thu cung tai nha',250000)
insert into DICHVU  values('DV06','DV cham soc thu cung tai nha full combo',400000)
insert into DICHVU  values('DV07','COMBO 1',300000)
insert into DICHVU  values('DV08','COMBO 2',300000)

-------------------------------
-- HOADON
insert into HOADON values(1001,'02/07/2022','KH01','NV01',320000)
insert into HOADON values(1002,'01/08/2022','KH05','NV02',840000)
insert into HOADON values(1003,'01/08/2022','KH02','NV01',100000)
insert into HOADON values(1004,'01/09/2022','KH03','NV01',180000)
insert into HOADON values(1005,'10/10/2022','KH01','NV02',3800000)
insert into HOADON values(1006,'11/10/2022','KH01','NV03',2430000)
insert into HOADON values(1007,'04/10/2022','KH03','NV03',510000)
insert into HOADON values(1008,'05/10/2022','KH01','NV03',440000)
insert into HOADON values(1009,'02/10/2022','KH03','NV04',200000)
insert into HOADON values(1010,'01/11/2022','KH01','NV01',5200000)
insert into HOADON values(1011,'04/11/2022','KH04','NV03',250000)
insert into HOADON values(1012,'09/11/2022','KH05','NV03',21000)
insert into HOADON values(1013,'12/12/2022','KH06','NV01',5000)
insert into HOADON values(1014,'03/12/2022','KH03','NV02',3150000)
insert into HOADON values(1015,'01/01/2023','KH06','NV01',910000)
insert into HOADON values(1016,'01/01/2023','KH07','NV02',12500)
insert into HOADON values(1017,'02/01/2023','KH08','NV03',35000)
insert into HOADON values(1018,'12/01/2023','KH08','NV03',330000)
insert into HOADON values(1019,'10/01/2023','KH01','NV03',30000)
insert into HOADON values(1020,'10/01/2023','KH09','NV04',70000)
insert into HOADON values(1021,'10/01/2023','KH10','NV03',67500)

-------------------------------
-- CTHD
insert into CTHD values(1001,'SP01',1)
insert into CTHD values(1002,'SP01',2)
insert into CTHD values(1003,'SP22',1)
insert into CTHD values(1004,'SP11',2)
insert into CTHD values(1005,'SP06',3)
insert into CTHD values(1006,'SP02',1)
insert into CTHD values(1007,'SP19',1)
insert into CTHD values(1008,'SP16',1)
insert into CTHD values(1009,'SP33',1)
insert into CTHD values(1010,'SP10',1)
insert into CTHD values(1011,'SP20',2)
insert into CTHD values(1012,'SP30',3)
insert into CTHD values(1013,'SP12',1)
insert into CTHD values(1014,'SP16',2)
insert into CTHD values(1015,'SP04',1)
insert into CTHD values(1016,'SP33',1)
insert into CTHD values(1017,'SP34',1)
insert into CTHD values(1018,'SP17',2)
insert into CTHD values(1019,'SP09',2)
insert into CTHD values(1020,'SP29',1)
insert into CTHD values(1021,'SP28',1)


--------------------------------------
--DVHD
insert into DVHD values(1001,'DV01',1)
insert into DVHD values(1002,'DV02',1)
insert into DVHD values(1003,'DV03',1)
insert into DVHD values(1004,'DV04',1)
insert into DVHD values(1005,'DV05',1)
insert into DVHD values(1006,'DV06',1)
insert into DVHD values(1007,'DV07',1)
insert into DVHD values(1008,'DV08',1)
insert into DVHD values(1009,'DV01',1)
insert into DVHD values(1010,'DV02',1)
insert into DVHD values(1011,'DV03',1)
insert into DVHD values(1012,'DV04',1)
insert into DVHD values(1013,'DV05',1)
insert into DVHD values(1014,'DV06',1)
insert into DVHD values(1015,'DV07',1)
insert into DVHD values(1016,'DV08',1)
insert into DVHD values(1017,'DV01',1)
insert into DVHD values(1018,'DV02',1)
insert into DVHD values(1019,'DV03',1)
insert into DVHD values(1020,'DV04',1)
insert into DVHD values(1021,'DV05',1)

