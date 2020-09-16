/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.1.46-MariaDB : Database - st_n26_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`st_n26_blog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `st_n26_blog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `cateItemId` int(10) unsigned NOT NULL,
  `memberId` int(10) NOT NULL,
  `hit` int(100) NOT NULL,
  `displayStatus` tinyint(1) unsigned NOT NULL,
  `title` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`cateItemId`,`memberId`,`hit`,`displayStatus`,`title`,`body`) values 
(2,'2020-06-30 12:23:03','2020-06-30 12:23:03',1,1,10,1,'게시판 기능 실행?','# 게시판을 생성하여 게시물을 올림\r\n## SQL 이용하는데.. 어? 이게 되네?\r\n- 실행되는것에 대한 의문이 품어지지는데 되긴 함.\r\n- 마크다운 어렵다 흑흑\r\n- 토스트 라이브러리 설치 해서 글작성 해보고싶다\r\n- 수정/삭제 기능도 만들어야함.. 언제? (모름)'),
(6,'2020-07-01 09:47:18','2020-07-01 09:47:18',2,1,0,1,'IT/JAVA 카테고리임','게시물 10개만들어야함;;; 언제만들어\r\n\r\n<자바 기초 5강>\r\n 1강 : 출력문, 변수, 상수, 데이터타입\r\n 2강 : 제어문(if/switch)&반복문\r\n 3강 : 클래스/메소드\r\n 4강 : 배열(array)\r\n 5강 : 매개변수 & 생성자'),
(7,'2020-07-01 09:48:38','2020-07-01 09:48:38',2,1,0,1,'java 게시판 블로그 페이징 힌트','# 페이징 카테고리별 분류\r\n## 힌트(http://localhost:8081/blog/s/article/list?cateItemId=1&page=2)\r\n ### 코드1\r\n   - SELECT COUNT(*) FROM article WHERE cateLtemId = 2\r\n ### 코드2\r\n   - int temsLnApage = 5; //한페이지에 나오는 게시물 수\r\n   - int limitFrom = (page - 1) * itemsInApage;\r\n ### 코드3\r\n   - int totalPage = Math.ceil((double)totalCount/itemsInApage);\r\n```html\r\n <a href=\"${pageCountext.request.contextPath}/s/article?cateItemId={$param.cateItemId}&page=<%=i%>\"></a>\r\n```'),
(12,'2020-07-01 13:00:53','2020-07-01 13:00:53',4,1,10,1,'IT/ETC 게시판','ETC 게시판입니다. 정보를 넣어주세요.'),
(15,'2020-07-02 11:36:05','2020-07-02 11:36:05',3,1,0,1,'IT/정보 카테고리임','정보 관련해서 글 작성해주시기 바랍니다.'),
(16,'2020-07-02 11:36:36','2020-07-02 11:36:36',4,1,2,1,'IT/ECT 카테고리임','IT 관련 기타 사항글을 작성해주시기 바랍니다. '),
(17,'2020-07-02 11:37:58','2020-07-02 11:37:58',5,1,1,1,'HTML/CSS 카테고리임','HTML/CSS 관련 게시글을 작성해주시기 바랍니다.\r\n![이미지](https://poiemaweb.com/img/html5.png)'),
(18,'2020-07-02 11:38:14','2020-07-02 11:38:14',6,1,1,1,'Design 카테고리임','디자인 참고자료를 넣어주시기 바랍니다.\r\n\r\n```youtube\r\n_2LLXnUdUIc?max-width=800\r\n```\r\n![이미지](https://ppss.kr/wp-content/uploads/2015/12/1_title-540x326.png)'),
(31,'2020-07-07 09:58:48','2020-07-07 09:58:48',2,1,2,1,'자바 기초 공부(repl확인)','```repl\r\nhttps://repl.it/@dodobird1294/jjag3#Main.java\r\n```'),
(32,'2020-07-07 10:00:24','2020-07-07 10:00:24',5,1,4,1,'코드펜 실행 확인','```codepen\r\nhttps://codepen.io/ruddnr88/embed/pogWyMK\r\n```'),
(33,'2020-07-07 12:37:25','2020-07-07 12:37:25',2,1,5,1,'[자바 기초 1강] 출력문,변수,상수,데이터타입','# [자바 기초 1강] 출력문, 변수, 상수, 데이터타입\r\n## 1. 출력문\r\n- hello world! 를 출력해보자!\r\n```java\r\nSystem.out.println(\"Hello World!\");\r\n```\r\n자바의 문장 끝에는 글을 쓸때 마침표를 찍듯이, **세미콜론(;)** 을 붙여 문장의 끝을 알린다. \r\n\r\n\r\n자바의 기초 문법. console 에 Hello world를 출력할수 있다. \r\n정수를 출력하려면  **\" \"** 없이 숫자만 입력하면된다. \r\n```java\r\nSystem.out.println(10);\r\n```\r\n\r\n### 2. 변수\r\n\r\n자바는 변수를 선언할수 있다.\r\n변수는 말 그대로, 변하는 수를 말하며 유동적으로 변할 수있다.\r\n\r\n변수타입과 변수명은 한번만 사용하면 되고, 다음 변수명을 사용할때는 변수타입은 생략이 가능하다.\r\n\r\n자바의 흐름은 항상 위에서 아래로 흘러간다. \r\n```java\r\nint a = 10;\r\nint b = 20;\r\n\r\na = b;\r\n```\r\na는 10과 같다. \r\n*하지만 10은 a가 아니다.*\r\n자바에서 **\'=\'** 의 왼쪽과 오른쪽은 같아 보이지만 같은 취급을 하면 안된다.\r\n왼쪽->오른쪽으로 흘러가듯 문장을 읽어야한다. \r\n\r\n이렇게 실행하게 되면 a는 처음엔 10이었다가 나중에 b의 값인 20이 된다. \r\n\r\n\r\n## 3. 상수\r\n상수는 절대 변하지 않을 값을 말한다. **final** 은 상수선언을 말한다. 원주율은 절대 변하지 않는 값이니 상수값을 줄 수 있다.  \r\n\r\n```java\r\nfinal double PI = 3.141592;\r\n```\r\n\r\n\r\n## 4. 데이터타입\r\n\r\n### 기본 타입\r\n - 정수타입\r\n    - byte : 8bit 이내의 숫자\r\n    - char : 16bit의 유니코드를 포함한 숫자(혹은 문자)\r\n    - short : 16bit 이내의 숫자\r\n    - int : 32bit 사이의 숫자\r\n    - long : 64bit 사이의 숫자\r\n - 실수\r\n    - float : 32비트 사이의 소수\r\n    - double : 8bit 크기의 소수\r\n - 논리\r\n    - boolean : 참/거짓만 가진 명제(true/false)\r\n \r\n- 문자열\r\n   - char 형 : 문자열\r\n   - String : char형이 모인 것\r\n\r\n  '),
(34,'2020-07-16 09:15:59','2020-07-16 09:15:59',1,1,59,1,'맴버 아이디 2번 글 작성되는지 확인하는중','아 근데 작성자 닉네임/이름은 어떻게 받아와야할까..'),
(35,'2020-07-16 09:26:49','2020-07-16 09:28:32',1,1,304,1,'◎ 해야할 일','# 작성자 출력 힌트\r\n```java\r\nint id = 4; // 4번 글의 번호\r\nSecsql sql = SecSql.from(\"SELECT A.*\");\r\nsql.append(\", M.name AS extra__writer\");\r\nsql.append(\"FROM article AS A\");\r\nsql.append(\"INNER JOIN member AS M\");\r\nsql.append(\"WHERE A.displayStatus = 1\");\r\nsql.append(\"AND A.id = ?, id\");\r\n\r\nArticle article = new Article(DBUtil.getRow(dbConn,sql));\r\nSystem.out.println(article.getExtra().get(\"writer\")); //작성자 나옴\r\n``` \r\n\r\n## 만들어야 할 기능 리스트\r\n1. 회원가입,로그인,로그아웃,비번을 자바스크립트로 해싱\r\n2. 글 본문, 수정, 작성 때  아래 적용\r\n ```java\r\n <script type=\"text/x-template\"></script>\r\n getBodyForXTemplate()\r\n ```\r\n3 글, 댓글 작성시 현재 로그인 한 회원의 회원번호가 memberId로 저장되도록 처리\r\n4.글,댓글의 수정/삭제는 본인만 가능하도록 수정\r\n5.글 리스트,댓글리스트에 해당글의 작성자의 닉네임이 표시되도록 처리\r\n6.로그인,로그아웃관련해서 가드 적용, 강사가 만들어놓은 코드 복붙'),
(37,'2020-07-20 12:06:26','2020-07-20 12:06:26',1,1,30,1,'김영희가 글을 써봅니다..','# 확인하기 위해서\r\n# 멤버 번호 3번임\r\n# 영희임! ㅎ'),
(38,'2020-07-20 12:31:19','2020-07-20 12:31:19',1,1,17,1,'테스트 작성자는 김철수입니다.','# 와우ㅏ우ㅏㅇ'),
(39,'2020-07-20 12:31:44','2020-07-20 12:31:44',1,1,63,1,'글작성자 임꺽정임 :)','# 테스트 하는 중입니다.'),
(40,'2020-07-20 13:14:14','2020-07-23 11:48:54',1,1,124,1,'◎ 200720 목표(메일전송하기)','# 이메일 발송\r\n - Gmail\r\n - 비번찾기\r\n    - 임시비번 발송방식\r\n    -  로그인아이디, 이메일,이름 입력 후 일치하는 회원이 있다면 임시패스워드발송\r\n - 아이디찾기\r\n - 이메일미인증시 로그인 방지\r\n -  가입환영메일\r\n -  관련검색어\r\n    - java sha256\r\n\r\n\r\n[정답](https://github.com/jhs512/servlet-mail.git){: target=\"_blank\"}\r\n\r\n  - 내용\r\n     - gitignore 구성\r\n     -  web.xml 에 데이터 넣은 후 받아오는 방법\r\n     -  메일 발송하는 방법\r\n     -  **주의사항**:파일명변경 \r\n```java\r\nWebContent/WEB-INF/web.xml.sample=>WebContent/WEB-INF/web.xml\r\n```\r\n\r\n\r\n\r\n### SMPP ? 이거 사용해야함?'),
(42,'2020-07-24 12:39:02','2020-07-24 12:39:02',4,9,137,1,'안녕하십니까~','도장깨러 왔습니다~~\r\n\r\n회원가입 로그인 다 잘되네요 ㅎㅎ'),
(55,'2020-07-27 10:17:58','2020-07-27 11:45:31',1,1,138,1,'◎ 추가 하고싶은것','# 추가하고싶은것\r\n- 상세페이지 다음글/이전글\r\n- 리스트 페이징\r\n- 댓글 페이징');

/*Table structure for table `articleReply` */

DROP TABLE IF EXISTS `articleReply`;

CREATE TABLE `articleReply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `articleReply` */

insert  into `articleReply`(`id`,`regDate`,`updateDate`,`body`,`articleId`,`memberId`) values 
(5,'2020-07-16 09:33:21','2020-07-16 09:33:21','홍길동의 댓글~',1,2),
(6,'2020-07-16 09:33:46','2020-07-16 09:33:46','admin의 댓글~',1,1),
(7,'2020-07-16 09:36:08','2020-07-16 09:36:08','34',1,1),
(8,'2020-07-16 09:42:22','2020-07-16 09:42:22','333',1,1),
(9,'2020-07-16 09:47:28','2020-07-16 09:47:28','ㅇㄹ',35,1),
(13,'2020-07-16 10:22:10','2020-07-16 10:22:10','WWWWW',1,1),
(14,'2020-07-16 10:22:18','2020-07-16 10:22:18','ㅉㅉㅉㅉㅉ',1,1),
(17,'2020-07-16 11:04:31','2020-07-16 11:04:31','3434',1,1),
(20,'2020-07-16 11:15:18','2020-07-16 11:15:18','erer',2,1),
(23,'2020-07-16 11:29:27','2020-07-16 11:29:27','ㄷㄱㄷㄱㄷㄱ',35,1),
(24,'2020-07-16 11:29:31','2020-07-16 11:29:31','ㅅㅅㄳㄳㄱ',35,1),
(26,'2020-07-16 12:01:26','2020-07-16 12:01:26','2525543343',34,1),
(27,'2020-07-16 12:01:30','2020-07-16 12:01:30','24525245534',34,1),
(29,'2020-07-17 14:04:39','2020-07-17 14:04:39','ㅇㅇㅇㅇ',1,1),
(30,'2020-07-20 09:20:25','2020-07-20 09:20:25','dfdfdf',35,1),
(31,'2020-07-20 09:20:37','2020-07-20 09:20:37','와아아라아',35,1),
(32,'2020-07-20 09:20:55','2020-07-20 09:20:55','ㄱㄱㄷㄳㄷㄳㄷㅅ',34,1),
(34,'2020-07-20 10:31:18','2020-07-20 10:31:18','34343',35,2),
(35,'2020-07-20 10:34:13','2020-07-20 10:34:13','34',35,2),
(36,'2020-07-20 10:34:48','2020-07-20 10:34:48','3434',35,2),
(38,'2020-07-20 12:06:34','2020-07-20 12:06:34','닉네임이 나오도록 해야겠다.',37,3),
(39,'2020-07-20 12:15:50','2020-07-20 12:15:50','댓글닉네임?',37,4),
(40,'2020-07-20 12:16:31','2020-07-20 12:16:31','아직 수정은 불가능함.',37,4),
(41,'2020-07-20 12:31:54','2020-07-20 12:31:54','댓글은 닉네임으로 나옴',39,5),
(42,'2020-07-20 12:32:16','2020-07-20 12:32:16','작성자만 삭제/수정 할 수있게 나옴..',39,5),
(43,'2020-07-20 12:33:31','2020-07-20 12:33:31','안녕하세요???????',39,4),
(44,'2020-07-20 12:33:46','2020-07-20 12:33:46','테스트 중입니다!!!!!',39,4),
(46,'2020-07-20 12:42:43','2020-07-20 12:42:43','sdfsfsdf',39,3),
(47,'2020-07-20 13:27:48','2020-07-21 11:27:02','안녕하세요^^^',39,1),
(49,'2020-07-21 09:25:58','2020-07-26 16:20:50','모바일에서 댓글수정해봄.창이 새로뜨네??',40,1),
(50,'2020-07-21 11:35:01','2020-07-21 11:35:01','철수님이 댓글을 작성하셨습니다^^',38,4),
(51,'2020-07-21 11:35:07','2020-07-21 11:35:07','어휴.. 어렵다 어려워',38,4),
(52,'2020-07-21 11:35:21','2020-07-21 11:35:21','화이팅!',40,4),
(53,'2020-07-21 11:35:26','2020-07-21 12:22:09','댓글 수정?',40,4),
(54,'2020-07-23 10:48:06','2020-07-23 10:48:14','알아서 사용하시길~~~~ 알겟서용!',41,1),
(55,'2020-07-24 13:02:29','2020-07-24 13:02:29','직접 회원가입을 했습니다 ㅎㅎ',41,9),
(56,'2020-07-26 19:51:33','2020-07-27 09:16:53','수정한번 해봄!',41,1),
(57,'2020-07-27 09:17:11','2020-07-27 09:24:40','댓글! 수정111144',41,1),
(58,'2020-07-27 10:23:47','2020-07-27 10:23:47','ㅇㅇㄹㅇㄹㅇ',55,1),
(59,'2020-07-27 10:23:54','2020-07-30 12:01:58','댓글 나오는지 테스트중 수정시간확인?',55,1),
(63,'2020-07-27 13:59:01','2020-07-27 13:59:32','삭제수정 소소솟',55,2),
(64,'2020-07-29 09:29:17','2020-07-29 09:29:23','댓글 수정테스트1',55,3);

/*Table structure for table `attr` */

DROP TABLE IF EXISTS `attr`;

CREATE TABLE `attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `relTpyeCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `typeCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `type2Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `attr` */

/*Table structure for table `cateItem` */

DROP TABLE IF EXISTS `cateItem`;

CREATE TABLE `cateItem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cateItem` */

insert  into `cateItem`(`id`,`regDate`,`updateDate`,`name`) values 
(1,'2020-09-15 10:48:36','0000-00-00 00:00:00','Dairy'),
(2,'2020-09-15 10:48:36','0000-00-00 00:00:00','JAVA'),
(3,'2020-09-15 10:48:36','0000-00-00 00:00:00','정보'),
(4,'2020-09-15 10:48:36','0000-00-00 00:00:00','ETC'),
(5,'2020-09-15 10:48:36','0000-00-00 00:00:00','HTML/CSS'),
(6,'2020-09-15 10:48:36','0000-00-00 00:00:00','Design');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `delStatus` datetime NOT NULL,
  `delDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `loginId` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `loginPw` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`delStatus`,`delDate`,`updateDate`,`name`,`loginId`,`loginPw`,`nickname`,`email`,`level`) values 
(1,'2020-07-28 10:06:59','0000-00-00 00:00:00','0000-00-00 00:00:00','2020-07-28 10:06:59','관리자','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','관리자','ere@ere',10),
(2,'2020-07-20 12:12:16','0000-00-00 00:00:00','0000-00-00 00:00:00','2020-07-20 12:12:16','임꺽정','4444','79f06f8fde333461739f220090a23cb2a79f6d714bee100d0e4b4af249294619','꺾꺾','35@d',0),
(3,'2020-07-22 11:50:10','0000-00-00 00:00:00','2020-07-29 10:32:07','2020-07-22 11:50:10','1414','1414','afbfb89027a4dae87c6033eaa07896e93f3f1ddc2214ca43658982e8aa74b4d4','1414','dodobird1294@gmail.com',0),
(4,'2020-07-22 13:07:42','0000-00-00 00:00:00','0000-00-00 00:00:00','2020-07-22 13:07:42','김철수','1234','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','스틸워터','rkou1211@gmail.com',0),
(9,'2020-07-24 12:34:22','0000-00-00 00:00:00','0000-00-00 00:00:00','2020-07-24 12:34:22','이정한','duzzy1202','6115370ab890b1fe7f194c183bd10ef038d2d7ed8cc323000076516fdab2d37d','도장깨기','duzzy1202@gmail.com',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
