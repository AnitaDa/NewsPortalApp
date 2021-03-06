USE [master]
GO
/****** Object:  Database [Portal]    Script Date: 2/8/2021 2:18:57 AM ******/
CREATE DATABASE [Portal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Portal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Portal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Portal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Portal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Portal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Portal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Portal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Portal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Portal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Portal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Portal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Portal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Portal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Portal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Portal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Portal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Portal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Portal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Portal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Portal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Portal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Portal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Portal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Portal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Portal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Portal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Portal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Portal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Portal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Portal] SET  MULTI_USER 
GO
ALTER DATABASE [Portal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Portal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Portal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Portal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Portal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Portal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Portal] SET QUERY_STORE = OFF
GO
USE [Portal]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 2/8/2021 2:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[AdministratorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdministratorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorPost]    Script Date: 2/8/2021 2:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorPost](
	[AdministratorId] [int] NULL,
	[PostId] [int] NULL,
	[AdministratorPostId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdministratorPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 2/8/2021 2:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[PostDate] [datetime] NULL,
	[Content] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rola]    Script Date: 2/8/2021 2:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rola](
	[RolaId] [int] IDENTITY(1,1) NOT NULL,
	[RolaName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RolaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserN]    Script Date: 2/8/2021 2:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserN](
	[UserNId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](30) NULL,
	[UserName] [nvarchar](30) NULL,
	[LozinkaHash] [nvarchar](50) NULL,
	[LozinkaSalt] [nvarchar](50) NULL,
	[RolaId] [int] NULL,
	[AdministratorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserNId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([AdministratorId], [FirstName], [LastName]) VALUES (3, N'Anita', N'Dautovic')
INSERT [dbo].[Administrator] ([AdministratorId], [FirstName], [LastName]) VALUES (4, N'Test', N'Test')
INSERT [dbo].[Administrator] ([AdministratorId], [FirstName], [LastName]) VALUES (5, N'Test1', N'Test1')
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[AdministratorPost] ON 

INSERT [dbo].[AdministratorPost] ([AdministratorId], [PostId], [AdministratorPostId]) VALUES (3, 68, 47)
INSERT [dbo].[AdministratorPost] ([AdministratorId], [PostId], [AdministratorPostId]) VALUES (3, 69, 48)
INSERT [dbo].[AdministratorPost] ([AdministratorId], [PostId], [AdministratorPostId]) VALUES (4, 70, 49)
INSERT [dbo].[AdministratorPost] ([AdministratorId], [PostId], [AdministratorPostId]) VALUES (4, 71, 50)
INSERT [dbo].[AdministratorPost] ([AdministratorId], [PostId], [AdministratorPostId]) VALUES (5, 72, 51)
SET IDENTITY_INSERT [dbo].[AdministratorPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [Title], [PostDate], [Content]) VALUES (68, N'About Softray Solution', CAST(N'2021-02-08T00:21:55.527' AS DateTime), N'Softray Solutions was started in Atlanta, GA with the vision to build an agile software development company that puts integrity and craftsmanship at the heart of everything we do. With the partnership mentality, we make software development simpler, smarter, transparent and more efficient.')
INSERT [dbo].[Post] ([PostId], [Title], [PostDate], [Content]) VALUES (69, N'With a high bar for excellence', CAST(N'2021-02-08T00:24:07.647' AS DateTime), N'We are building an organization of craftsmen and women who are creative, thrive on solving complex problems and are passionate about their work. If you are looking for a long-term relationship with a reliable team of experts, Softray Solutions is your answer.')
INSERT [dbo].[Post] ([PostId], [Title], [PostDate], [Content]) VALUES (70, N'Moral and Transparency', CAST(N'2021-02-08T00:25:46.330' AS DateTime), N'Being your trusted partner is at the core of our mission and we firmly stand behind our work and promise. We maintain situational awareness of your business goals throughout the project, communicate openly and often, and work tirelessly to earn and keep your trust.')
INSERT [dbo].[Post] ([PostId], [Title], [PostDate], [Content]) VALUES (71, N'Expertise and Excellence', CAST(N'2021-02-08T00:26:28.330' AS DateTime), N'In today''s landscape, being a software architect or developer requires continuous learning. We are a highly trained and educated team with advanced knowledge and expertise utilizing the latest technologies and architectural patterns. We will provide you with a team ready, willing and able to help you with your toughest software challenges.

')
INSERT [dbo].[Post] ([PostId], [Title], [PostDate], [Content]) VALUES (72, N'Process and Methodology', CAST(N'2021-02-08T00:28:57.383' AS DateTime), N'In today''s landscape, being a software architect or developer requires continuous learning. We are a highly trained and educated team with advanced knowledge and expertise utilizing the latest technologies and architectural patterns. We will provide you with a team ready, willing and able to help you with your toughest software challenges.

')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Rola] ON 

INSERT [dbo].[Rola] ([RolaId], [RolaName]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[Rola] OFF
GO
SET IDENTITY_INSERT [dbo].[UserN] ON 

INSERT [dbo].[UserN] ([UserNId], [Email], [UserName], [LozinkaHash], [LozinkaSalt], [RolaId], [AdministratorId]) VALUES (3, N'anita@gmail.com', N'anita', N'TUq7E9ERQnJmVO84QGHIjquuD3Q=', N'K0X5TGeaLWARI8W3t1GHqw==', 1, 3)
INSERT [dbo].[UserN] ([UserNId], [Email], [UserName], [LozinkaHash], [LozinkaSalt], [RolaId], [AdministratorId]) VALUES (4, N'test@gmail.com', N'test', N'/vfSdwM2LxH04SQEYVZeJXYh+Yg=', N'm+VmQvWGPz2BkKfJP9IcIA==', 1, 4)
INSERT [dbo].[UserN] ([UserNId], [Email], [UserName], [LozinkaHash], [LozinkaSalt], [RolaId], [AdministratorId]) VALUES (5, N'test1@gmail.com', N'test1', N'2xw8mrfpBoQd88s/1hHmN9NpJxc=', N'hCzkH6MyVyAYIxdBBKHsEw==', 1, 5)
SET IDENTITY_INSERT [dbo].[UserN] OFF
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[AdministratorPost]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD FOREIGN KEY([RolaId])
REFERENCES [dbo].[Rola] ([RolaId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD FOREIGN KEY([RolaId])
REFERENCES [dbo].[Rola] ([RolaId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD FOREIGN KEY([RolaId])
REFERENCES [dbo].[Rola] ([RolaId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD FOREIGN KEY([RolaId])
REFERENCES [dbo].[Rola] ([RolaId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD FOREIGN KEY([RolaId])
REFERENCES [dbo].[Rola] ([RolaId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD FOREIGN KEY([RolaId])
REFERENCES [dbo].[Rola] ([RolaId])
GO
ALTER TABLE [dbo].[UserN]  WITH CHECK ADD  CONSTRAINT [FK_UserN_Administrator] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[Administrator] ([AdministratorId])
GO
ALTER TABLE [dbo].[UserN] CHECK CONSTRAINT [FK_UserN_Administrator]
GO
USE [master]
GO
ALTER DATABASE [Portal] SET  READ_WRITE 
GO
