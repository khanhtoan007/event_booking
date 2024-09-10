USE [EventBooking]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/10/2024 12:36:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](50) NULL,
    [phone] [numeric](18, 0) NULL,
    [address] [nvarchar](255) NULL,
    [buisiness_name] [nvarchar](50) NULL,
    [role] [int] NULL,
    [username] [nchar](20) NOT NULL,
    [password] [nchar](30) NOT NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[bills]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[bills](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [amount] [int] NULL,
    [transfer_content] [nvarchar](1000) NULL,
    [status] [bit] NULL,
    [paid_at] [datetime] NULL,
    [created_at] [datetime] NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[carts]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[carts](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [user_id] [int] NULL,
    [event_id] [int] NULL,
    [quantity] [int] NULL,
    [price] [int] NULL,
    [bill_id] [int] NULL,
    [note] [nvarchar](1000) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[categories]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[categories](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Category](
    [category_id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NULL,
    PRIMARY KEY CLUSTERED
(
[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Event]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Event](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](50) NULL,
    [content] [nvarchar](255) NULL,
    [image] [nvarchar](255) NULL,
    [category] [nvarchar](50) NULL,
    [post_date] [date] NULL,
    [state] [int] NULL,
    [author] [nvarchar](50) NULL,
    [location] [nvarchar](50) NULL
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[events]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[events](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](1000) NULL,
    [description] [nvarchar](max) NULL,
    [start_date] [datetime] NULL,
    [end_date] [datetime] NULL,
    [location] [nvarchar](255) NULL,
    [is_verified] [bit] NULL,
    [user_id] [int] NULL,
    [category_id] [int] NULL,
    [tickets] [int] NULL,
    [price] [int] NULL,
    [image] [nvarchar](1000) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[roles]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[roles](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[users]    Script Date: 9/10/2024 12:36:27 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[users](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NULL,
    [email] [nvarchar](255) NULL,
    [phone] [nvarchar](255) NULL,
    [password] [nvarchar](255) NULL,
    [avatar] [nvarchar](255) NULL,
    [gender] [bit] NULL,
    [token] [nvarchar](255) NULL,
    [is_verified] [bit] NULL,
    [role_id] [int] NULL,
    PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([bill_id])
    REFERENCES [dbo].[bills] ([id])
    GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([event_id])
    REFERENCES [dbo].[events] ([id])
    GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([user_id])
    REFERENCES [dbo].[users] ([id])
    GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([category_id])
    REFERENCES [dbo].[categories] ([id])
    GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([user_id])
    REFERENCES [dbo].[users] ([id])
    GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([role_id])
    REFERENCES [dbo].[roles] ([id])
    GO
