DROP SCHEMA IF EXISTS tpac_db;
CREATE SCHEMA tpac_db;
USE tpac_db;

CREATE TABLE IF NOT EXISTS User (
  `user_id` int(11) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_zh-hk` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone_country` varchar(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avator` text,
  `created_date` datetime NOT NULL,
  `type` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `User_Mapping` (
  `mapping_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mapping` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Group` (
  `group_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_zh-hk` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Group_Member (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_seq_num` int(11) DEFAULT '0',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Attendance` (
  `attendance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `worship_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `AttendanceRecord` (
  `attendance_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `worship_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Worship (
  `worship_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `Attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `Attendance_ibfk_1` (`user_id`),
  ADD KEY `Attendance_ibfk_2` (`worship_id`);

ALTER TABLE `AttendanceRecord`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `worship_id` (`worship_id`);


--
-- Indexes for table `Group`
--
ALTER TABLE `Group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `Group_Member`
--
ALTER TABLE `Group_Member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `Group_Member_ibfk_1` (`group_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `User_Mapping`
--
ALTER TABLE `User_Mapping`
  ADD PRIMARY KEY (`mapping_id`),
  ADD KEY `User_Mapping_userid` (`user_id`);

--
-- Indexes for table `Worship`
--
ALTER TABLE `Worship`
  ADD PRIMARY KEY (`worship_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Attendance`
--
ALTER TABLE `Attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AttendanceRecord`
--
ALTER TABLE `AttendanceRecord`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Group`
--
ALTER TABLE `Group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Group_Member`
--
ALTER TABLE `Group_Member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User_Mapping`
--
ALTER TABLE `User_Mapping`
  MODIFY `mapping_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Worship`
--
ALTER TABLE `Worship`
  MODIFY `worship_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `Attendance_ibfk_2` FOREIGN KEY (`worship_id`) REFERENCES `Worship` (`worship_id`);

--
-- Constraints for table `AttendanceRecord`
--
ALTER TABLE `AttendanceRecord`
  ADD CONSTRAINT `attendance_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `attendance_worship` FOREIGN KEY (`worship_id`) REFERENCES `Worship` (`worship_id`);

--
-- Constraints for table `Group_Member`
--
ALTER TABLE `Group_Member`
  ADD CONSTRAINT `Group_Member_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `Group` (`group_id`),
  ADD CONSTRAINT `Group_Member_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `User_Mapping`
--
ALTER TABLE `User_Mapping`
  ADD CONSTRAINT `User_Mapping_userid` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);
COMMIT;
