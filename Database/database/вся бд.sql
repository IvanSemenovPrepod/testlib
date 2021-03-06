USE [master]
GO
/****** Object:  Database [libraryBook0.1]    Script Date: 16.03.2022 9:08:02 ******/
CREATE DATABASE [libraryBook0.1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libraryBook0.1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\libraryBook0.1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libraryBook0.1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\libraryBook0.1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [libraryBook0.1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libraryBook0.1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libraryBook0.1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libraryBook0.1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libraryBook0.1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libraryBook0.1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libraryBook0.1] SET ARITHABORT OFF 
GO
ALTER DATABASE [libraryBook0.1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [libraryBook0.1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libraryBook0.1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libraryBook0.1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libraryBook0.1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libraryBook0.1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libraryBook0.1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libraryBook0.1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libraryBook0.1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libraryBook0.1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [libraryBook0.1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libraryBook0.1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libraryBook0.1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libraryBook0.1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libraryBook0.1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libraryBook0.1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libraryBook0.1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libraryBook0.1] SET RECOVERY FULL 
GO
ALTER DATABASE [libraryBook0.1] SET  MULTI_USER 
GO
ALTER DATABASE [libraryBook0.1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libraryBook0.1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libraryBook0.1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libraryBook0.1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libraryBook0.1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [libraryBook0.1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'libraryBook0.1', N'ON'
GO
ALTER DATABASE [libraryBook0.1] SET QUERY_STORE = OFF
GO
USE [libraryBook0.1]
GO
/****** Object:  User [root]    Script Date: 16.03.2022 9:08:02 ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [root]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [root]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [root]
GO
ALTER ROLE [db_datareader] ADD MEMBER [root]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [root]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](100) NULL,
	[SecondName] [nchar](100) NULL,
	[LastName] [nchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_user] [int] NULL,
	[Id_group] [int] NULL,
	[course] [int] NULL,
	[zaochnoe] [int] NULL,
	[dateExit] [date] NULL,
	[dateIn] [date] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
	[LittleName] [nchar](20) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vStudents]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vStudents]
AS
SELECT        dbo.Students.dateIn, dbo.Students.dateExit, dbo.Students.zaochnoe, dbo.Students.course, dbo.Users.LastName, dbo.Users.SecondName, dbo.Users.FirstName, dbo.Groups.Name, dbo.Groups.LittleName, dbo.Students.Id
FROM            dbo.Students LEFT OUTER JOIN
                         dbo.Users ON dbo.Students.Id_user = dbo.Users.Id LEFT OUTER JOIN
                         dbo.Groups ON dbo.Students.Id_group = dbo.Groups.Id
GO
/****** Object:  Table [dbo].[BooksOfStudent]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksOfStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [int] NULL,
	[Student_Id] [int] NULL,
 CONSTRAINT [PK_BooksOfStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nchar](1000) NULL,
	[Author_id] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vBooksOfStudents]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBooksOfStudents]
AS
SELECT        dbo.Books.BookName, dbo.Students.Id_user, dbo.Users.FirstName, dbo.Users.SecondName, dbo.Users.LastName, dbo.Students.Id
FROM            dbo.Books INNER JOIN
                         dbo.BooksOfStudent ON dbo.Books.Id = dbo.BooksOfStudent.Book_Id INNER JOIN
                         dbo.Students ON dbo.BooksOfStudent.Student_Id = dbo.Students.Id INNER JOIN
                         dbo.Users ON dbo.Students.Id_user = dbo.Users.Id INNER JOIN
                         dbo.Groups ON dbo.Students.Id_group = dbo.Groups.Id
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Lesson] [nchar](100) NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTeachers]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTeachers]
AS
SELECT        dbo.Teachers.Lesson, dbo.Teachers.Id, dbo.Users.FirstName, dbo.Users.SecondName, dbo.Users.LastName
FROM            dbo.Teachers LEFT OUTER JOIN
                         dbo.Users ON dbo.Teachers.User_Id = dbo.Users.Id
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 16.03.2022 9:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nchar](100) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[LastDateLogon] [datetime] NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([Id_group])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
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
         Begin Table = "Books"
            Begin Extent = 
               Top = 6
               Left = 20
               Bottom = 203
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BooksOfStudent"
            Begin Extent = 
               Top = 107
               Left = 227
               Bottom = 254
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 233
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 76
               Left = 707
               Bottom = 253
               Right = 881
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Groups"
            Begin Extent = 
               Top = 246
               Left = 423
               Bottom = 359
               Right = 597
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
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBooksOfStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBooksOfStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBooksOfStudents'
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
         Begin Table = "Students"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 237
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 40
               Left = 274
               Bottom = 190
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Groups"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 195
               Right = 636
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
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
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 247
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teachers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 212
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vTeachers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vTeachers'
GO
USE [master]
GO
ALTER DATABASE [libraryBook0.1] SET  READ_WRITE 
GO
