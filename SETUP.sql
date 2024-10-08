DROP DATABASE IF EXISTS PythonConnDB;
DROP USER IF EXISTS 'LRVSPAdmin'@'localhost';
DROP USER IF EXISTS 'LRVSPPython'@'localhost';

CREATE DATABASE PythonConnDB;

USE PythonConnDB;

CREATE TABLE FilePaths(
    ID INTEGER NOT NULL AUTO_INCREMENT,
    pdfPath TINYTEXT NOT NULL,
    processPath TINYTEXT,
    entityId INTEGER NOT NULL,
    failed BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT paths_PK PRIMARY KEY (ID)
);

CREATE TABLE DocObjs(
    ID INTEGER NOT NULL AUTO_INCREMENT,
    title TINYTEXT NOT NULL,
    metadata TEXT,
    entityId INTEGER NOT NULL,
    numLinks INTEGER NOT NULL,
    failed BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT docs_PK PRIMARY KEY (ID)
);

CREATE TABLE LinkObjs(
    ID INTEGER NOT NULL AUTO_INCREMENT,
    fromTitle TINYTEXT NOT NULL,
    toTitle TINYTEXT NOT NULL,
    pages TEXT,
    failed BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT links_PK PRIMARY KEY (ID)
);

CREATE USER 'LRVSPAdmin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, LOCK TABLES ON *.* TO 'LRVSPAdmin'@'localhost';

CREATE USER 'LRVSPPython'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, LOCK TABLES ON PythonConnDB.* TO 'LRVSPPython'@'localhost';
FLUSH PRIVILEGES;