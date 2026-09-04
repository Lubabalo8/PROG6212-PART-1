--Step 1
Create database Race_Day;

--Step 2
Create table Users
(UserID INT NOT NULL PRIMARY KEY,
Name VARCHAR(25) NOT NULL,
Surname VARCHAR(25) NOT NULL,
Email VARCHAR(25) NOT NULL,
Password VARCHAR(25) NOT NULL,
Role VARCHAR(20) NOT NULL
    CHECK (Role IN ('Organiser', 'Participant')),
createdAt DATETIME DEFAULT GETDATE());

Create table Events
(EventID INT NOT NULL PRIMARY KEY,
UserID INT NOT NULL,
Title VARCHAR(25) NOT NULL,
Description VARCHAR(25) NOT NULL,
City VARCHAR(25) NOT NULL,
Event_Type VARCHAR(25) NOT NULL,
Event_Date DATE NOT NULL,
Registration_Deadline DATE NOT NULL,
Status VARCHAR(20) NOT NULL
     CHECK (Status IN ('Scheduled', 'Ongoing', 'Completed', 'Cancelled'))
FOREIGN KEY (UserID) REFERENCES Users(UserID));
