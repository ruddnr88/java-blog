#to2.kr/brX

# 캐릭터set 설정
SET NAMES utf8mb4;

# DB생성
DROP DATABASE IF EXISTS site26;
CREATE DATABASE site26;
USE site26;

#카테고리 삭제
DROP TABLE IF EXISTS `member`;

CREATE TABLE cateItem (
 id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 regDate DATETIME NOT NULL,
 `name` CHAR(100) NOT NULL UNIQUE
);

#카테고리아이템
INSERT INTO cateItem SET regDate = NOW(), `name` = 'Dairy';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'JAVA';
INSERT INTO cateItem SET regDate = NOW(), `name` = '정보';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'ETC';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'HTML/CSS';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'Design';

SELECT *
FROM cateItem;

# article 테이블 삭제
DROP TABLE IF EXISTS `member`;

#테이블 초기화
TRUNCATE article;

#게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    cateItemId INT(10) UNSIGNED NOT NULL,
    hit INT(100) NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    `title` CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);
#멤버 테이블
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL,
    loginId CHAR(100) NOT NULL UNIQUE,
    loginPw CHAR(255) NOT NULL,
    nickname CHAR(100) NOT NULL UNIQUE,
    email CHAR(200) NOT NULL,
    `level` INT(1) UNSIGNED DEFAULT 0 NOT NULL
);

#게시글댓글테이블
CREATE TABLE articleReply(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `body` TEXT NOT NULL,
    articleId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL
);
#테이블 수정
ALTER TABLE article 
MODIFY `loginPw` CHAR(255) NOT NULL;

# 테이블 조회
DESC `articleReply`;

# 테이블 컬럼 추가
ALTER TABLE articleReply
ADD COLUMN  `body` TEXT NOT NULL;


# 컬럼삭제
ALTER TABLE article
DROP COLUMN hit;

#게시물생성 1 
INSERT INTO article 
SET regDate = NOW(), 
updateDate = NOW(),
cateItemId = 1,
displayStatus = 1,
`title` = '게시물을 계속해서 추가하자',
`body` = '내용없음 ';

#마스터 회원 생성
INSERT INTO `member` SET
regDate = NOW(),
updateDate = NOW(),
`loginId` = 'admin',
`loginPw` = 'admin',
`name` = '노경욱',
`nickname` = 'admin',
`email` = 'admin@admin.com',
`level` = 10;

SELECT * 
FROM articleReply 
ORDER BY id DESC

SELECT * 
FROM article 
ORDER BY id DESC

SELECT * 
FROM `member` 
ORDER BY id DESC

SELECT *
FROM article
ORDER BY id DESC

UPDATE article
SET memberId = 1
WHERE memberId = 0;


# 테이블 컬럼 추가(기본1, 탈퇴시 0)
ALTER TABLE `member`
ADD COLUMN  delStatus TINYINT(1) UNSIGNED DEFAULT 0 NOT NULL;

UPDATE `member`
SET delStatus = 1
WHERE delStatus = 0;

# 테이블 컬럼 추가
ALTER TABLE `member`
ADD COLUMN  delDate DATETIME NOT NULL;

# 기존 게시물 댓글의 게시물 번호를 1번으로 정리(통일)
UPDATE articleReply
SET articleId = 1
WHERE articleId = 0; 


# 부가정보테이블 
# 댓글 테이블 추가
DROP TABLE IF EXISTS attr;
CREATE TABLE attr (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    relTpyeCode CHAR(20) NOT NULL,
    relId INT(10) UNSIGNED NOT NULL,
    typeCode CHAR(20) NOT NULL,
    type2Code CHAR(20) NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE,
    `value` TEXT NOT NULL
);

# updateDate 칼럼 추가
ALTER TABLE `cateItem` ADD COLUMN `updateDate` DATETIME NOT NULL AFTER `regDate`; 

# attr 테이블에서 name 을 4가지 칼럼으로 나누기
ALTER TABLE `attr` DROP COLUMN `name`,
ADD COLUMN `relTypeCode` CHAR(20) NOT NULL AFTER `updateDate`,
ADD COLUMN `relId` INT(10) UNSIGNED NOT NULL AFTER `relTypeCode`,
ADD COLUMN `typeCode` CHAR(30) NOT NULL AFTER `relId`,
ADD COLUMN `type2Code` CHAR(30) NOT NULL AFTER `typeCode`,
CHANGE `value` `value` TEXT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL AFTER `type2Code`,
DROP INDEX `name`; 

# attr 유니크 인덱스 걸기
## 중복변수 생성금지
## 변수찾는 속도 최적화
ALTER TABLE `attr` ADD UNIQUE INDEX (`relTypeCode`, `relId`, `typeCode`, `type2Code`); 

## 특정 조건을 만족하는 회원 또는 게시물(기타 데이터)를 빠르게 찾기 위해서
ALTER TABLE `attr` ADD INDEX (`relTypeCode`, `typeCode`, `type2Code`);  