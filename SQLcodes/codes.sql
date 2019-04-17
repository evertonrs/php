USE db_php;

CREATE TABLE tb_users (
	idUser INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userLogin VARCHAR(64) NOT NULL,
    userPass VARCHAR(256) NOT NULL,
    dateReg TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO tb_users(userLogin, userPass) VALUES('root', 'root123');

SELECT * FROM tb_users;

UPDATE tb_users SET userPass = '123456' WHERE idUser = 1;

DELETE	FROM tb_users WHERE idUser =1;/*Tambem deleta a primary key*/

TRUNCATE TABLE tb_users;  /*Este comando reseta a tabela e a primary key*/
