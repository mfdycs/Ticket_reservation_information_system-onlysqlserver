USE [master]
GO
/****** Object:  Database [机票预定信息系统]    Script Date: 2018/12/12 22:02:35 ******/
CREATE DATABASE [机票预定信息系统]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'机票预定信息系统', FILENAME = N'E:\我\文件\作业\数据库原理及应用\数据库设计大作业\机票预定信息系统\机票预定信息系统.mdf' , SIZE = 10240KB , MAXSIZE = 204800KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'机票预定信息系统_log', FILENAME = N'E:\我\文件\作业\数据库原理及应用\数据库设计大作业\机票预定信息系统\机票预定信息系统_log.ldf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [机票预定信息系统] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [机票预定信息系统].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [机票预定信息系统] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [机票预定信息系统] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [机票预定信息系统] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [机票预定信息系统] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [机票预定信息系统] SET ARITHABORT OFF 
GO
ALTER DATABASE [机票预定信息系统] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [机票预定信息系统] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [机票预定信息系统] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [机票预定信息系统] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [机票预定信息系统] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [机票预定信息系统] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [机票预定信息系统] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [机票预定信息系统] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [机票预定信息系统] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [机票预定信息系统] SET  DISABLE_BROKER 
GO
ALTER DATABASE [机票预定信息系统] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [机票预定信息系统] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [机票预定信息系统] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [机票预定信息系统] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [机票预定信息系统] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [机票预定信息系统] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [机票预定信息系统] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [机票预定信息系统] SET RECOVERY FULL 
GO
ALTER DATABASE [机票预定信息系统] SET  MULTI_USER 
GO
ALTER DATABASE [机票预定信息系统] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [机票预定信息系统] SET DB_CHAINING OFF 
GO
ALTER DATABASE [机票预定信息系统] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [机票预定信息系统] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [机票预定信息系统] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'机票预定信息系统', N'ON'
GO
ALTER DATABASE [机票预定信息系统] SET QUERY_STORE = OFF
GO
USE [机票预定信息系统]
GO
/****** Object:  DatabaseRole [Users]    Script Date: 2018/12/12 22:02:35 ******/
CREATE ROLE [Users]
GO
/****** Object:  DatabaseRole [Customers]    Script Date: 2018/12/12 22:02:35 ******/
CREATE ROLE [Customers]
GO
/****** Object:  DatabaseRole [Costomers]    Script Date: 2018/12/12 22:02:35 ******/
CREATE ROLE [Costomers]
GO
/****** Object:  Table [dbo].[Plane]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plane](
	[PlaneID] [nvarchar](50) NOT NULL,
	[PlaneName] [nvarchar](50) NOT NULL,
	[PlaneType] [nvarchar](10) NOT NULL,
	[PlaneSeat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Line]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line](
	[LineID] [nvarchar](50) NOT NULL,
	[Begin_Place] [nvarchar](100) NOT NULL,
	[End_Place] [nvarchar](100) NOT NULL,
	[Begin_Time] [datetime] NOT NULL,
	[End_Time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlyID] [nvarchar](50) NOT NULL,
	[PlaneID] [nvarchar](50) NOT NULL,
	[LineID] [nvarchar](50) NOT NULL,
	[Remaining] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FlyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTicket]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTicket](
	[BookID] [nvarchar](255) NOT NULL,
	[Price] [int] NOT NULL,
	[Discount] [nvarchar](10) NULL,
	[Grade] [char](1) NOT NULL,
	[Ticket_Status] [nvarchar](10) NOT NULL,
	[Users_id] [nvarchar](20) NOT NULL,
	[Customer_id] [char](18) NOT NULL,
	[FlyID] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Customer_View]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customer_View]
AS
SELECT   B.FlyID, F.PlaneID, F.LineID, B.Price, B.Grade, L.Begin_Time, L.End_Time, L.Begin_Place, L.End_Place, P.PlaneName, 
                B.BookID
FROM      dbo.BookTicket AS B CROSS JOIN
                dbo.Flight AS F CROSS JOIN
                dbo.Line AS L CROSS JOIN
                dbo.Plane AS P
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_idform] [nvarchar](50) NOT NULL,
	[Customer_id] [char](18) NOT NULL,
	[Customer_name] [nvarchar](50) NOT NULL,
	[Customer_phone] [char](11) NOT NULL,
	[Customer_pay] [nvarchar](20) NOT NULL,
	[Customer_Passwd] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Users_Ma_View]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Users_Ma_View]
AS
SELECT C.Customer_id, C.Customer_name, C.Customer_phone, BookID, Price, Grade, Ticket_Status, FlyID
FROM Customer C, BookTicket B
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2018/12/12 22:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Users_name] [nvarchar](50) NOT NULL,
	[Users_id] [nvarchar](20) NOT NULL,
	[Users_passwed] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BookID_Index]    Script Date: 2018/12/12 22:02:35 ******/
CREATE NONCLUSTERED INDEX [BookID_Index] ON [dbo].[BookTicket]
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Flyid_Index]    Script Date: 2018/12/12 22:02:35 ******/
CREATE NONCLUSTERED INDEX [Flyid_Index] ON [dbo].[Flight]
(
	[FlyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookTicket]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO
ALTER TABLE [dbo].[BookTicket]  WITH CHECK ADD FOREIGN KEY([FlyID])
REFERENCES [dbo].[Flight] ([FlyID])
GO
ALTER TABLE [dbo].[BookTicket]  WITH CHECK ADD FOREIGN KEY([Users_id])
REFERENCES [dbo].[Users] ([Users_id])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([LineID])
REFERENCES [dbo].[Line] ([LineID])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([PlaneID])
REFERENCES [dbo].[Plane] ([PlaneID])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [Remaining_CHECK] CHECK  (([Remaining]>=(0) AND [Remaining]<=(1000)))
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [Remaining_CHECK]
GO
ALTER TABLE [dbo].[Plane]  WITH CHECK ADD  CONSTRAINT [Plane_CHECK] CHECK  (([PlaneSeat]>=(0) AND [PlaneSeat]<=(1000)))
GO
ALTER TABLE [dbo].[Plane] CHECK CONSTRAINT [Plane_CHECK]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 6
               Left = 239
               Bottom = 146
               Right = 389
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 150
               Left = 233
               Bottom = 290
               Right = 388
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customer_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customer_View'
GO
USE [master]
GO
ALTER DATABASE [机票预定信息系统] SET  READ_WRITE 
GO
