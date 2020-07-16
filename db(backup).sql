/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.1.45-MariaDB : Database - site26
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`site26` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `site26`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `cateItemId` int(10) unsigned NOT NULL,
  `displayStatus` tinyint(1) unsigned NOT NULL,
  `title` char(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` int(100) NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`cateItemId`,`displayStatus`,`title`,`body`,`hit`,`memberId`) values 
(1,'2020-06-30 12:18:46','2020-06-30 12:18:46',1,1,'블로그를 개설하였읍니다?','# 블로그 처음으로 개설하였읍니다.. 잘부탁드려요?‍♀\r\n## 운영내용 자바로 인한 서블릿으로 운영\r\n```sql\r\nDROP DATABASE IF EXISTS blog;\r\nCREATE DATABASE blog;\r\nUSE blog;\r\n```\r\n- 웹개발자로써 필요기능 만들어서 운영해봄.\r\n- 될수있는 한 할수있는 모든 기능을 구현하려고 함\r\n\r\n### 자바 로고가 커피인 이유는 개발자가 자바커피마시다가 이름지었기 때문.\r\n### 원래 다른이름 하려했는데 저작권있었음.\r\n![자바](http://wiki.hash.kr/images/thumb/b/bb/%EC%9E%90%EB%B0%94_%EB%A1%9C%EA%B3%A0.png/200px-%EC%9E%90%EB%B0%94_%EB%A1%9C%EA%B3%A0.png)',13,1),
(2,'2020-06-30 12:23:03','2020-06-30 12:23:03',1,1,'게시판 기능 실행?','# 게시판을 생성하여 게시물을 올림\r\n## SQL 이용하는데.. 어? 이게 되네?\r\n- 실행되는것에 대한 의문이 품어지지는데 되긴 함.\r\n- 마크다운 어렵다 흑흑\r\n- 토스트 라이브러리 설치 해서 글작성 해보고싶다\r\n- 수정/삭제 기능도 만들어야함.. 언제? (모름)',6,1),
(6,'2020-07-01 09:47:18','2020-07-01 09:47:18',2,1,'IT/JAVA 카테고리임','게시물 10개만들어야함;;; 언제만들어\r\n\r\n<자바 기초 5강>\r\n 1강 : 출력문, 변수, 상수, 데이터타입\r\n 2강 : 제어문(if/switch)&반복문\r\n 3강 : 클래스/메소드\r\n 4강 : 배열(array)\r\n 5강 : 매개변수 & 생성자',0,1),
(7,'2020-07-01 09:48:38','2020-07-01 09:48:38',2,1,'java 게시판 블로그 페이징 힌트','# 페이징 카테고리별 분류\r\n## 힌트(http://localhost:8081/blog/s/article/list?cateItemId=1&page=2)\r\n ### 코드1\r\n   - SELECT COUNT(*) FROM article WHERE cateLtemId = 2\r\n ### 코드2\r\n   - int temsLnApage = 5; //한페이지에 나오는 게시물 수\r\n   - int limitFrom = (page - 1) * itemsInApage;\r\n ### 코드3\r\n   - int totalPage = Math.ceil((double)totalCount/itemsInApage);\r\n```html\r\n <a href=\"${pageCountext.request.contextPath}/s/article?cateItemId={$param.cateItemId}&page=<%=i%>\"></a>\r\n```',0,1),
(12,'2020-07-01 13:00:53','2020-07-01 13:00:53',4,1,'IT/ETC 게시판','ETC 게시판입니다. 정보를 넣어주세요.',1,1),
(15,'2020-07-02 11:36:05','2020-07-02 11:36:05',3,1,'IT/정보 카테고리임','정보 관련해서 글 작성해주시기 바랍니다.',0,1),
(16,'2020-07-02 11:36:36','2020-07-02 11:36:36',4,1,'IT/ECT 카테고리임','IT 관련 기타 사항글을 작성해주시기 바랍니다. ',0,1),
(17,'2020-07-02 11:37:58','2020-07-02 11:37:58',5,1,'HTML/CSS 카테고리임','HTML/CSS 관련 게시글을 작성해주시기 바랍니다.\r\n![이미지](https://poiemaweb.com/img/html5.png)',1,1),
(18,'2020-07-02 11:38:14','2020-07-02 11:38:14',6,1,'Design 카테고리임','디자인 참고자료를 넣어주시기 바랍니다.\r\n\r\n```youtube\r\n_2LLXnUdUIc?max-width=800\r\n```\r\n![이미지](https://ppss.kr/wp-content/uploads/2015/12/1_title-540x326.png)',0,1),
(31,'2020-07-07 09:58:48','2020-07-07 09:58:48',2,1,'자바 기초 공부(repl확인)','```repl\r\nhttps://repl.it/@dodobird1294/jjag3#Main.java\r\n```',1,1),
(32,'2020-07-07 10:00:24','2020-07-07 10:00:24',5,1,'코드펜 실행 확인','```codepen\r\nhttps://codepen.io/ruddnr88/embed/pogWyMK\r\n```',1,1),
(33,'2020-07-07 12:37:25','2020-07-07 12:37:25',2,1,'[자바 기초 1강] 출력문,변수,상수,데이터타입','# [자바 기초 1강] 출력문, 변수, 상수, 데이터타입\r\n## 1. 출력문\r\n- hello world! 를 출력해보자!\r\n```java\r\nSystem.out.println(\"Hello World!\");\r\n```\r\n자바의 문장 끝에는 글을 쓸때 마침표를 찍듯이, **세미콜론(;)** 을 붙여 문장의 끝을 알린다. \r\n\r\n\r\n자바의 기초 문법. console 에 Hello world를 출력할수 있다. \r\n정수를 출력하려면  **\" \"** 없이 숫자만 입력하면된다. \r\n```java\r\nSystem.out.println(10);\r\n```\r\n\r\n### 2. 변수\r\n\r\n자바는 변수를 선언할수 있다.\r\n변수는 말 그대로, 변하는 수를 말하며 유동적으로 변할 수있다.\r\n\r\n변수타입과 변수명은 한번만 사용하면 되고, 다음 변수명을 사용할때는 변수타입은 생략이 가능하다.\r\n\r\n자바의 흐름은 항상 위에서 아래로 흘러간다. \r\n```java\r\nint a = 10;\r\nint b = 20;\r\n\r\na = b;\r\n```\r\na는 10과 같다. \r\n*하지만 10은 a가 아니다.*\r\n자바에서 **\'=\'** 의 왼쪽과 오른쪽은 같아 보이지만 같은 취급을 하면 안된다.\r\n왼쪽->오른쪽으로 흘러가듯 문장을 읽어야한다. \r\n\r\n이렇게 실행하게 되면 a는 처음엔 10이었다가 나중에 b의 값인 20이 된다. \r\n\r\n\r\n## 3. 상수\r\n상수는 절대 변하지 않을 값을 말한다. **final** 은 상수선언을 말한다. 원주율은 절대 변하지 않는 값이니 상수값을 줄 수 있다.  \r\n\r\n```java\r\nfinal double PI = 3.141592;\r\n```\r\n\r\n\r\n## 4. 데이터타입\r\n\r\n### 기본 타입\r\n - 정수타입\r\n    - byte : 8bit 이내의 숫자\r\n    - char : 16bit의 유니코드를 포함한 숫자(혹은 문자)\r\n    - short : 16bit 이내의 숫자\r\n    - int : 32bit 사이의 숫자\r\n    - long : 64bit 사이의 숫자\r\n - 실수\r\n    - float : 32비트 사이의 소수\r\n    - double : 8bit 크기의 소수\r\n - 논리\r\n    - boolean : 참/거짓만 가진 명제(true/false)\r\n \r\n- 문자열\r\n   - char 형 : 문자열\r\n   - String : char형이 모인 것\r\n\r\n  ',3,1),
(34,'2020-07-16 09:15:59','2020-07-16 09:15:59',1,1,'맴버 아이디 2번 글 작성되는지 확인하는중','아 근데 작성자 닉네임/이름은 어떻게 받아와야할까..',38,2),
(35,'2020-07-16 09:26:49','2020-07-16 09:28:32',1,1,'◎ 해야할 일','# 작성자 출력 힌트\r\n```java\r\nint id = 4; // 4번 글의 번호\r\nSecsql sql = SecSql.from(\"SELECT A.*\");\r\nsql.append(\", M.name AS extra__writer\");\r\nsql.append(\"FROM article AS A\");\r\nsql.append(\"INNER JOIN member AS M\");\r\nsql.append(\"WHERE A.displayStatus = 1\");\r\nsql.append(\"AND A.id = ?, id\");\r\n\r\nArticle article = new Article(DBUtil.getRow(dbConn,sql));\r\nSystem.out.println(article.getExtra().get(\"writer\")); //작성자 나옴\r\n``` \r\n\r\n## 만들어야 할 기능 리스트\r\n1. 회원가입,로그인,로그아웃,비번을 자바스크립트로 해싱\r\n2. 글 본문, 수정, 작성 때  아래 적용\r\n ```java\r\n <script type=\"text/x-template\"></script>\r\n getBodyForXTemplate()\r\n ```\r\n3 글, 댓글 작성시 현재 로그인 한 회원의 회원번호가 memberId로 저장되도록 처리\r\n4.글,댓글의 수정/삭제는 본인만 가능하도록 수정\r\n5.글 리스트,댓글리스트에 해당글의 작성자의 닉네임이 표시되도록 처리\r\n6.로그인,로그아웃관련해서 가드 적용, 강사가 만들어놓은 코드 복붙',196,1);

/*Table structure for table `articleReply` */

DROP TABLE IF EXISTS `articleReply`;

CREATE TABLE `articleReply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `articleReply` */

insert  into `articleReply`(`id`,`regDate`,`updateDate`,`articleId`,`memberId`,`body`) values 
(5,'2020-07-16 09:33:21','2020-07-16 09:33:21',0,2,'홍길동의 댓글~'),
(6,'2020-07-16 09:33:46','2020-07-16 09:33:46',0,1,'admin의 댓글~'),
(7,'2020-07-16 09:36:08','2020-07-16 09:36:08',0,1,'34'),
(8,'2020-07-16 09:42:22','2020-07-16 09:42:22',0,1,'333'),
(9,'2020-07-16 09:47:28','2020-07-16 09:47:28',35,1,'ㅇㄹ'),
(13,'2020-07-16 10:22:10','2020-07-16 10:22:10',1,1,'WWWWW'),
(14,'2020-07-16 10:22:18','2020-07-16 10:22:18',1,1,'ㅉㅉㅉㅉㅉ'),
(17,'2020-07-16 11:04:31','2020-07-16 11:04:31',1,1,'3434'),
(20,'2020-07-16 11:15:18','2020-07-16 11:15:18',2,1,'erer'),
(23,'2020-07-16 11:29:27','2020-07-16 11:29:27',35,1,'ㄷㄱㄷㄱㄷㄱ'),
(24,'2020-07-16 11:29:31','2020-07-16 11:29:31',35,1,'ㅅㅅㄳㄳㄱ'),
(26,'2020-07-16 12:01:26','2020-07-16 12:01:26',34,1,'2525543343'),
(27,'2020-07-16 12:01:30','2020-07-16 12:01:30',34,1,'24525245534'),
(28,'2020-07-16 12:31:44','2020-07-16 12:31:44',35,1,'ddfdfd');

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `code` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `board` */

/*Table structure for table `cateItem` */

DROP TABLE IF EXISTS `cateItem`;

CREATE TABLE `cateItem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cateItem` */

insert  into `cateItem`(`id`,`regDate`,`name`) values 
(1,'2020-07-10 13:11:59','Dairy'),
(2,'2020-07-10 13:11:59','JAVA'),
(3,'2020-07-10 13:11:59','정보'),
(4,'2020-07-10 13:11:59','ETC'),
(5,'2020-07-10 13:11:59','HTML/CSS'),
(6,'2020-07-10 13:11:59','Design');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginId` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginPw` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`name`,`loginId`,`loginPw`,`nickname`,`email`,`level`) values 
(1,'2020-07-15 13:20:46','2020-07-15 13:20:46','노경욱','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin@admin.com',10),
(2,'2020-07-15 13:44:52','2020-07-15 13:44:52','홍길동','1111','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c','길동\'S','23@ddf',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
