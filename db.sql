DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;
USE blog;
<<<<<<< HEAD

CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
);

SELECT * FROM article;

TRUNCATE article;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목😎',
`body` = '# ㅋㅋ\n## ㅋㅋㅋ';
=======
CREATE TABLE article (
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
title CHAR(200) NOT NULL
`body` LONGTEXT NOT NULL
);
>>>>>>> 3d8c61e905dc7f02b07f69308e54a5b485d9a134
