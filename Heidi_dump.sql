-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQkihun0227L_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- suamil_db 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `kihun0227`;
CREATE DATABASE IF NOT EXISTS `kihun0227` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kihun0227`;

-- 테이블 suamil_db.bbs 구조 내보내기
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE IF NOT EXISTS `bbs` (
  `num` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bbs테이블';

-- 테이블 데이터 suamil_db.bbs:~0 rows (대략적) 내보내기
DELETE FROM `bbs`;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;

-- 테이블 suamil_db.board 구조 내보내기
DROP TABLE IF EXISTS `board`;kihun0227kihun0227
CREATE TABLE IF NOT EXISTS `board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `id` varchar(30) NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `visitcount` mediumint(10) NOT NULL DEFAULT 0,
  `bname` varchar(100) NOT NULL,
  `sfile` varchar(100) DEFAULT NULL,
  `ofile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.board:~18 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`num`, `title`, `content`, `id`, `postdate`, `visitcount`, `bname`, `sfile`, `ofile`) VALUES
	(1, '테스트1', '테스트1', 'tid', '2020-06-08 03:35:19', 4, 'freeboard', NULL, NULL),
	(2, '바뀐테스트ㅋㅋ', '바뀐테스트ㅋㅋ', 'tid', '2020-06-08 03:35:28', 18, 'freeboard', NULL, NULL),
	(3, '테스트3333333', '테스트3테스트3테스트3테스트3테스트3테스트3', 'tid', '2020-06-08 03:35:34', 26, 'notice', NULL, NULL),
	(6, '테스트4', '테스트4', 'tid', '2020-06-08 04:28:00', 1, 'freeboard', NULL, NULL),
	(7, '테스트5', '테스트5', 'tid', '2020-06-08 04:28:05', 0, 'freeboard', NULL, NULL),
	(8, '테스트6', '테스트6', 'tid', '2020-06-08 04:28:14', 0, 'freeboard', NULL, NULL),
	(9, '테스트7', '테스트7', 'tid', '2020-06-08 04:28:23', 10, 'freeboard', NULL, NULL),
	(10, '테스트8', '테스트8', 'tid', '2020-06-08 04:28:31', 30, 'freeboard', NULL, NULL),
	(11, '테스트9', '테스트9', 'tid', '2020-06-08 04:28:38', 0, 'freeboard', NULL, NULL),
	(12, '테스트10', '테스트10', 'tid', '2020-06-08 04:28:42', 1, 'freeboard', NULL, NULL),
	(13, '테스트11', '테스트11\r\n', 'tid', '2020-06-08 04:29:03', 7, 'freeboard', NULL, NULL),
	(14, '테스트12', '테스트12', 'tid', '2020-06-08 04:29:09', 10, 'freeboard', NULL, NULL),
	(15, '매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목', '매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴내용', 'tid', '2020-06-08 05:24:14', 0, 'freeboard', NULL, NULL),
	(16, '매매매매매매매매매매매매매매매매우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목', '매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목매매매매매매매매매매매매매매매매매매우우우우우우우우우우우우우우긴제목', 'tid', '2020-06-08 05:24:31', 1, 'freeboard', NULL, NULL),
	(18, 'editTest23', 'ㄴㅁㄹㄴㅁㄹ', 'tid', '2020-06-08 06:30:36', 1, 'freeboard', NULL, NULL),
	(19, 'ㅇㅇㅇㅇ', 'ㅁㄴㅇㄴㅁㅇ', 'tid', '2020-06-08 08:29:33', 0, 'freeboard', NULL, NULL),
	(20, '24번째 테스트', '2424242424', 'tid', '2020-06-08 09:40:02', 2, 'infoboard', '2020_06_08_9_40_2_939.png', 'KakaoTalk_20200518_104422840.png'),
	(21, '25번째 테스트', '25번째 테스트입니다', 'tid', '2020-06-08 10:31:07', 1, 'infoboard', '2020_06_08_10_31_7_434.png', 'KakaoTalk_20200518_104422840.png');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 suamil_db.membership 구조 내보내기
DROP TABLE IF EXISTS `membership`;
CREATE TABLE IF NOT EXISTS `membership` (
  `name` varchar(100) DEFAULT NULL,
  `id` varchar(100) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원관리용 테이블';

-- 테이블 데이터 suamil_db.membership:~17 rows (대략적) 내보내기
DELETE FROM `membership`;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` (`name`, `id`, `pass`, `tel`, `mobile`, `email`, `addr`, `zip`, `date`) VALUES
	('', '', '', '-', '--', '@', ' ', '', '2020-06-05 22:22:29'),
	('123', '123', '123', '123', '123', '', '', NULL, '2020-06-05 14:33:25'),
	('성기훈', 'asdsad123', 'asdsad123', '031-1254', '141-5332-2352', 'asdsad123@netian.com', '경기 성남시 분당구 대왕판교로 477 낙생고등학교asdsad123', '13480', '2020-06-05 18:04:26'),
	('확인함', 'check33', 'check33', 'wqa-wqrw', 'zxs-4141-1351', 'check33@dreamwiz.com', '제주특별자치도 제주시 구릉동산길 13 check33', NULL, '2020-06-05 16:47:54'),
	('dsgshsg', 'dsgshsg123', 'dsgshsg123', '164-6548', '472-1256-1451', 'dsgshsg123@netian.com', '경기 성남시 분당구 내정로 54 한솔마을주공6단지아파트dsgshsg123', NULL, '2020-06-05 16:44:53'),
	('이은석', 'health1', 'health1', '02 - 1234', '017 - 5646 - 2123', 'health@', '서울 구로구 신도림로3길 8 헬창나라', NULL, '2020-06-05 16:20:35'),
	('제임스', 'james12', 'james12', '124-5236', '421-5478-5415', 'james12@sayclub.com', '경기 성남시 분당구 대왕판교로 477 낙생고등학교', '13480', '2020-06-05 16:52:34'),
	('섬주민', 'jeju123', 'jeju123', '0311234', '01098765432', 'jeju123', '제주특별자치도 서귀포시 가가로 14섬나라섬나라', NULL, '2020-06-05 16:18:14'),
	('성기훈', 'kihun0227', '2525', '02-312-3581', '010-3936-3581', 'kihun0227@gmail.com', '이대앞', NULL, '2020-06-05 12:36:03'),
	('이동건건', 'movemove2', 'movemove2', '031-1231', '222-2222-2222', 'movemove2@netian.com', '제주특별자치도 서귀포시 가가로 14 movemove2', NULL, '2020-06-05 16:40:25'),
	('이동건', 'moving1', 'moving1', '051-1234', '019-2345-3678', 'moving1@', '경기 성남시 분당구 판교역로 4 moving1', NULL, '2020-06-05 16:39:05'),
	('제발돼라', 'plzplz123', 'plzplz123', '777-7777', '888-8888-8888', 'plzplz123@', '대구 남구 대덕로 141 plzplz123', NULL, '2020-06-05 16:42:48'),
	('이창호', 'progamer12', 'progamer12', '111-4444', '555-5555-5555', 'progamer12@', '경기 성남시 분당구 경부고속도로 409 progamer12', NULL, '2020-06-05 16:41:41'),
	('박정날', 'qwer123a', 'qwer123a', '164-54e8', '623-5412-2523', 'qwer123a@', '경기 성남시 분당구 경부고속도로 409 qwer123a', NULL, '2020-06-05 16:45:51'),
	('tname', 'tid', '1234', 'ttel', 'tmobile', 'temail', 'taddr', NULL, '2020-06-05 12:36:03'),
	('선풍기', 'tjsvndrl1', 'tjsvndrl1', '356-t43w', '513-2535-5235', 'tjsvndrl1@nate.com', '제주특별자치도 제주시 첨단로 12  tjsvndrl1', NULL, '2020-06-05 16:47:11'),
	('머냐고', 'what456', 'what456', '123-2342', '654-4364-1541', 'what456@', '제주특별자치도 제주시 감수북길 24-1 what456', NULL, '2020-06-05 16:43:58');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
membership