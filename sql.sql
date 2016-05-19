-- --------------------------------------------------------
-- Host:                         ap-cdbr-azure-southeast-b.cloudapp.net
-- Server version:               5.5.45-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for alzdpu
CREATE DATABASE IF NOT EXISTS `alzdpu` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `alzdpu`;


-- Dumping structure for table alzdpu.answer
CREATE TABLE IF NOT EXISTS `answer` (
  `AnswerID` char(7) NOT NULL,
  `AnswerTitle` char(7) DEFAULT NULL,
  `AnswerCorrectStatus` char(1) DEFAULT NULL,
  `QuestionID` char(7) DEFAULT NULL,
  PRIMARY KEY (`AnswerID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.answer: ~0 rows (approximately)
DELETE FROM `answer`;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;


-- Dumping structure for table alzdpu.disease
CREATE TABLE IF NOT EXISTS `disease` (
  `DiseaseID` char(7) NOT NULL,
  `PatientCitizenID` char(13) NOT NULL,
  `DiseaseName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`DiseaseID`,`PatientCitizenID`),
  KEY `PatientCitizenID` (`PatientCitizenID`),
  CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`PatientCitizenID`) REFERENCES `patient` (`PatientCitizenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.disease: ~0 rows (approximately)
DELETE FROM `disease`;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;


-- Dumping structure for table alzdpu.gamecategory
CREATE TABLE IF NOT EXISTS `gamecategory` (
  `GameCategoryID` char(7) NOT NULL,
  `GameCategoryTitle` varchar(100) DEFAULT NULL,
  `RelativeID` char(7) DEFAULT NULL,
  PRIMARY KEY (`GameCategoryID`),
  KEY `RelativeID` (`RelativeID`),
  CONSTRAINT `RelativeID` FOREIGN KEY (`RelativeID`) REFERENCES `relative` (`RelativeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.gamecategory: ~0 rows (approximately)
DELETE FROM `gamecategory`;
/*!40000 ALTER TABLE `gamecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamecategory` ENABLE KEYS */;


-- Dumping structure for table alzdpu.gamequestion
CREATE TABLE IF NOT EXISTS `gamequestion` (
  `GameCategoryID` char(7) NOT NULL,
  `QuestionID` char(7) NOT NULL,
  PRIMARY KEY (`GameCategoryID`,`QuestionID`),
  KEY `GameCategoryID` (`GameCategoryID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `GameCategoryID` FOREIGN KEY (`GameCategoryID`) REFERENCES `gamecategory` (`GameCategoryID`),
  CONSTRAINT `QuestionID` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.gamequestion: ~0 rows (approximately)
DELETE FROM `gamequestion`;
/*!40000 ALTER TABLE `gamequestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamequestion` ENABLE KEYS */;


-- Dumping structure for table alzdpu.location
CREATE TABLE IF NOT EXISTS `location` (
  `LocationID` char(7) NOT NULL,
  `LocationLatitude` text,
  `LocationLongitude` text,
  `LocationDate` date DEFAULT NULL,
  `LocationTime` time DEFAULT NULL,
  `PatientCitizenID` char(13) DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  KEY `PatientCitizenID` (`PatientCitizenID`),
  CONSTRAINT `PatientCitizenID` FOREIGN KEY (`PatientCitizenID`) REFERENCES `patient` (`PatientCitizenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.location: ~0 rows (approximately)
DELETE FROM `location`;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


-- Dumping structure for table alzdpu.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `PatientCitizenID` char(13) NOT NULL,
  `PatientFirstname` varchar(150) DEFAULT NULL,
  `PatientLastname` varchar(150) DEFAULT NULL,
  `PatientHeight` varchar(10) DEFAULT NULL,
  `PatientPicture` text,
  `PatientBirthday` date DEFAULT NULL,
  `PatientBloodType` varchar(20) DEFAULT NULL,
  `PatientRadius` varchar(20) DEFAULT NULL,
  `PatientReferenceLocation` text,
  `RelativeID` char(7) DEFAULT NULL,
  PRIMARY KEY (`PatientCitizenID`),
  KEY `RelativeID` (`RelativeID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`RelativeID`) REFERENCES `relative` (`RelativeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.patient: ~1 rows (approximately)
DELETE FROM `patient`;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` (`PatientCitizenID`, `PatientFirstname`, `PatientLastname`, `PatientHeight`, `PatientPicture`, `PatientBirthday`, `PatientBloodType`, `PatientRadius`, `PatientReferenceLocation`, `RelativeID`) VALUES
	('1200900178163', 'กมลรัตน์', 'โตเงิน', '168', '14610547441458754313311.jpg', '1995-02-13', 'O', '100', '13.8705919, 100.5526545', 'REL0001');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;


-- Dumping structure for table alzdpu.patientapplication
CREATE TABLE IF NOT EXISTS `patientapplication` (
  `PatientApplicationID` char(7) NOT NULL,
  `PatientApplicationRadius` varchar(20) DEFAULT NULL,
  `PatientApplicationReferenceLocation` text,
  PRIMARY KEY (`PatientApplicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.patientapplication: ~0 rows (approximately)
DELETE FROM `patientapplication`;
/*!40000 ALTER TABLE `patientapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientapplication` ENABLE KEYS */;


-- Dumping structure for table alzdpu.question
CREATE TABLE IF NOT EXISTS `question` (
  `QuestionID` char(7) NOT NULL,
  `QuestionTitle` varchar(100) DEFAULT NULL,
  `QuestionImage` text,
  PRIMARY KEY (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.question: ~0 rows (approximately)
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table alzdpu.questionnaire
CREATE TABLE IF NOT EXISTS `questionnaire` (
  `Questionnaire_id` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Questionnaire_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.questionnaire: ~11 rows (approximately)
DELETE FROM `questionnaire`;
/*!40000 ALTER TABLE `questionnaire` DISABLE KEYS */;
INSERT INTO `questionnaire` (`Questionnaire_id`, `Questionnaire_name`) VALUES
	('QUE0001', 'ชอบถามคำถามเดิมซ้ำ ๆ'),
	('QUE0002', 'หลงลืมบ่อยขึ้น มีปัญหายุ่งยากเรื่องความจำระยะสั้น'),
	('QUE0003', 'ต้องมีคนเตือนให้ทำกิจกรรมที่จำเป็น'),
	('QUE0004', 'ลืมวันนัด ลืมโอกาสที่สำคัญของครอบครัว เช่น วันเกิด วันครบรอบแต่งงาน หรือวันหยุดพิเศษ'),
	('QUE0005', 'ดูซึมลง เศร้าหมอง หรือร้องไห้บ่อยกว่าปกติ'),
	('QUE0006', 'เริ่มมีความยุ่งยากในการคิดเลข คิดเงิน หรือลำบากมากขึ้นในการดูแลจัดการเรื่องเงินทอง'),
	('QUE0007', 'ไม่สนใจกิจกรรมที่เคยชอบทำ เช่น งานอดิเรกที่เคยทำ กิจกรรมสังคมที่เคยไป'),
	('QUE0008', 'เริ่มต้องมีคนคอยช่วยเหลือในกิจกรรมประจำวัน เช่น การรับประทานอาหาร'),
	('QUE0009', 'หงุดหงิด อารมณ์เสียบ่อยขึ้น ช่างสงสัย เริ่มเห็น ได้ยิน เชื่อในสิ่งที่ไม่เป็นจริง'),
	('QUE0010', 'เริ่มมีปัญหาเรื่องทิศทาง (ถ้าเคยขับรถก็หลงทางบ่อย จำทิศทางไม่ได้ ขับรถอันตราย ไม่ปลอดภัย หรือเลิกขับรถไปเลย)'),
	('QUE0011', 'มีความยุ่งยาก ลำบากในการหาคำพูดที่ต้องการจะพูด เรียกชื่อคนสิ่งของไม่ถูกพูดไม่จบประโยค');
/*!40000 ALTER TABLE `questionnaire` ENABLE KEYS */;


-- Dumping structure for table alzdpu.relative
CREATE TABLE IF NOT EXISTS `relative` (
  `RelativeID` char(7) NOT NULL,
  `RelativeFirstname` varchar(150) DEFAULT NULL,
  `RelativeLastname` varchar(150) DEFAULT NULL,
  `RelativeFirstMobileNo` varchar(10) DEFAULT NULL,
  `RelativeSecondMobileNo` varchar(10) DEFAULT NULL,
  `RelativeHouseNo` varchar(20) DEFAULT NULL,
  `RelativeStreet` varchar(50) DEFAULT NULL,
  `RelativeSubdistrict` varchar(50) DEFAULT NULL,
  `RelativeDistrict` varchar(50) DEFAULT NULL,
  `RelativeProvince` varchar(50) DEFAULT NULL,
  `RelativePicture` text,
  `RelativeUsername` varchar(15) DEFAULT NULL,
  `RelativePassword` varchar(64) DEFAULT NULL,
  `RelativeLineID` varchar(50) DEFAULT NULL,
  `RelativeEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RelativeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.relative: ~10 rows (approximately)
DELETE FROM `relative`;
/*!40000 ALTER TABLE `relative` DISABLE KEYS */;
INSERT INTO `relative` (`RelativeID`, `RelativeFirstname`, `RelativeLastname`, `RelativeFirstMobileNo`, `RelativeSecondMobileNo`, `RelativeHouseNo`, `RelativeStreet`, `RelativeSubdistrict`, `RelativeDistrict`, `RelativeProvince`, `RelativePicture`, `RelativeUsername`, `RelativePassword`, `RelativeLineID`, `RelativeEmail`) VALUES
	('REL0001', 'Surasak', 'Hanlamyuang', '0957677078', '0941238227', '333/6', 'Ratchadapisek', 'Ratchadapisek 36', 'Chandrakasem', 'Chatuchak', 'Bangkok', 'lordtam', '1234', 'lordtam', 'surasak.hanl@hotmail.com'),
	('REL0002', 'anakpon', 'prathanrach', '0882238977', '', '807/315', 'Phahonyothin', 'Coocot', 'Lumlukka', 'Pathumthani', 'default.png', NULL, '5555', 'anakpon', 'fahn.anakpon@gmail.com'),
	('REL0003', '', '', '', '', '', '', '', '', '', 'default.png', NULL, '5555', '', 'test'),
	('REL0004', '', '', '', '', '', '', '', '', '', 'default.png', NULL, '5555', '', 'test2'),
	('REL0005', '', '', '', '', '', '', '', '', '', 'default.png', NULL, '5555', '', 'test3'),
	('REL0006', 'test1', 'testsurname', '098', '0999', '123', 'test', 'test', 'test', 'test', 'default.png', NULL, '1234', 'ter', 'teat'),
	('REL0007', '', '', '0888888888', '0899999999', '', '', '', '', '', 'default.png', NULL, '1', '', 'teststringlength'),
	('REL0008', 'rerr', 'rrr', '', '', '', '', '', '', '', 'default.png', NULL, 'rrrrr', '', 'fffff'),
	('REL0009', 'anakpon', 'prathanrach', '0882238977', '0882238977', '808/315', 'pahonyothin', 'coocot', 'lumlukka', 'pathumtani', 'default.png', NULL, '123456', 'frenchkiss', 'fahn-frenchkiss@msn.com'),
	('REL0010', '', '', '', '', '', '', '', '', '', 'default.png', NULL, '', '', '');
/*!40000 ALTER TABLE `relative` ENABLE KEYS */;


-- Dumping structure for table alzdpu.result
CREATE TABLE IF NOT EXISTS `result` (
  `ResultID` int(11) NOT NULL,
  `ResultScore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ResultID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table alzdpu.result: ~1 rows (approximately)
DELETE FROM `result`;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` (`ResultID`, `ResultScore`) VALUES
	(1, 4);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
