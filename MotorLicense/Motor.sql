USE [MotorLicense_V1]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 3/25/2024 2:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[isCorrect] [bit] NOT NULL,
	[questionId] [int] NOT NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attempt_detail]    Script Date: 3/25/2024 2:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attempt_detail](
	[attemptDetailId] [int] IDENTITY(1,1) NOT NULL,
	[attemptId] [int] NOT NULL,
	[quizId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[answerId] [int] NULL,
 CONSTRAINT [PK_attempt_detail] PRIMARY KEY CLUSTERED 
(
	[attemptDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 3/25/2024 2:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[questionName] [nvarchar](max) NOT NULL,
	[type] [bit] NOT NULL,
	[explain] [nvarchar](max) NOT NULL,
	[quizId] [int] NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 3/25/2024 2:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[quizName] [nvarchar](50) NOT NULL,
	[duration] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/25/2024 2:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_attempt]    Script Date: 3/25/2024 2:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_attempt](
	[attemptId] [int] IDENTITY(1,1) NOT NULL,
	[quizId] [int] NOT NULL,
	[total] [int] NOT NULL,
	[finish] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[note] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_attempt] PRIMARY KEY CLUSTERED 
(
	[attemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[answer] ON 

INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (1, N'Phần mặt đường và lề đường.', 0, 1)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (2, N'Phần đường xe chạy.', 1, 1)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (3, N'Phần đường xe cơ giới.', 0, 1)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (4, N'Phương tiện giao thông cơ giới đường bộ.', 0, 3)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (5, N'Phương tiện giao thông thô sơ đường bộ và xe máy chuyên dùng.', 0, 3)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (6, N'Cả ý 1 và ý 2.', 1, 3)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (7, N'Chỉ bị nhắc nhở.', 0, 4)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (8, N'Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.', 1, 4)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (9, N'Không bị xử lý hình sự.', 0, 4)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (10, N'Không được vượt.', 1, 5)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (11, N'Được vượt khi đang đi trên cầu.', 0, 5)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (12, N'Được phép vượt khi đi qua nơi giao nhau có ít phương tiện cùng tham gia giao thông.', 0, 5)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (13, N'Được vượt khi đảm bảo an toàn.', 0, 5)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (14, N'Chỉ được kéo nếu đã nhìn thấy trạm xăng.', 0, 6)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (15, N'Chỉ được thực hiện trên đường vắng phương tiện cùng tham gia giao thông.', 0, 6)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (16, N'Không được phép.', 1, 6)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (17, N'Phải báo hiệu bằng đèn hoặc còi;', 0, 7)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (18, N'Chỉ được báo hiệu bằng còi.', 0, 7)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (19, N'Phải báo hiệu bằng cả còi và đèn.', 0, 7)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (20, N'Chỉ được báo hiệu bằng đèn.', 1, 7)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (21, N'Xe cơ giới, xe máy chuyên dùng phải bật đèn; xe thô sơ phải bật đèn hoặc có vật phát sáng báo hiệu; chỉ được dừng xe, đỗ xe ở nơi quy định.', 1, 8)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (22, N'Xe cơ giới phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.', 0, 8)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (23, N'Xe máy chuyên dùng phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.', 0, 8)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (24, N'Xe bị vượt bất ngờ tăng tốc độ và cố tình không nhường đường.', 0, 9)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (25, N'Xe bị vượt giảm tốc độ và nhường đường.', 0, 9)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (26, N'Phát hiện có xe đi ngược chiều.', 0, 9)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (27, N'Cả ý 1 và ý 3.', 1, 9)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (28, N'Chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình.', 0, 11)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (29, N'Đảm bảo khoảng cách an toàn theo mật độ phương tiện, tình hình giao thông thực tế.', 0, 11)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (30, N'Cả ý 1 và ý 2.', 1, 11)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (31, N'Ra tín hiệu bằng tay rồi cho xe vượt qua.', 0, 12)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (32, N'Tăng ga mạnh để gây sự chú ý rồi cho xe vượt qua.', 0, 12)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (33, N'Bạn phải có tín hiệu bằng đèn hoặc còi.', 1, 12)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (34, N'Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ.', 1, 13)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (35, N'Nhả hết tay ga, tắt động cơ, sử dụng phanh trước và phanh sau để giảm tốc độ.', 0, 13)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (36, N'Sử dụng phanh trước để giảm tốc độ kết hợp với tắt chìa khóa điện của xe.', 0, 13)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (37, N'Để điều khiển xe chạy về phía trước.', 0, 14)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (38, N'Để điều tiết công suất động cơ qua đó điều khiển tốc độ của xe.', 0, 14)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (39, N'Để điều khiển xe chạy lùi.', 0, 14)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (40, N'Cả ý 1 và ý 2.', 1, 14)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (41, N'Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, sử dụng cho xe chạy.', 0, 15)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (42, N'Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, có bề rộng đủ cho xe chạy an toàn.', 1, 15)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (43, N'Là đường cho xe ô tô chạy, dừng, đỗ an toàn.', 0, 15)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (44, N'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.', 0, 16)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (45, N'Người điều khiển, dẫn dắt súc vật; người đi bộ trên đường bộ.', 0, 16)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (46, N'Cả ý 1 và ý 2.', 1, 16)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (47, N'Người điều khiển: Xe ô tô, xe mô tô, xe đạp, xe gắn máy.', 1, 17)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (48, N'Người ngồi phía sau người điều khiển xe cơ giới.', 0, 17)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (49, N'Người đi bộ.', 0, 17)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (50, N'Cả ý 1 và ý 2.', 0, 17)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (51, N'Được phép.', 0, 18)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (52, N'Nếu phương tiện được kéo, đẩy có khối lượng nhỏ hơn phương tiện của mình.', 0, 18)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (53, N'Tuỳ trường hợp.', 0, 18)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (54, N'Không được phép.', 0, 18)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (56, N'Không được vận chuyển.', 1, 20)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (57, N'Chỉ được vận chuyển khi đã chằng buộc cẩn thận.', 0, 20)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (58, N'Chỉ được vận chuyển vật cồng kềnh trên xe máy nếu khoảng cách về nhà ngắn hơn 2 km.', 0, 20)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (59, N'Tăng tốc độ và ra hiệu cho xe sau vượt, không được gây trở ngại cho xe sau vượt.', 0, 21)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (60, N'Người điều khiển phương tiện phía trước phải giảm tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua, không được gây trở ngại cho xe sau vượt.', 1, 21)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (61, N'Cho xe tránh về bên trái mình và ra hiệu cho xe sau vượt; nếu có chướng ngại vật phía trước hoặc thiếu điều kiện an toàn chưa cho vượt được phải ra hiệu cho xe sau biết; cấm gây trở ngại cho xe xin vượt.', 0, 21)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (62, N'Khi tham gia giao thông đường bộ.', 1, 22)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (63, N'Chỉ khi đi trên đường chuyên dùng; đường cao tốc.', 0, 22)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (64, N'Khi tham gia giao thông trên đường tỉnh lộ hoặc quốc lộ.', 0, 22)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (65, N'Nếu đủ điều kiện an toàn, người lái xe phải giảm tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua, không được gây trở ngại đối với xe xin vượt.', 1, 23)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (66, N'Lái xe vào lề đường bên trái và giảm tốc độ để xe phía sau vượt qua, không được gây trở ngại đối với xe xin vượt.', 0, 23)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (67, N'Nếu đủ điều kiện an toàn, người lái xe phải tăng tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua.', 0, 23)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (68, N'Gặp biển báo nguy hiểm trên đường.', 1, 24)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (69, N'Gặp biển chỉ dẫn trên đường.', 0, 24)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (70, N'Gặp biển báo hết mọi lệnh cấm.', 0, 24)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (71, N'Gặp biển báo hết hạn chế tốc độ tối đa cho phép.', 0, 24)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (72, N'Đường ướt, đường có sỏi cát trên nền đường.', 0, 25)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (73, N'Đường hẹp có nhiều điểm giao cắt từ hai phía.', 0, 25)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (74, N'Đường đèo dốc, vòng liên tục.', 0, 25)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (75, N'Tất cả các ý nêu trên.', 1, 25)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (76, N'Quan sát biển báo hiệu để biết nơi được phép quay đầu; quan sát kỹ địa hình nơi chọn để quay đầu; lựa chọn quỹ đạo quay đầu xe cho thích hợp; quay đầu xe với tốc độ thấp; thường xuyên báo tín hiệu để người, các phương tiện xung quanh được biết; nếu quay đầu xe ở nơi nguy hiểm thì đưa đầu xe về phía nguy hiểm đưa đuôi xe về phía an toàn.', 1, 26)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (77, N'Quan sát biển báo hiệu để biết nơi được phép quay đầu; quan sát kỹ địa hình nơi chọn để quay đầu; lựa chọn quỹ đạo quay đầu xe; quay đầu xe với tốc độ tối đa; thường xuyên báo tín hiệu để người, các phương tiện xung quanh được biết; nếu quay đầu xe ở nơi nguy hiểm thì đưa đuôi xe về phía nguy hiểm và đầu xe về phía an toàn.', 0, 26)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (78, N'Để quan sát an toàn phía bên trái khi chuẩn bị rẽ trái.', 0, 27)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (79, N'Để quan sát an toàn phía bên phải khi chuẩn bị rẽ phải.', 0, 27)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (80, N'Để quan sát an toàn phía sau cả bên trái và bên phải trước khi chuyển hướng.', 1, 27)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (81, N'Để quan sát an toàn phía trước cả bên trái và bên phải trước khi chuyển hướng.', 0, 27)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (82, N'Là bộ phận của đường để ngăn cách không cho các loại xe vào những nơi không được phép.', 0, 28)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (83, N'Là bộ phận của đường để phân tách phần đường xe chạy và hành lang an toàn giao thông.', 0, 28)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (84, N'Là bộ phận của đường để phân chia mặt đường thành hai chiều xe chạy riêng biệt hoặc để phân chia phần đường của xe cơ giới và xe thô sơ.', 1, 28)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (85, N'Người điều khiển xe cơ giới, người điều khiển xe thô sơ.', 0, 29)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (86, N'Người điều khiển xe máy chuyên dùng tham gia giao thông đường bộ.', 0, 29)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (87, N'Cả ý 1 và ý 2.', 1, 29)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (88, N'Bị nghiêm cấm tuỳ từng trường hợp.', 0, 30)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (89, N'Không bị nghiêm cấm.', 0, 30)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (90, N'Bị nghiêm cấm.', 1, 30)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (91, N'Được phép.', 0, 31)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (92, N'Tuỳ trường hợp.', 0, 31)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (93, N'Không được phép.', 1, 31)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (94, N'16 tuổi.', 0, 32)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (95, N'18 tuổi.', 1, 32)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (96, N'17 tuổi.', 0, 32)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (97, N'02 năm.', 0, 33)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (98, N'03 năm.', 0, 33)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (99, N'05 năm', 1, 33)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (100, N'04 năm.', 0, 33)
GO
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (101, N'Quan sát gương, ra tín hiệu, quan sát an toàn và chuyển hướng', 0, 34)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (102, N'Quan sát gương, giảm tốc độ, ra tín hiệu chuyển hướng, quan sát an toàn và chuyển hướng.', 1, 34)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (105, N'Chở người bệnh đi cấp cứu; trẻ em dưới 14 tuổi.', 0, 35)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (106, N'Áp giải người có hành vi vi phạm pháp luật.', 0, 35)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (107, N'Cả ý 1 và ý 2.', 1, 35)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (108, N'Phải đội mũ bảo hiểm đạt chuẩn, có cài quai đúng quy cách, mặc quần áo gọn gàng; không sử dụng ô, điện thoại di động, thiết bị âm thanh (trừ thiết bị trợ thính).', 1, 36)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (109, N'Phải đội mũ bảo hiểm khi trời mưa gió hoặc trời quá nắng; có thể sử dụng ô, điện thoại di động, thiết bị âm thanh nhưng phải đảm bảo an toàn.', 0, 36)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (110, N'Phải đội mũ bảo hiểm khi cảm thấy mất an toàn giao thông hoặc khi chuẩn bị di chuyển quãng đường xa.', 0, 36)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (111, N'Hiệu lệnh của nhân viên gác chắn.', 0, 37)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (112, N'Đèn đỏ sáng nháy, cờ đỏ, biển đỏ.', 0, 37)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (113, N'Còi, chuông kêu, chắn đã đóng', 0, 37)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (114, N'Tất cả các ý trên.', 1, 37)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (115, N'Tăng tốc độ để nhanh chóng vượt qua bến đỗ.', 0, 38)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (116, N'Giảm tốc độ đến mức an toàn có thể và quan sát người qua đường và từ từ vượt qua xe buýt.', 1, 38)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (117, N'Yêu cầu phải dừng lại phía sau xe buýt chờ xe rời bến mới đi tiếp.', 0, 38)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (118, N'Không nên đi cố vào đường hẹp; xe đi ở sườn núi nên dừng lại trước để nhường đường; khi dừng xe nhường đường phải đỗ ngay ngắn.', 0, 39)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (119, N'Trong khi tránh nhau không nên đổi số; khi tránh nhau ban đêm, phải tắt đèn pha bật đèn cốt.', 0, 39)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (121, N'Khi tránh nhau ban đêm, phải thường xuyên bật đèn pha tắt đèn cốt.', 0, 39)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (122, N'Cả ý 1 và ý 2.', 1, 39)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (123, N'Tăng ga thật nhanh, giảm ga từ từ.', 0, 40)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (124, N'Tăng ga thật nhanh, giảm ga thật nhanh.', 0, 40)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (125, N'Tăng ga từ từ, giảm ga thật nhanh.', 1, 40)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (126, N'Tăng ga từ từ, giảm ga từ từ.', 0, 40)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (127, N'Dải phân cách gồm loại cố định và loại di động.', 1, 41)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (128, N'Dải phân cách gồm tường chống ồn, hộ lan cứng và hộ lan mềm.', 0, 41)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (129, N'Dải phân cách gồm giá long môn và biển báo hiệu đường bộ.', 0, 41)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (130, N'Là người điều khiển phương tiện tham gia giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt.', 0, 42)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (131, N'Là cảnh sát giao thông, người được giao nhiệm vụ hướng dẫn giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt.', 1, 42)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (132, N'Là người tham gia giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt.', 0, 42)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (133, N'Từ 22 giờ đêm đến 5 giờ sáng.', 0, 43)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (134, N'Từ 5 giờ sáng đến 22 giờ tối.', 1, 43)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (135, N'Từ 23 giờ đêm đến 5 giờ sáng hôm sau.', 0, 43)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (200, N'Sử dụng phanh trước.', 0, 64)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (201, N'Sử dụng phanh sau.', 0, 64)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (202, N'Giảm hết ga; sử dụng đồng thời cả phanh sau và phanh trước.', 1, 64)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (206, N'Là trạng thái đứng yên của phương tiện giao thông không giới hạn thời gian để cho người lên, xuống phương tiện, xếp dỡ hàng hóa hoặc thực hiện công việc khác.', 0, 66)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (207, N'Là trạng thái đứng yên tạm thời của phương tiện giao thông trong một khoảng thời gian cần thiết đủ để cho người lên, xuống phương tiện, xếp dỡ hàng hóa hoặc thực hiện công việc khác.', 1, 66)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (208, N'Là trạng thái đứng yên của phương tiện giao thông không giới hạn thời gian giữa 02 lần vận chuyển hàng hoá hoặc hành khách.', 0, 66)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (209, N'Bất cứ đèn nào miễn là mắt nhìn rõ phía trước.', 0, 67)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (210, N'Chỉ bật đèn chiếu xa (đèn pha) khi không nhìn rõ đường.', 0, 67)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (211, N'Đèn chiếu xa (đèn pha) khi đường vắng, đèn pha chiếu gần (đèn cốt) khi có xe đi ngược chiều.', 0, 67)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (212, N'Đèn chiếu gần (đèn cốt).', 1, 67)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (213, N'Được mang, vác tuỳ trường hợp cụ thể.', 0, 68)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (214, N'Không được mang, vác.', 1, 68)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (215, N'Được mang, vác nhưng phải đảm bảo an toàn.', 0, 68)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (216, N'Được mang, vác tùy theo sức khỏe của bản thân.', 0, 68)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (217, N'Xe mô tô có dung tích xi-lanh 125 cm3.', 0, 69)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (218, N'Xe mô tô có dung tích xi-lanh từ 175 cm3 trở lên.', 1, 69)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (219, N'Xe mô tô có dung tích xi-lanh 100 cm3.', 0, 69)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (220, N'Tiếp tục đi vì xe lên dốc phải nhường đường cho mình.', 0, 70)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (221, N'Nhường đường cho xe lên dốc.', 1, 70)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (222, N'Chỉ nhường đường khi xe lên dốc nháy đèn.', 0, 70)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (223, N'Được phép nhưng phải đảm bảo an toàn.', 0, 71)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (224, N'Không được phép.', 1, 71)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (226, N'Được phép tùy từng hoàn cảnh, điều kiện cụ thể.', 0, 71)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (227, N'50 km/h.', 0, 72)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (228, N'40 km/h.', 1, 72)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (229, N'60 km/h.', 0, 72)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (230, N'Tăng tốc độ qua đường giao nhau để đi trước xe đi trên đường ưu tiên', 0, 73)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (231, N'Giảm tốc độ qua đường giao nhau để đi trước xe đi trên đường ưu tiên.', 0, 73)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (232, N'Nhường đường cho xe đi trên đường ưu tiên từ bất kỳ hướng nào tới.', 1, 73)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (338, N'qqqq', 0, 34)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (339, N'2', 1, 105)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (340, N'3', 0, 105)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (341, N'4', 1, 106)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (342, N'5', 0, 106)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (343, N'6', 1, 107)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (344, N'7', 0, 107)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (345, N'8', 1, 108)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (346, N'9', 0, 108)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (347, N'10', 1, 109)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (348, N'11', 0, 109)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (349, N'123321', 0, 65)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (350, N'123321', 1, 65)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (351, N'123321', 0, 65)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (360, N'sssssssssss', 0, 114)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (361, N'ssssssssssssss', 1, 114)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (362, N'123', 0, 115)
INSERT [dbo].[answer] ([answerId], [detail], [isCorrect], [questionId]) VALUES (363, N'321', 1, 115)
SET IDENTITY_INSERT [dbo].[answer] OFF
GO
SET IDENTITY_INSERT [dbo].[attempt_detail] ON 

INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (1, 1, 1, 1, 3)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (2, 1, 1, 3, 6)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (3, 1, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (4, 1, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (5, 1, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (6, 1, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (7, 1, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (8, 1, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (9, 1, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (10, 1, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (11, 2, 2, 13, 36)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (12, 2, 2, 14, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (13, 2, 2, 15, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (14, 2, 2, 16, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (15, 2, 2, 17, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (16, 2, 2, 18, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (17, 2, 2, 20, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (18, 2, 2, 21, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (19, 2, 2, 22, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (20, 2, 2, 23, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (21, 3, 1, 1, 3)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (22, 3, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (23, 3, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (24, 3, 1, 5, 11)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (25, 3, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (26, 3, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (27, 3, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (28, 3, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (29, 3, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (30, 3, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (31, 4, 1, 1, 2)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (32, 4, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (33, 4, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (34, 4, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (35, 4, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (36, 4, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (37, 4, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (38, 4, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (39, 4, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (40, 4, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (41, 5, 3, 24, 71)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (42, 5, 3, 25, 73)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (43, 5, 3, 26, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (44, 5, 3, 27, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (45, 5, 3, 28, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (46, 5, 3, 29, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (47, 5, 3, 30, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (48, 5, 3, 31, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (49, 5, 3, 32, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (50, 5, 3, 33, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (51, 6, 2, 13, 34)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (52, 6, 2, 14, 40)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (53, 6, 2, 15, 41)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (54, 6, 2, 16, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (55, 6, 2, 17, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (56, 6, 2, 18, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (57, 6, 2, 20, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (58, 6, 2, 21, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (59, 6, 2, 22, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (60, 6, 2, 23, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (61, 8, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (62, 9, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (63, 10, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (64, 11, 12, 105, 340)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (65, 12, 12, 105, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (66, 13, 12, 105, 340)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (67, 13, 12, 106, 341)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (68, 13, 12, 107, 343)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (69, 13, 12, 108, 345)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (70, 13, 12, 109, 347)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (71, 15, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (72, 15, 12, 106, 341)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (73, 15, 12, 107, 344)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (74, 15, 12, 108, 346)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (75, 15, 12, 109, 348)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (76, 17, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (77, 17, 12, 106, 341)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (78, 17, 12, 107, 343)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (79, 17, 12, 108, 345)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (80, 17, 12, 109, 347)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (81, 18, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (82, 18, 12, 106, 341)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (83, 18, 12, 107, 343)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (84, 18, 12, 108, 345)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (85, 18, 12, 109, 347)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (86, 19, 12, 105, 339)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (87, 19, 12, 106, 341)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (88, 19, 12, 107, 344)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (89, 19, 12, 108, 346)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (90, 19, 12, 109, 348)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (91, 20, 12, 105, 340)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (92, 20, 12, 106, 341)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (93, 20, 12, 107, 343)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (94, 20, 12, 108, 345)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (95, 20, 12, 109, 347)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (96, 21, 12, 105, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (97, 21, 12, 106, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (98, 21, 12, 107, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (99, 21, 12, 108, NULL)
GO
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (100, 21, 12, 109, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (101, 25, 1, 1, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (102, 25, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (103, 25, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (104, 25, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (105, 25, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (106, 25, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (107, 25, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (108, 25, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (109, 25, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (110, 25, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (111, 26, 14, 115, 363)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (112, 27, 14, 115, 362)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (113, 28, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (114, 28, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (115, 28, 1, 1, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (116, 28, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (117, 28, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (118, 28, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (119, 28, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (120, 28, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (121, 28, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (122, 28, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (123, 29, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (124, 29, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (125, 29, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (126, 29, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (127, 29, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (128, 29, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (129, 29, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (130, 29, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (131, 29, 1, 1, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (132, 29, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (133, 30, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (134, 30, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (135, 30, 1, 1, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (136, 30, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (137, 30, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (138, 30, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (139, 30, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (140, 30, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (141, 30, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (142, 30, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (143, 31, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (144, 31, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (145, 31, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (146, 31, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (147, 31, 1, 5, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (148, 31, 1, 6, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (149, 31, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (150, 31, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (151, 31, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (152, 31, 1, 1, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (153, 32, 1, 12, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (154, 32, 1, 6, 16)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (155, 32, 1, 1, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (156, 32, 1, 11, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (157, 32, 1, 8, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (158, 32, 1, 4, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (159, 32, 1, 9, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (160, 32, 1, 3, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (161, 32, 1, 7, NULL)
INSERT [dbo].[attempt_detail] ([attemptDetailId], [attemptId], [quizId], [questionId], [answerId]) VALUES (162, 32, 1, 5, NULL)
SET IDENTITY_INSERT [dbo].[attempt_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (1, N'Phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại là gì?
', 0, N'Phần đường xe chạy là phần của đường bộ được sử dụng cho phương tiện giao thông qua lại.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (3, N'“Phương tiện tham gia giao thông đường bộ” gồm những loại nào?
', 0, N'Tại Khoản 17 Điều 3 Luật giao thông đường bộ 2008 có quy định về vấn đề này như sau: ''Phương tiện tham gia giao thông đường bộ gồm phương tiện giao thông đường bộ và xe máy chuyên dùng''.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (4, N'* Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào?
', 1, N'Sử dụng rượu bia khi lái xe sẽ bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (5, N'Bạn đang lái xe phía trước có một xe cứu thương đang phát tín hiệu ưu tiên bạn có được phép vượt hay không?
', 0, N'Xe cứu thương thuộc diện phương tiện xe ưu tiên, có phát tín hiệu ưu tiên. Bắt buộc các phương tiện khác phải nhường đường và không được vượt. Ngoại trừ các xe theo luật định như: Cứu hỏa, Quân Sự, Công An.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (6, N'* Hành vi sử dụng xe mô tô để kéo, đẩy xe mô tô khác bị hết xăng đến trạm mua xăng có được phép hay không?
', 1, N'Hành vi bám, kéo hoặc đẩy các phương tiện khác; sử dụng mô tô để kéo, đẩy mô tô khác bị hết xăng đến trạm mua xăng cũng không được phép, sẽ gây nguy hiểm cho các phương tiện khác tham gia giao thông là BỊ NGHIÊM CẤM theo luật định.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (7, N'Bạn đang lái xe trong khu vực đô thị từ 22 giờ đến 5 giờ sáng hôm sau và cần vượt một xe khác, bạn cần báo hiệu như thế nào để đảm bảo an toàn giao thông?
', 0, N'Điều 14 Luật Giao thông đường bộ 2008; - Nghị định 46 năm 2016 quy định. Vượt xe trong khu vực đô thị từ 22 giờ đến 5 giờ sáng chỉ được báo hiệu bằng đèn.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (8, N'Người điều khiển phương tiện tham gia giao thông trong hầm đường bộ ngoài việc phải tuân thủ các quy tắc giao thông còn phải thực hiện những quy định nào dưới đây?
', 0, N'Trong hầm đường bộ, nghiêm cấm việc quay đầu và lùi xe.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (9, N'Trên đoạn đường hai chiều không có giải phân cách giữa, người lái xe không được vượt xe khác trong các trường hợp nào dưới đây?
', 0, N'Khi muốn vượt một xe khác, chúng ta phải đảm bảo các yếu tố về an toàn. Trường hợp phát hiện có xe đi ngược chiều và xe đi trước (xe bị vượt) bất ngờ tăng tốc độ chúng ta sẽ không được vượt.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (11, N'Khi điều khiển xe chạy với tốc độ dưới 60 km/h, để đảm bảo khoảng cách an toàn giữa hai xe, người lái xe phải điều khiển xe như thế nào?
', 0, N'Khi điều khiển xe chạy với tốc độ dưới 60 km/h, người lái xe phải chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình; khoảng cách này tùy thuộc vào mật độ phương tiện, tình hình giao thông thực tế để đảm bảo an toàn giao thông.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (12, N'Để báo hiệu cho xe phía trước biết xe mô tô của bạn muốn vượt, bạn phải có tín hiệu như thế nào dưới đây?
', 0, N'Khi muốn vượt xe phía trước bắt buộc phải có tín hiệu bằng đèn hoặc còi, trường hợp trong khu đông dân cư trong khung giờ từ 22h - 5h bắt buộc phải sử dụng bằng đèn.

', 1)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (13, N'* Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao, người lái xe cần thực hiện các thao tác nào dưới đây để đảm bảo an toàn?
', 1, N'Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao để đảm bảo an toàn người lái xe sẽ cần giữ tay ga ở mức độ phù hợp kết hợp giữa thắng trước và thắng sau để giảm tốc độ khi cần thiết. Tránh việc chỉ sử dụng thắng trước vì rất dễ gây tai nạn.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (14, N'Tay ga trên xe mô tô hai bánh có tác dụng gì trong các trường hợp dưới đây?
', 0, N'Tay ga trên xe mô tô sẽ có tác dụng điều chỉnh tốc độ xe, cho phép xe tiến về phía trước. Không có tác dụng lùi xe.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (15, N'“Làn đường” là gì?
', 0, N'Quy chuẩn kỹ thuật quốc gia QCVN 41:2016/BGTVT về báo hiệu đường bộ: ''Làn đường là một phần của phần đường xe chạy được chia theo chiều dọc của đường, có đủ bề rộng cho xe chạy an toàn. Một phần đường xe chạy có thể có một hoặc nhiều làn đường.''

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (16, N'“Người tham gia giao thông đường bộ” gồm những đối tượng nào?
', 0, N'Người tham gia giao thông gồm: người điều khiển, người sử dụng phương tiện, dẫn dắt súc vật; người đi bộ trên đường bộ.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (17, N'* Theo Luật phòng chống tác hại của rượu, bia, đối tượng nào dưới đây bị cấm sử dụng rượu bia khi tham gia giao thông?
', 1, N'Người ngồi sau, người đi bộ vẫn có thể sử dụng rượu bia. Trường hợp người điểu khiển phương tiện tham gia giao thông sẽ bị cấm sử dụng. Đây là câu hỏi rất dễ nhầm lẫn, nếu các bạn không đọc kỹ rất dễ bị sai.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (18, N'* Người điều khiển xe mô tô hai bánh, ba bánh, xe gắn máy có được phép sử dụng xe để kéo hoặc đẩy các phương tiện khác khi tham gia giao thông không?
', 1, N'Khoản 3, Điều 30 - Luật Giao thông đường bộ năm 2008 quy định người điều khiển xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy không được thực hiện các hành vi sau: Sử dụng xe để kéo, đẩy xe khác, vật khác, mang, vác và chở vật cồng kềnh;

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (20, N'* Hành vi vận chuyển đồ vật cồng kềnh bằng xe mô tô, xe gắn máy khi tham gia giao thông có được phép hay không?
', 1, N'Khoản 3, Điều 30 - Luật Giao thông đường bộ năm 2008 quy định người điều khiển xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy không được thực hiện các hành vi sau: Sử dụng xe để kéo, đẩy xe khác, vật khác, mang, vác và chở vật cồng kềnh;

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (21, N'Khi điều khiển xe chạy trên đường biết có xe sau xin vượt nếu đủ điều kiện an toàn người lái xe phải làm gì?
', 0, N'Xử lý cho xe sau vượt: giảm tốc độ và đi về bên phải.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (22, N'* Người ngồi trên xe mô tô 2 bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?
', 1, N'Khi tham gia giao thông đường bộ bắt buộc phải đội mũ bảo hiểm.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (23, N'Người lái xe mô tô xử lý như thế nào khi cho xe mô tô phía sau vượt?
', 0, N'Xử lý cho xe sau vượt: giảm tốc độ và đi về bên phải.

', 2)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (24, N'Người lái xe phải giảm tốc độ thấp hơn tốc độ tối đa cho phép đến mức cần thiết, chú ý quan sát và chuẩn bị sẵn sàng những tình huống có thế xảy ra để phòng ngừa tai nạn trong các trường hợp nào dưới đây?
', 0, N'Giảm tốc độ, chú ý quan sát khi thấy biển báo nguy hiểm.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (25, N'Người điều khiển xe mô tô phải giảm tốc độ và hết sức thận trọng khi qua những đoạn đường nào dưới đây?
', 0, N'Giảm tốc độ: Đường ướt, đường hẹp, đường đèo dốc.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (26, N'Khi quay đầu xe, người lái xe cần phải quan sát và thực hiện các thao tác nào để đảm bảo an toàn giao thông?
', 0, N'Quay đầu xe với tốc độ thấp mới đảm bảo được an toàn và có thời gian xử lý các tình huống bất ngờ.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (27, N'Gương chiếu hậu của xe mô tô hai bánh, có tác dụng gì trong các trường hợp dưới đây?
', 0, N'Gương chiếu hậu của xe mô tô có chức năng giúp người điều khiển phương tiện có thể quan sát an toàn phía sau bên phải - trái, trước khi chuyển làn đường.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (28, N'Trong các khái niệm dưới đây, “dải phân cách” được hiểu như thế nào là đúng?
', 0, N'Dải phân cách là bộ phận của đường để phân chia mặt đường thành hai chiều xe chạy riêng biệt hoặc để phân chia phần đường của xe cơ giới và xe thô sơ.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (29, N'“Người điều khiển phương tiện tham gia giao thông đường bộ” gồm những đối tượng nào dưới đây?
', 0, N'Người điều khiển phương tiện giao thông bao gồm xe: cơ giới, thô sơ, xe máy chuyên dùng.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (30, N'* Hành vi điều khiển xe cơ giới chạy quá tốc độ quy định, giành đường, vượt ẩu có bị nghiêm cấm hay không?
', 1, N'Điều khiển xe cơ giới chạy quá tốc độ quy định, giành đường, vượt ẩu là hành vi bị nghiêm cấm dựa theo Khoản 11 Điều 8 Luật Giao thông đường bộ 2008.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (31, N'* Khi điều khiển xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy, những hành vi buông cả hai tay; sử dụng xe để kéo, đẩy xe khác, vật khác; sử dụng chân chống của xe quệt xuống đường khi xe đang chạy có được phép hay không?
', 1, N'Tất cả hành vi buông cả hai tay; sử dụng xe để kéo, đẩy xe khác, vật khác; sử dụng chân chống của xe quệt xuống đường khi xe đang chạy là hành động gây mất an toàn giao thông nghiêm trọng.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (32, N'Người đủ bao nhiêu tuổi trở lên thì được điều khiển xe mô tô hai bánh, xe mô tô ba bánh có dung tích xi lanh từ 50 cm3 trở lên và các loại xe có kết cấu tương tự; xe ô tô tải, máy kéo có trọng tải dưới 3,5 tấn; xe ô tô chở người đến 9 chỗ ngồi
', 0, N'Người đủ trên 18 tuổi được phép điều khiển xe mô tô 2 bánh có dung tích xi lanh từ 50cc đến dưới 175cc và các xe ô tô tải từ 4 - 9 chỗ - trọng tải dưới 3.5 tấn theo quy định.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (33, N'Khi sử dụng giấy phép lái xe đã khai báo mất để điều khiển phương tiện cơ giới đường bộ, ngoài việc bị thu hồi giấy phép lái xe, chịu trách nhiệm trước pháp luật, người lái xe không được cấp giấy phép lái xe trong thời gian bao nhiêu năm?
', 0, N'Người có hành vi sử dụng giấy phép lái xe đã khai báo mất để điều khiển phương tiện cơ giới đường bộ, có hành vi gian dối khác để được đổi, cấp lại, cấp mới giấy phép lái xe sẽ bị cơ quan quản lý giấy phép lái xe ra quyết định thu hồi giấy phép lái xe, hồ sơ gốc và cập nhật dữ liệu quản lý trên hệ thống. Phải chịu trách nhiệm trước pháp luật và không được cấp giấy phép lái xe trong thời hạn 5 năm kể từ ngày phát hiện vi phạm. Nếu có nhu cầu cấp lại giấy phép lái xe phải học và sát hạch như trường hợp cấp giấy phép lái xe lần đầu.

', 3)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (34, N'Khi muốn chuyển hướng, người lái xe phải thực hiện như thế nào để đảm bảo an toàn giao thông?
', 0, N'Khi muốn chuyển hướng sang làn đường khác người điều khiển phương tiện phải quan sát gương, giảm tốc độ, ra tín hiệu chuyển hướng, quan sát an toàn và chuyển hướng. Như vậy mới đảm bảo an toàn cho mình và các phương tiện xung quanh.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (35, N'Người điểu khiển xe mô tô hai bánh, xe gắn máy được phép chở tối đa 2 người trong những trường hợp nào?
', 0, N'Người điểu khiển xe mô tô hai bánh, xe gắn máy được phép chở tối đa 2 người khi chở người bị bệnh đi cấp cứu; trẻ em dưới 14 tuổi và áp tải người có hành vi vi phạm pháp luật.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (36, N'Trong các trường hợp dưới đây, để đảm bảo an toàn khi tham gia giao thông, người lái xe mô tô cần thực hiện như thế nào?
', 0, N'Để đảm bảo an toàn khi tham gia giao thông, người lái xe mô tô KHÔNG ĐƯỢC PHÉP sử dụng ô, điện thoại di động, thiết bị âm thanh (trừ thiết bị trợ thính). Luôn luôn đội mũ bảo hiểm khi điều khiển phương tiện tham gia giao thông.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (37, N'Các phương tiện tham gia giao thông đường bộ (kể cả những xe có quyền ưu tiên) đều phải dừng lại bên phải đường của mình và trước vạch “dừng xe” tại các điểm giao cắt giữa đường bộ và đường sắt khi có báo hiệu dừng nào dưới đây?
', 0, N'Tất cả hành động trên đều là cảnh báo bắt buộc các phương tiện phải tuân thủ khi đi đến tuyến đường đường bộ giao nhau với đường sắt.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (38, N'Khi gặp xe buýt đang đang dừng đón, trả khách, người điều khiển xe mô tô phải xử lý như thế nào dưới đây để đảm bảo an toàn giao thông?
', 0, N'Khi xe buýt đang dừng đón trả khách thì người điều khiển xe mô tô: giảm tốc độ và từ từ vượt qua xe buýt. Không nhất thiết phải dừng lại, nhưng bắt buộc không được tăng tốc vượt ẩu vì rất dễ gây tai nạn.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (39, N'Khi tránh nhau trên đường hẹp, người lái xe cần phải chú ý những điểm nào để đảm bảo an toàn giao thông?
', 0, N'Cả ý 1 và ý 2 đúng. Ý 3 SAI vì tránh nhau không được bật đèn pha mà phải bật đèn cốt.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (40, N'Để đảm bảo an toàn khi tham gia giao thông, người lái xe mô tô hai bánh cần điều khiển tay ga như thế nào trong các trường hợp dưới đây?
', 0, N'Để đảm bảo an toàn khi tham gia giao thông, người lái xe mô tô hai bánh phải tăng ga từ từ để điều chỉnh tốc độ an toàn và giảm ga thật nhanh nếu thấy không an toàn. Đây là câu hỏi liên quan thực tế, học viên bắt buộc phải nhớ để đi đường sau này.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (41, N'“Dải phân cách” trên đường bộ gồm những loại nào?
', 0, N'Dải phân cách gồm: loại cố định và loại di động.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (42, N'Khái niệm “người điều khiển giao thông” được hiểu như thế nào là đúng?
', 0, N'Người điều khiển giao thông là: cảnh sát giao thông, người được giao nhiệm vụ hướng dẫn giao thông.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (43, N'Khi lái xe trong khu đô thị và đông dân cư trừ các khu vực có biển cấm sử dụng còi, người lái xe được sử dụng còi như thế nào trong các trường hợp dưới đây?
', 0, N'Chỉ được phép sử dụng còi từ: 5 giờ sáng đến 22 giờ tối trong khu đô thị và đông dân cư.

', 4)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (64, N'Đường mà trên đó phương tiện tham gia giao thông được các phương tiện giao thông đến từ hướng khác nhường đường khi qua nơi đường giao nhau, được cắm biển báo hiệu đường ưu tiên là loại đường gì?
', 0, N'Đường ưu tiên thì được cắm biển báo đường ưu tiên.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (65, N'Khái niệm “đỗ xe” được hiểu như thế nào là đúng?
', 0, N'Đỗ xe thì đứng yên, không giới hạn thời gian.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (66, N'Trong trường hợp đặc biệt, để được lắp đặt, sử dụng còi, đèn không đúng với thiết kế của nhà sản xuất đối với từng loại xe cơ giới bạn phải đảm bảo yêu cầu nào dưới đây?
', 0, N'Muốn lắp thêm, chế thêm cái gì vào xe thì phải được Trung Tâm Đăng Kiểm cấp phép.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (67, N'* Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông có được bám, kéo hoặc đẩy các phương tiện khác không?
', 1, N'Gặp Đáp án có “KHÔNG ĐƯỢC PHÉP” thì chọn là chắc chắn đúng!

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (68, N'Người có GPLX mô tô hạng A1 được phép điều khiển loại xe nào dưới đây?
', 0, N'GPLX Hạng A1 được chạy xe từ 50 cm3 đến dưới 175 cm3 và người khuyết tật được dùng GPLX này để chạy xe ba bánh.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (69, N'Tại nơi có biển báo hiệu cố định lại có báo hiệu tạm thời thì người tham gia giao thông phải chấp hành hiệu lệnh của báo hiệu nào?
', 0, N'Biển báo tạm thời luôn ưu tiên vì lúc đó biến xảy ra tại khu vực đó!

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (70, N'Tại nơi đường giao nhau, người lái xe đang đi trên đường không ưu tiên phải nhường đường như thế nào là đúng quy tắc giao thông?
', 0, N'Xe mình đang đi trên đường không ưu tiên thì phải nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (71, N'Người lái xe phải giảm tốc độ thấp hơn tốc độ tối đa cho phép (có thể dừng lại một cách an toàn) trong trường hợp nào dưới đây?
', 0, N'Khi gặp cảnh báo nguy hiểm thì phải giảm tốc độ, đi từ từ thôi. Gặp cầu hẹp, cống hẹp cũng phải giảm ga, đi chậm qua.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (72, N'Trên đường bộ (trừ đường cao tốc) trong khu vực đông dân cư, đường đôi có dải phân cách giữa, xe mô tô hai bánh, ô tô chở người đến 30 chỗ tham gia giao thông với tốc độ tối đa cho phép là bao nhiêu?
', 0, N'Có dãy phân cách thì 60km/h, không có dãy phân cách thì 50km/h.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (73, N'* Người lái xe phải xử lý như thế nào khi quan sát phía trước thấy người đi bộ đang sang đường tại nơi có vạch đường dành cho người đi bộ để đảm bảo an toàn?
', 1, N'Gặp người đi bộ đang đi sang đường thì chúng ta phải giảm tốc độ, dừng lại nhường đường cho người đi bộ qua đường xong thì mới được đi tiếp.

', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (105, N'1+1=?', 1, N'vì nó thế', 12)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (106, N'2+2=?', 0, N'Vì vậy', 12)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (107, N'3+3=?', 0, N'Vì vậy', 12)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (108, N'4+4=', 0, N'Vì vậy', 12)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (109, N'5+5=', 0, N'Vì vậy', 12)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (114, N'sssssssssssssssss', 0, N'ssssssssssssss', 7)
INSERT [dbo].[question] ([questionId], [questionName], [type], [explain], [quizId]) VALUES (115, N'123', 0, N'321', 14)
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (1, N'Đề 1', 20, 1)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (2, N'Đề 2', 30, 1)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (3, N'Đề 3', 30, 1)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (4, N'Đề 4', 30, 1)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (7, N'Đề 7', 30, 1)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (12, N'Đề 8', 20, 1)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (13, N'Hehe', 20, 0)
INSERT [dbo].[quiz] ([quizId], [quizName], [duration], [status]) VALUES (14, N'123', 321, 1)
SET IDENTITY_INSERT [dbo].[quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userId], [userName], [name], [password], [role]) VALUES (1, N'admin', N'admin', N'123', 1)
INSERT [dbo].[user] ([userId], [userName], [name], [password], [role]) VALUES (3, N'duong', N'duong', N'123', 0)
INSERT [dbo].[user] ([userId], [userName], [name], [password], [role]) VALUES (4, N'vanh', N'vanh', N'123', 0)
INSERT [dbo].[user] ([userId], [userName], [name], [password], [role]) VALUES (5, N'aaaa', N'aaaa', N'123', 0)
INSERT [dbo].[user] ([userId], [userName], [name], [password], [role]) VALUES (6, N'bbbb', N'bbb', N'123', 0)
INSERT [dbo].[user] ([userId], [userName], [name], [password], [role]) VALUES (7, N'cccc', N'cccc', N'123', 0)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[user_attempt] ON 

INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (1, 1, 1, 6, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (2, 2, 0, 30, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (3, 1, 0, 4, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (4, 1, 1, 16, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (5, 3, 0, 5, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (6, 2, 2, 8, 4, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (7, 1, 0, 0, 4, N'Bỏ bài hoặc không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (8, 12, 1, 4, 1, N'Bỏ bài hoặc không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (9, 12, 1, 1, 1, N'')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (10, 12, 1, 2, 1, N'Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (11, 12, 0, 2, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (12, 12, 0, 20, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (13, 12, 4, 7, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (14, 12, 0, 0, 1, N'Bỏ bài, không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (15, 12, 2, 7, 1, N'Not Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (16, 12, 0, 0, 1, N'Bỏ bài, không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (17, 12, 5, 6, 1, N'Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (18, 12, 5, 4, 1, N'Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (19, 12, 2, 4, 1, N'Not Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (20, 12, 4, 4, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (21, 12, 0, 0, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (22, 12, 0, 0, 1, N'Bỏ bài, không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (23, 1, 0, 0, 1, N'Bỏ bài, không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (24, 1, 0, 0, 1, N'Bỏ bài, không làm bài')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (25, 1, 0, 3, 3, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (26, 14, 1, 3, 1, N'Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (27, 14, 0, 7, 1, N'Not Passed')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (28, 1, 0, 7, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (29, 1, 0, 5, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (30, 1, 0, 3, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (31, 1, 0, 0, 1, N'Sai câu điểm liệt')
INSERT [dbo].[user_attempt] ([attemptId], [quizId], [total], [finish], [userId], [note]) VALUES (32, 1, 1, 9, 1, N'Sai câu điểm liệt')
SET IDENTITY_INSERT [dbo].[user_attempt] OFF
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_question] FOREIGN KEY([questionId])
REFERENCES [dbo].[question] ([questionId])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_question]
GO
ALTER TABLE [dbo].[attempt_detail]  WITH CHECK ADD  CONSTRAINT [FK_attempt_detail_answer] FOREIGN KEY([answerId])
REFERENCES [dbo].[answer] ([answerId])
GO
ALTER TABLE [dbo].[attempt_detail] CHECK CONSTRAINT [FK_attempt_detail_answer]
GO
ALTER TABLE [dbo].[attempt_detail]  WITH CHECK ADD  CONSTRAINT [FK_attempt_detail_question] FOREIGN KEY([questionId])
REFERENCES [dbo].[question] ([questionId])
GO
ALTER TABLE [dbo].[attempt_detail] CHECK CONSTRAINT [FK_attempt_detail_question]
GO
ALTER TABLE [dbo].[attempt_detail]  WITH CHECK ADD  CONSTRAINT [FK_attempt_detail_quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[quiz] ([quizId])
GO
ALTER TABLE [dbo].[attempt_detail] CHECK CONSTRAINT [FK_attempt_detail_quiz]
GO
ALTER TABLE [dbo].[attempt_detail]  WITH CHECK ADD  CONSTRAINT [FK_attempt_detail_user_attempt] FOREIGN KEY([attemptId])
REFERENCES [dbo].[user_attempt] ([attemptId])
GO
ALTER TABLE [dbo].[attempt_detail] CHECK CONSTRAINT [FK_attempt_detail_user_attempt]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[quiz] ([quizId])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_quiz]
GO
ALTER TABLE [dbo].[user_attempt]  WITH CHECK ADD  CONSTRAINT [FK_user_attempt_quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[quiz] ([quizId])
GO
ALTER TABLE [dbo].[user_attempt] CHECK CONSTRAINT [FK_user_attempt_quiz]
GO
ALTER TABLE [dbo].[user_attempt]  WITH CHECK ADD  CONSTRAINT [FK_user_attempt_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[user_attempt] CHECK CONSTRAINT [FK_user_attempt_user]
GO
