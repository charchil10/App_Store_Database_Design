/*
Created: 14-02-2018
Modified: 22-02-2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/



-- Create tables section -------------------------------------------------

-- Table Application

CREATE TABLE [Application]
(
 [Application_ID] Int NOT NULL,
 [Application_Name] Varchar(40) NOT NULL,
 [Application_Size] Float NOT NULL,
 [Application_Price] Money NULL,
 [Application_Description] Varchar(100) NOT NULL,
 [Developer_ID] Int NULL,
 [Updated_Date] Datetime NOT NULL,
 [Application_Version] Float NOT NULL
)
go

-- Create indexes for table Application

CREATE INDEX [IX_Relationship24] ON [Application] ([Developer_ID])
go

-- Add keys for table Application

ALTER TABLE [Application] ADD CONSTRAINT [Key1] PRIMARY KEY ([Application_ID])
go

-- Table Application2

CREATE TABLE [Application2]
(
 [Application_Name] Varchar(40) NOT NULL,
 [Application_Size] Float NOT NULL,
 [Application_Price] Money NULL,
 [Application_Description] Varchar(100) NOT NULL,
 [Developer_ID] Int NULL,
 [Updated_Date] Datetime NOT NULL,
 [Application_Version] Float NOT NULL,
 [Application_ID] Int NOT NULL
)
go

-- Create indexes for table Application2

CREATE INDEX [IX_Relationship24] ON [Application2] ([Developer_ID])
go

CREATE INDEX [IX_Relationship29] ON [Application2] ([Application_ID])
go

-- Table Permission

CREATE TABLE [Permission]
(
 [Permission_ID] Int NOT NULL,
 [Permission_Name] Varchar(25) NOT NULL,
 [Permission_Description] Text NULL
)
go

-- Add keys for table Permission

ALTER TABLE [Permission] ADD CONSTRAINT [Key2] PRIMARY KEY ([Permission_ID])
go

-- Table Entity3

CREATE TABLE [Entity3]
(
 [App_ID] Int NOT NULL,
 [P_ID] Int NOT NULL
)
go

-- Add keys for table Entity3

ALTER TABLE [Entity3] ADD CONSTRAINT [Key3] PRIMARY KEY ([App_ID],[P_ID])
go

-- Table Application-Permission

CREATE TABLE [Application-Permission]
(
 [Application_ID] Int NOT NULL,
 [Permission_ID] Int NOT NULL
)
go

-- Add keys for table Application-Permission

ALTER TABLE [Application-Permission] ADD CONSTRAINT [Key4] PRIMARY KEY ([Application_ID],[Permission_ID])
go

-- Table Category

CREATE TABLE [Category]
(
 [Category_ID] Int NOT NULL,
 [Category_Name] Varchar(30) NOT NULL,
 [Category_Description] Text NOT NULL
)
go

-- Add keys for table Category

ALTER TABLE [Category] ADD CONSTRAINT [Key5] PRIMARY KEY ([Category_ID])
go

-- Table Application-Category

CREATE TABLE [Application-Category]
(
 [Application_ID] Int NOT NULL,
 [Category_ID] Int NOT NULL
)
go

-- Add keys for table Application-Category

ALTER TABLE [Application-Category] ADD CONSTRAINT [Key6] PRIMARY KEY ([Application_ID],[Category_ID])
go

-- Table Developer

CREATE TABLE [Developer]
(
 [Developer_ID] Int NOT NULL,
 [Developer_Name] Varchar(30) NOT NULL,
 [Developer_Description] Varchar(50) NULL
)
go

-- Add keys for table Developer

ALTER TABLE [Developer] ADD CONSTRAINT [Key8] PRIMARY KEY ([Developer_ID])
go

-- Table Users

CREATE TABLE [Users]
(
 [User_Email] Varchar(40) NOT NULL,
 [User_Fname] Varchar(40) NOT NULL,
 [User_Lname] Varchar(40) NOT NULL,
 [MobileNo] Int NOT NULL,
 [User_Location] Geography NULL,
 [DateofBirth] Varchar(20) NOT NULL
)
go

-- Add keys for table Users

ALTER TABLE [Users] ADD CONSTRAINT [Key9] PRIMARY KEY ([User_Email])
go

-- Table Reviews

CREATE TABLE [Reviews]
(
 [Application_ID] Int NOT NULL,
 [Review_Des] Varchar(50) NULL,
 [Ratings] Float NULL,
 [User_Email] Varchar(40) NOT NULL
)
go

-- Create indexes for table Reviews

CREATE INDEX [IX_Relationship27] ON [Reviews] ([User_Email])
go

-- Add keys for table Reviews

ALTER TABLE [Reviews] ADD CONSTRAINT [Key10] PRIMARY KEY ([Application_ID])
go

-- Table Payment

CREATE TABLE [Payment]
(
 [Payment_ID] Int NOT NULL,
 [Application_ID] Int NOT NULL,
 [Payment_Date] Varchar(20) NOT NULL,
 [User_Email] Varchar(40) NOT NULL
)
go

-- Create indexes for table Payment

CREATE INDEX [IX_Relationship11] ON [Payment] ([Application_ID])
go

CREATE INDEX [IX_Relationship25] ON [Payment] ([User_Email])
go

-- Add keys for table Payment

ALTER TABLE [Payment] ADD CONSTRAINT [Key11] PRIMARY KEY ([Payment_ID])
go

-- Table Devices

CREATE TABLE [Devices]
(
 [Device_Name] Varchar(30) NOT NULL,
 [Device_ID] Int NOT NULL,
 [User_Email] Varchar(40) NOT NULL
)
go

-- Create indexes for table Devices

CREATE INDEX [IX_Relationship26] ON [Devices] ([User_Email])
go

-- Add keys for table Devices

ALTER TABLE [Devices] ADD CONSTRAINT [Key12] PRIMARY KEY ([Device_ID])
go

-- Table Entity13

CREATE TABLE [Entity13]
(
 [Device_ID] Int NOT NULL,
 [Application_ID] Int NOT NULL
)
go

-- Add keys for table Entity13

ALTER TABLE [Entity13] ADD CONSTRAINT [Key13] PRIMARY KEY ([Device_ID],[Application_ID])
go

-- Table Entity14

CREATE TABLE [Entity14]
(
 [Application_ID] Int NOT NULL,
 [Device_ID] Int NOT NULL
)
go

-- Add keys for table Entity14

ALTER TABLE [Entity14] ADD CONSTRAINT [Key14] PRIMARY KEY ([Application_ID],[Device_ID])
go

-- Table Entity15

CREATE TABLE [Entity15]
(
 [Device_ID] Char(1) NOT NULL,
 [Application_ID] Char(1) NOT NULL
)
go

-- Table Downloads

CREATE TABLE [Downloads]
(
 [Download_ID] Int NOT NULL,
 [Application_ID] Int NOT NULL,
 [User_Email] Varchar(40) NOT NULL,
 [Payment_ID] Int NOT NULL,
 [Download_Date] Datetime NOT NULL,
 [Device_ID] Int NOT NULL
)
go

-- Create indexes for table Downloads

CREATE INDEX [IX_Relationship19] ON [Downloads] ([Application_ID])
go

CREATE INDEX [IX_Relationship21] ON [Downloads] ([User_Email])
go

CREATE INDEX [IX_Relationship22] ON [Downloads] ([Payment_ID])
go

CREATE INDEX [IX_Relationship28] ON [Downloads] ([Device_ID])
go

-- Add keys for table Downloads

ALTER TABLE [Downloads] ADD CONSTRAINT [Key17] PRIMARY KEY ([Download_ID])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Entity3] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([App_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity3] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([P_ID]) REFERENCES [Permission] ([Permission_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application-Permission] ADD CONSTRAINT [Permission_ID-Permission-Application-Permission] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application-Permission] ADD CONSTRAINT [Application_ID-Applications-Application-Permission] FOREIGN KEY ([Permission_ID]) REFERENCES [Permission] ([Permission_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application-Category] ADD CONSTRAINT [Application_ID-Application-Applkication-Category] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Reviews] ADD CONSTRAINT [Application_ID-Application-Review] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Payment] ADD CONSTRAINT [Application_ID-Application-Payment] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity13] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([Device_ID]) REFERENCES [Devices] ([Device_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity13] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity14] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity14] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([Device_ID]) REFERENCES [Devices] ([Device_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application-Category] ADD CONSTRAINT [Category_ID-Category-Application-Category] FOREIGN KEY ([Category_ID]) REFERENCES [Category] ([Category_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([User_Email]) REFERENCES [Users] ([User_Email]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Relationship22] FOREIGN KEY ([Payment_ID]) REFERENCES [Payment] ([Payment_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([Developer_ID]) REFERENCES [Developer] ([Developer_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Payment] ADD CONSTRAINT [Relationship25] FOREIGN KEY ([User_Email]) REFERENCES [Users] ([User_Email]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Devices] ADD CONSTRAINT [Relationship26] FOREIGN KEY ([User_Email]) REFERENCES [Users] ([User_Email]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Reviews] ADD CONSTRAINT [Relationship27] FOREIGN KEY ([User_Email]) REFERENCES [Users] ([User_Email]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Relationship28] FOREIGN KEY ([Device_ID]) REFERENCES [Devices] ([Device_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application2] ADD CONSTRAINT [Relationship29] FOREIGN KEY ([Application_ID]) REFERENCES [Application] ([Application_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go






