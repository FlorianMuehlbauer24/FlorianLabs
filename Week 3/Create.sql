CREATE DATABASE Car_sales;

USE Car_sales;

CREATE TABLE Cars (
VIN INT PRIMARY KEY UNIQUE NOT NULL,
Manufacturer VARCHAR(20), 
Model VARCHAR(20), 
Year_Car INT,
Color VARCHAR(20));


CREATE TABLE Customers (
Customer_ID INT PRIMARY KEY UNIQUE NOT NULL,
Customer_Name VARCHAR(20),
Phone_Number INT(20),
Email VARCHAR(30),
City VARCHAR(20),
County VARCHAR (20),
ZIP_Code INT);

CREATE TABLE Salesperson (
Staff_ID INT PRIMARY KEY UNIQUE NOT NULL,
Name_Salesperson VARCHAR(30),
Store VARCHAR(30));

CREATE TABLE Invoices (
Invoice_Number INT PRIMARY KEY UNIQUE NOT NULL,
Invoice_Date DATETIME,
VIN INT,
Customer_ID INT,
Salesperson VARCHAR(30),
Staff_ID INT);

# Alter tables to add Foreign Keys


ALTER TABLE Invoices
ADD CONSTRAINT Fk_VIN
FOREIGN KEY (VIN) REFERENCES Cars (VIN);

ALTER TABLE Invoices
ADD CONSTRAINT Fk_Customer_ID
FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID);

ALTER TABLE Invoices
ADD CONSTRAINT Fk_Staff_ID
FOREIGN KEY (Staff_ID) REFERENCES Salesperson (Staff_ID);




