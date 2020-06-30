# 캐릭터 SET 설정
SET NAMES utf8mb4;

# DB 생성
DROP DATABASE IF EXISTS site37;
CREATE DATABASE site37;
USE site37;

DROP TABLE article;

# 카테고리 테이블 생성
CREATE TABLE cateItem(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regdate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE
);

SELECT * FROM cateItem;

# 카테고리 추가
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/일반';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/알고리즘';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/백엔드';
INSERT INTO cateItem SET regDate = NOW(), `name` = 'IT/프론트엔드';
INSERT INTO cateItem SET regDate = NOW(), `name` = '디자인/피그마';
INSERT INTO cateItem SET regDate = NOW(), `name` = '일상/일반';

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    cateItemId INT(10) UNSIGNED NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
);

INSERT INTO article SET 
regDate = NOW(),
updateDate = NOW(),
cateItemId = 6,
displayStatus = 1,
title = '블로그 시작',
`body` = 'ㅋㅋㅋ';

SELECT * FROM article;

/*
👻SQL 기본문법👻

### 데이터조회하기 (SELECT)
```sql
SELECT * FROM 테이블명; 
//애스터리스크(*)는 모든 열을 의미한다.

SELECT 열명1, 열명2 FROM 테이블명;
//테이블의 열명1 열명2에 대한 행을 조회
```
* 예약어의 데이터베이스 객체명은 대소문자를 구별하지 않는다.
* 표 형식의 데이터는 '행(레코드)'와 '열(컬럼/필드)'로 구성된다.
* * *
#### 테이블 구조 참조하기 (DESC)
```sql
DESC 테이블명;
```
* * *
#### 검색 조건 지정하기 (WHERE)
```sql
SELECT 열1, 열2 FROM 테이블명 WHERE 조건식;
```
##### WHERE절 예제
```sql
SELECT * FROM 테이블명 WHERE no = 2; 
//no열의 값이 2인 경우만 조회

SELECT * FROM 테이블명 WHERE no <> 2; 
//no열의 값이 2가 아닌 경우만 조회

SELECT * FROM 테이블명 WHERE name='홍길동';
//name열이 홍길동인 경우만 조회
//숫자가 아닌 문자열이나 날짜에 경우 '' 싱글 쿼트롤 둘러싼다.

SELECT * FROM 테이블명 WHERE name IS NULL;
//name 열이 NULL인 경우만 조회
```
* * *
#### WHERE절 조건 조합하기
```sql
SELECT * FROM 테이블명 WHERE 조건1 AND 조건2;
SELECT * FROM 테이블명 WHERE 조건1 OR 조건2;
SELECT * FROM 테이블명 WHERE NOT 조건;
```
* AND는 OR에 비해 우선순위가 높다. 그러므로 괄호를 통해서 우선수위를 바꿀 수 있다.
```sql
SELECT * FROM 테이블명 WHERE (a=1 OR a=2) AND (b=1 OR b=2)
```
* * *
#### 패턴매칭에 의한 검색
```sql
SELECT * FROM 테이블명 WHERE text LIKE 'SQL%';
//text라는 열에서 SQL로 시작하는 내용이 있다면 검색한다. (전방매치) 

SELECT * FROM 테이블명 WHERE text LIKE '%SQL%';
//text라는 열에서 SQL을 포함하는 내용이 있다면 검색한다. (중간매치)
//예를들어 'SQL은 RDBMS를 조작하는 언어이다'
//'LIKE는 SQL에서 사용할 수있는 술어중 하나이다'

SELECT * FROM 테이블명 WHERE text LIKE '%\%%';
//이스케이프를 통해서 % 검색하기
// _를 검색할떄도 이스케이프 (\_) 시켜야한다.
```

참조
- https://siyoon210.tistory.com/133
*/

/*
😎자바스크립트 기본문법😎
#### 변수
자바스크립트에는 변수형(int, double, string)이 존재하지 않는다. var 이라는 가변형 변수만 존재하여 초기화 할때 형태에 따라서 알아서 할당된다.
```javascript
var i;
var x = 123;
var y = "123";
var z = false;
var w = null;
```
* * *
#### 연산자
+, -, *, /, % 등의 기본 연산은 물론 ++, --와 같은 증감 연산자도 사용할 수 있다.
```javascript
a = a + 1 (x)
a += 1 (o)

var s = "String1" + "String2";
document.write(s);
```
* * *
#### 조건문
```javascript
a==b
a!=b
a==b && a==c
a==b || a==c
a > b

if(a>b) {
    document.write("a is more than b.")
} else if(a == b) {
    document.write("a is the same as b.")
} else {
    document.write("a is less than b.")
}
```
#### 함수
```javascript
// var 1
function send() {
    alert('send');
}

send();

// var 2
function send() {
    alert('send');
}

send();

// var 3
send = () => {
    alert('send');
}

send();
```
*/