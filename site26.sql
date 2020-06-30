#to2.kr/brX

# 캐릭터set 설정
SET NAMES utf8mb4;

# DB생성
DROP DATABASE IF EXISTS site26;
CREATE DATABASE site26;
USE site26;

#카테고리 
DROP TABLE IF EXISTS cateItem;
CREATE TABLE cateItem (
 id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 regDate DATETIME NOT NULL,
 `name` CHAR(100) NOT NULL UNIQUE
);

#카테고리아이템
INSERT INTO cateItem SET regDate = NOW(), `name` = 'Dairy';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/JAVA';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/정보';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/ETC';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'HTML/CSS';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'Design';

SELECT *
FROM cateItem;

#게시물 테이블 생성
DROP TABLE IF EXISTS article;

CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    cateItemId INT(10) UNSIGNED NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    `title` CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);

