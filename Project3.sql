insert INTO membership VALUES ('tname', 'tid', 1234, 'ttel', 'tmobile', 'temail', 'taddr'); 

SELECT * FROM membership;
SELECT id, pass, NAME FROM membership;

INSERT INTO membership VALUES ('성기훈', 'kihun0227', 2525, '02-312-3581', '010-3936-3581', 'kihun0227@gmail.com', '이대앞');

DROP TABLE board;


CREATE TABLE board(
   num INT NOT NULL auto_increment,
   title VARCHAR(1suamil_db00) not null,
   content text not null,
   id varchar(30) not null,
   postdate datetime default current_timestamp,
   visitcount mediumint(10) NOT NULL DEFAULT 0,
   PRIMARY KEY (num),
   bname VARCHAR(100) NOT NULL
);

 