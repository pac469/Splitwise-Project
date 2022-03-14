
-- CREATE DATABASE splitwiseDB;

DROP TABLE userTable;
DROP TABLE groupTable;
DROP TABLE user_groupTable;
DROP TABLE operation;

CREATE TABLE userTable(
    userId SERIAL PRIMARY KEY,
    email TEXT,
    "password" VARCHAR (255),
    "name" TEXT
);

CREATE TABLE groupTable (
    groupId SERIAL PRIMARY KEY,
    "name" TEXT,
    createdAt TIMESTAMP
);

CREATE TABLE user_groupTable (
    relationId SERIAL PRIMARY KEY,
    "user" INTEGER,
    FOREIGN KEY ("user") references userTable (userId),
    "group" INTEGER,
    FOREIGN KEY ("group") references groupTable (groupId)
);

CREATE TABLE operation(
    operationId SERIAL PRIMARY KEY,
    "group" INTEGER,
    FOREIGN KEY ("group") references groupTable(groupId),
    userInDebt INTEGER,
    FOREIGN KEY (userInDebt) references userTable(userId),
    amount float, 
    userRecipient INTEGER,
    FOREIGN KEY (userRecipient) references userTable(userId)
);

-- POST USER
-- INSERT INTO usertable VALUES (DEFAULT, 'pac469@nyu.edu', 'putoelquelolea5000', 'Paulin Alcoser')

-- GET USER
-- SELECT * FROM usertable WHERE usertable.userId = 1; 

-- GET USERS 
-- SELECT * FROM usertable; **

-------------------------------------------------------------------------------------------------------------

-- POST GROUP 
-- INSERT INTO grouptable VALUES (DEFAULT, 'MEXICO CITY', '2016-06-22 19:10:25-07');

-- GET THE GROUPS OF THE USERS;
-- SELECT gtb.groupid, gtb.name, gtb.createdat FROM grouptable gtb, user_grouptable u_gtb WHERE u_gtb.user = 1(Variable) AND u_gtb.group = gtb.groupId;

-- Get the users per group;
-- SELECT utb.userid, utb.email, utb.password, utb.name FROM usertable utb, user_grouptable u_gtb WHERE u_gtb.group = 1(Variable) AND u_gtb.user = utb.userId;
---------------------------------------------------------------------------------------------------------------

--ADD USER to GROUP
-- INSERT INTO user_grouptable VALUES (DEFAULT, 1, 1); //Rid, userId, groupId

