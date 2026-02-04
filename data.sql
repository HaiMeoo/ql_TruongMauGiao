-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 01, 2026 lúc 08:01 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ql_maugiaomvc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `activityname` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `activity`
--

INSERT INTO `activity` (`id`, `activityname`) VALUES
(1, 'Đón trẻ, trò chuyện buổi sáng'),
(2, 'Tập thể dục buổi sáng'),
(3, 'Hoạt động học tập trung'),
(4, 'Hoạt động Nghệ thuật'),
(5, 'Ăn nhẹ'),
(6, 'Chơi tự do trong lớp'),
(7, 'Chuẩn bị và ăn trưa'),
(8, 'Ngủ trưa'),
(9, 'Dậy, vệ sinh cá nhân'),
(10, 'Ôn tập'),
(11, 'Hoạt động vui chơi'),
(12, 'Hoạt động cuối ngày'),
(13, 'Chuẩn bị ra về');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `studentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(100) NOT NULL,
  `TeacherId` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `GradeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacttt`
--

CREATE TABLE `contacttt` (
  `id` int(11) NOT NULL,
  `hotline` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contacttt`
--

INSERT INTO `contacttt` (`id`, `hotline`, `email`) VALUES
(1, '0939846641', 'nguyenquochai2004pq@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description1` text DEFAULT NULL,
  `description2` text DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `content`
--

INSERT INTO `content` (`id`, `name`, `title`, `description1`, `description2`, `image1`, `image2`, `image3`) VALUES
(1, 'Trường Mầm Non Xanh', 'Nơi trải nghiệm hạnh phúc cùng con', 'Trường Mầm non Xanh Montessori được tạo dựng từ một nền tảng vững chắc của một ngôi trường hạnh phúc – nơi mỗi trẻ em được chăm sóc, hướng dẫn và đồng hành trên hành trình phát triển bản thân và hoàn thiện nhân cách.', 'Đồng thời giúp con nuôi dưỡng sự tự tin, tự lập, giúp con yêu thương và có trách nhiệm với bản thân, con được trang bị đầy đủ kỹ năng để phát huy tối đa tiềm năng. Hơn hết, con là một người hạnh phúc.', 'images/content1.png', 'images/content2.png', 'images/content3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `curriculum`
--

CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `curriculum`
--

INSERT INTO `curriculum` (`id`, `title`, `content`, `image`) VALUES
(1, ' CHƯƠNG TRÌNH GIÁO DỤC', 'Chương trình tại Mần non Xanh là chương trình dựa trên sự tích hợp các cách tiếp cận giáo dục đỉnh cao trong giáo dục đầu đời hiện nay: Thuyết Trí Thông Minh Đa Dạng của Howard Gardner nhấn mạnh rằng cần có chương trình giáo dục hướng tới cá nhân để có thể phát triển những khả năng tiềm ẩn, vốn luôn tồn tại, trong mỗi trẻ; Cách Tiếp cận Dự án (Project approach) của Lilian Katz (Mỹ) tạo cơ hội cho trẻ được trở thành những nhà khoa học ham tìm tòi và khám phá; Phương pháp Montessori nhằm phát triển kỹ năng học tập, kỹ năng sống và 5 giác quan của trẻ; Cách tiếp cận Reggio Emilia xuất phát từ Ý và hiện đang được đánh giá rất cao và áp dụng tại những trường mầm non tốt nhất ở nhiều nước trên thế giới vì mở rộng cánh cửa cho trí tưởng tượng và sáng tạo của trẻ được bay bổng; Lý thuyết Giáo dục Kỹ năng Cảm xúc Xã hội (SEL) hướng tới dạy kỹ năng cảm xúc xã hội (còn gọi là EQ) như là một cách nuôi dưỡng và phát triển trí lực và thông minh cảm xúc của trẻ; Các cách tiếp cận này thể hiện mạnh mẽ nguyên tắc dạy học tích cực và lấy trẻ làm trung tâm, giúp trẻ phát triển tối đa khả năng tư duy độc lập, khả năng giải quyết vấn đề, năng lực sáng tạo cũng như khả năng hợp tác.', 'cth2.png'),
(2, 'PHƯƠNG PHÁP MONTESSORI', 'Lớp học Montessori là một môi trường đặc biệt vừa đảm bảo sự nghiêm túc, kỷ luật vừa đảm bảo sự tự do, hào hứng ở tất cả các trẻ. Môi trường đặc biệt này được xác định bởi hai yếu tố trọng tâm là giáo cụ Montessori và giáo viên đã được đào tạo về phương pháp Montessori. Trong lớp học Montessori, các giáo cụ được giáo viên sắp xếp vào 5 góc hoạt động: góc sinh hoạt (hay góc luyện tập các kĩ năng sinh hoạt), góc cảm giác (hay góc luyện tập giác quan), góc toán, góc ngôn ngữ và góc văn hóa. Kiến thức, kĩ năng của trẻ dần được mở rộng, phát triển hơn khi trẻ làm việc với mỗi giáo cụ trong các góc hoạt động, tạo cơ sở nền tảng giúp trẻ trưởng thành hơn.', 'cth1.png'),
(3, 'CHƯƠNG TRÌNH NGOẠI KHÓA', 'Trường mầm non Xanh tổ chức chương trình ngoại khóa đa dạng và phong phú, nhằm giúp trẻ phát triển toàn diện về mặt tư duy, thể chất và kỹ năng xã hội. Chương trình bao gồm nhiều hoạt động đa dạng như thể thao, hội họa, âm nhạc, múa, kể chuyện, nấu ăn và các hoạt động đồng hành khác. Những hoạt động này giúp trẻ rèn luyện và phát triển kỹ năng sáng tạo, tư duy logic, kỹ năng xã hội và rèn luyện sức khỏe, tạo cơ hội cho trẻ học hỏi, khám phá thế giới xung quanh và phát triển khả năng tự lập. Chương trình ngoại khóa của Mầm non Xanh cũng giúp trẻ tạo ra những kết nối xã hội, giao lưu và kết bạn mới, giúp trẻ học hỏi và trải nghiệm những giá trị văn hóa, đồng thời giúp trẻ phát triển sự tự tin và khả năng thích ứng với những môi trường mới.', 'cth3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `eventname` varchar(255) NOT NULL,
  `eventdescription` text DEFAULT NULL,
  `eventdate` datetime DEFAULT current_timestamp(),
  `ClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`id`, `eventname`, `eventdescription`, `eventdate`, `ClassID`) VALUES
(1, 'vẽ tranh', 'bé tự sáng tạo tranh phong cảnh', '2025-01-13 08:35:00', 1),
(2, 'bé tập làm bánh trôi', 'bé có thể trải nghiệm làm bánh tại lớp', '2025-01-09 08:35:00', 0),
(3, 'hội chợ tết', 'cho bé vui chơi', '2025-01-13 08:48:00', 0),
(4, 'múa hát chuẩn bị văn nghẹ tết 2024', 'múa hát chuẩn bị văn nghẹ tết 2024', '2025-01-15 09:15:00', 1),
(5, 'bé chơi trò chơi ngời trời', 'bé chơi trò chơi ngời trời', '2025-01-14 09:16:00', 0),
(6, 'học', 'làm quen ngôn ngữ mưới', '2025-01-13 15:53:00', 1),
(7, 'học tiếnh anh', 'làm quen với tiếng anh', '2025-01-13 16:01:00', 1),
(8, 'bé chơi trò chơi sáng tạo', 'bé chơi trò chơi sáng tạo', '2025-01-13 16:10:00', 1),
(9, 'văn nghệ tập thể b2', 'văn nghệ tập thể b2', '2025-01-16 02:28:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `eventphoto`
--

CREATE TABLE `eventphoto` (
  `id` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `photo_description` text DEFAULT NULL,
  `upload_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `eventphoto`
--

INSERT INTO `eventphoto` (`id`, `eventid`, `photo_name`, `photo_description`, `upload_date`) VALUES
(1, 1, 'content1.png', '', '2025-01-14 00:10:19'),
(2, 1, 'content2.png', '', '2025-01-14 00:10:19'),
(3, 1, 'content3.png', '', '2025-01-14 00:10:19'),
(4, 8, 'event-phattriencamxuc.jpg', '', '2025-01-14 00:29:40'),
(5, 8, 'event-sangtao.jpg', '', '2025-01-14 00:29:41'),
(6, 7, 'event-mubaohiem2.jpg', '', '2025-01-14 00:31:18'),
(7, 7, 'event-mubaohiem3.jpg', '', '2025-01-14 00:31:18'),
(8, 7, 'event-mubaohiem4.jpg', '', '2025-01-14 00:31:18'),
(9, 7, 'event-sangtao.jpg', '', '2025-01-14 00:31:18'),
(10, 6, 'event-mamxanh - Copy.jpg', '', '2025-01-14 00:32:38'),
(11, 6, 'event-mamxanh.jpg', '', '2025-01-14 00:32:38'),
(12, 6, 'event-mamxanh1 - Copy.jpg', '', '2025-01-14 00:32:38'),
(13, 4, 'slide1.png', '', '2025-01-14 00:33:33'),
(14, 4, 'slide2.jpg', '', '2025-01-14 00:33:33'),
(15, 4, 'slide3.jpg', '', '2025-01-14 00:33:33'),
(16, 1, 'content3.png', '', '2025-01-14 00:38:28'),
(17, 1, 'banner-tintuc.jpg', '', '2025-01-14 00:39:53'),
(18, 9, 'content3.png', '', '2025-01-14 09:35:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `GradeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `grade`
--

INSERT INTO `grade` (`id`, `GradeName`) VALUES
(1, '2-3 tuổi'),
(2, '3-4 tuổi'),
(3, '4-5 tuổi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description_vn` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `title`, `description_vn`, `description_en`, `author`, `button_text`, `image_url`) VALUES
(1, 'Sự khởi đầu tươi sáng', '“Trẻ em là những người thầy tuyệt vời, chúng dạy ta về sự yêu thương, lòng kiên nhẫn và niềm vui.”.', '“Children are wonderful teachers, they teach us love, patience, and joy.”', 'Albert Einstein', 'Học từ trẻ em', 'images/slide1.png'),
(2, 'Chắp cánh ước mơ', '“Một đứa trẻ có thể bay cao hơn khi chúng được trao cơ hội và sự tự do để khám phá thế giới.”.', '“A child can soar higher when given the opportunity and freedom to explore the world.”', 'Carl Jung ', 'Khám phá tiềm năng', 'images/slide3.jpg'),
(3, 'Nơi ươm mầm hạnh phúc', '“Điều quan trọng đầu tiên trong sự phát triển của trẻ nhỏ là sự tập trung. Đứa trẻ tập trung sẽ vô cùng vui vẻ.”.', '“The first essential for the child’s development is concentration. The child who concentrates is immensely happy.”', 'Maria Montessori', 'Những điều chia sẻ', 'images/slide2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ParentName` varchar(100) NOT NULL,
  `ParentPhone` varchar(15) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `StudentID` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Bẫy `students`
--
DELIMITER $$
CREATE TRIGGER `before_insert_students` BEFORE INSERT ON `students` FOR EACH ROW BEGIN
    DECLARE new_id INT;

    -- Lấy giá trị lớn nhất hiện tại trong StudentID và tăng lên 1
    SELECT COALESCE(MAX(CAST(SUBSTRING(StudentID, 4) AS UNSIGNED)), 0) + 1 
    INTO new_id
    FROM students;

    -- Gán giá trị StudentID với định dạng MNX + 9 số
    SET NEW.StudentID = CONCAT('MNX', LPAD(new_id, 9, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `HireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `time`
--

CREATE TABLE `time` (
  `id` int(11) NOT NULL,
  `timename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `time`
--

INSERT INTO `time` (`id`, `timename`) VALUES
(1, '7:30 - 8:00'),
(2, '8:00 - 8:15'),
(3, '8:15 - 9:00'),
(4, '9:00 - 10:00'),
(5, '10:00 - 10:15'),
(6, '10:15 - 11:00'),
(7, '11:00 - 11:30'),
(8, '11:30 - 13:30'),
(9, '13:30 - 14:00'),
(10, '14:00 - 15:00'),
(11, '15:00 - 15:30'),
(12, '15:30 - 16:00'),
(13, '16:00 - 16:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `GradeID` int(11) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  `TimeID` int(11) DEFAULT NULL,
  `Description` varchar(500) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `DateCreated` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `studentID`, `teacherID`, `email`, `DateCreated`) VALUES
(1, 'admin', '123', '1', NULL, NULL, 'admin1@gmail.com', '2025-01-05 15:29:10'),
(2, 'giaovien', '123', '2', NULL, 3, 'thuytrang11@gmail.com', '2025-01-05 15:29:10'),
(3, 'phuhuynh', '123', '3', 15, NULL, 'an@gmail.com', '2025-01-05 15:30:42');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacttt`
--
ALTER TABLE `contacttt`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `eventphoto`
--
ALTER TABLE `eventphoto`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentID` (`StudentID`);

--
-- Chỉ mục cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;
COMMIT;


ALTER TABLE users 
MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE classes 
MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE teachers 
MODIFY id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE students 
MODIFY id INT NOT NULL AUTO_INCREMENT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
