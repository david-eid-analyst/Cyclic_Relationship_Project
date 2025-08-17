/* CREATE DATABASE */
CREATE DATABASE sql_task1_fri

/* USE DATABASE & CREATE Employee TABLE */
USE sql_task1_fri
CREATE TABLE Employee(
	f_name NVARCHAR(50) NOT NULL,
	minit TEXT,
	l_name NVARCHAR(50),
	ssn INT PRIMARY KEY,
	b_date DATE,
	[address] NVARCHAR(100),
	sex NVARCHAR(8) CHECK(sex LIKE 'Male' OR sex LIKE 'Female'),
	salary FLOAT,
	super_ssn INT REFERENCES Employee(ssn)
)

/* CREATE Dependent TABLE */ 
CREATE TABLE [Dependent](
	e_ssn INT REFERENCES Employee(ssn),
	dependent_name NVARCHAR(80),
	sex NVARCHAR(8) CHECK(sex LIKE 'Male' OR sex LIKE 'Female'),
	b_date DATE,
	relationship NVARCHAR(100),
	CONSTRAINT essn_depname_const_pk PRIMARY KEY(e_ssn,dependent_name)
)

/* CREATE Department TABLE */
CREATE TABLE Department(
	d_name NVARCHAR(50) NOT NULL,
	d_number INT PRIMARY KEY IDENTITY(1000,1),
	mgr_ssn INT REFERENCES Employee(ssn),
	mgr_startdate DATE NOT NULL
)

/* CREATE Project TABLE */
CREATE TABLE Project(
	p_name NVARCHAR(50) NOT NULL,
	p_number INT PRIMARY KEY,
	p_location NVARCHAR(200) NOT NULL,
	d_num INT REFERENCES Department(d_number)
)

/* CREATE Dept_Location TABLE */
CREATE TABLE Dept_Location(
	d_number INT REFERENCES Department(d_number),
	d_location NVARCHAR(100) NOT NULL,
	CONSTRAINT dnum_dloc_cons_pk PRIMARY KEY(d_number,d_location)
)

/* CREATE Work_On TABLE */
CREATE TABLE Work_On(
	e_ssn INT,
	p_no INT,
	[hours] INT NOT NULL,
	CONSTRAINT essn_pno_const_pk PRIMARY KEY(e_ssn,p_no)
)

/* UPDATE Employee TABLE AFTER CREATE Department TABLE (ADD d_no COLUMN) */
ALTER TABLE Employee
ADD d_no INT REFERENCES Department(d_number)

/* SELECT ALL TABLES */
SELECT * FROM Employee
SELECT * FROM Department
SELECT * FROM Dept_Location
SELECT * FROM Project
SELECT * FROM Work_On
SELECT * FROM [Dependent]