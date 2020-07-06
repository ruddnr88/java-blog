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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`cateItemId`,`displayStatus`,`title`,`body`) values 
(1,'2020-06-30 12:18:46','2020-06-30 12:18:46',1,1,'블로그를 개설하였읍니다?','# 블로그 처음으로 개설하였읍니다.. 잘부탁드려요?‍♀\r\n## 운영내용 자바로 인한 서블릿으로 운영\r\n```sql\r\nDROP DATABASE IF EXISTS blog;\r\nCREATE DATABASE blog;\r\nUSE blog;\r\n```\r\n- 웹개발자로써 필요기능 만들어서 운영해봄.\r\n- 될수있는 한 할수있는 모든 기능을 구현하려고 함\r\n\r\n### 자바 로고가 커피인 이유는 개발자가 자바커피마시다가 이름지었기 때문.\r\n### 원래 다른이름 하려했는데 저작권있었음.\r\n![자바](http://wiki.hash.kr/images/thumb/b/bb/%EC%9E%90%EB%B0%94_%EB%A1%9C%EA%B3%A0.png/200px-%EC%9E%90%EB%B0%94_%EB%A1%9C%EA%B3%A0.png)'),
(2,'2020-06-30 12:23:03','2020-06-30 12:23:03',1,1,'게시판 기능 실행?','# 게시판을 생성하여 게시물을 올림\r\n## SQL 이용하는데.. 어? 이게 되네?\r\n- 실행되는것에 대한 의문이 품어지지는데 되긴 함.\r\n- 마크다운 어렵다 흑흑\r\n- 토스트 라이브러리 설치 해서 글작성 해보고싶다\r\n- 수정/삭제 기능도 만들어야함.. 언제? (모름)'),
(6,'2020-07-01 09:47:18','2020-07-01 09:47:18',2,1,'IT/JAVA 카테고리임','게시물 10개만들어야함;;; 언제만들어'),
(7,'2020-07-01 09:48:38','2020-07-01 09:48:38',2,1,'java 게시판 블로그 페이징 힌트','# 페이징 카테고리별 분류\r\n## 힌트(http://localhost:8081/blog/s/article/list?cateItemId=1&page=2)\r\n ### 코드1\r\n   - SELECT COUNT(*) FROM article WHERE cateLtemId = 2\r\n ### 코드2\r\n   - int temsLnApage = 5; //한페이지에 나오는 게시물 수\r\n   - int limitFrom = (page - 1) * itemsInApage;\r\n ### 코드3\r\n   - int totalPage = Math.ceil((double)totalCount/itemsInApage);\r\n```html\r\n <a href=\"${pageCountext.request.contextPath}/s/article?cateItemId={$param.cateItemId}&page=<%=i%>\"></a>\r\n```'),
(12,'2020-07-01 13:00:53','2020-07-01 13:00:53',4,1,'IT/ETC 게시판','ETC 게시판입니다. 정보를 넣어주세요.'),
(15,'2020-07-02 11:36:05','2020-07-02 11:36:05',3,1,'IT/정보 카테고리임','정보 관련해서 글 작성해주시기 바랍니다.'),
(16,'2020-07-02 11:36:36','2020-07-02 11:36:36',4,1,'IT/ECT 카테고리임','IT 관련 기타 사항글을 작성해주시기 바랍니다. '),
(17,'2020-07-02 11:37:58','2020-07-02 11:37:58',5,1,'HTML/CSS 카테고리임','HTML/CSS 관련 게시글을 작성해주시기 바랍니다.\r\n![이미지](https://poiemaweb.com/img/html5.png)'),
(18,'2020-07-02 11:38:14','2020-07-02 11:38:14',6,1,'Design 카테고리임','디자인 참고자료를 넣어주시기 바랍니다.\r\n![이미지](https://ppss.kr/wp-content/uploads/2015/12/1_title-540x326.png)');

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
(1,'2020-06-30 11:55:56','Dairy'),
(2,'2020-06-30 11:55:56','IT/JAVA'),
(3,'2020-06-30 11:55:56','IT/정보'),
(4,'2020-06-30 11:55:56','IT/ETC'),
(5,'2020-06-30 11:55:56','HTML/CSS'),
(6,'2020-06-30 11:55:56','Design');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
