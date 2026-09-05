--Step 1
--Create database Race_Day;

----Step 2
--Create table Users
--(UserID INT NOT NULL PRIMARY KEY,
--Name VARCHAR(25) NOT NULL,
--Surname VARCHAR(25) NOT NULL,
--Email VARCHAR(25) NOT NULL,
--Password VARCHAR(25) NOT NULL,
--Role VARCHAR(20) NOT NULL
--    CHECK (Role IN ('Organiser', 'Participant')),
--createdAt DATETIME DEFAULT GETDATE());

--Create table Events
--(EventID INT NOT NULL PRIMARY KEY,
--UserID INT NOT NULL,
--Title VARCHAR(25) NOT NULL,
--Description VARCHAR(25) NOT NULL,
--City VARCHAR(25) NOT NULL,
--Event_Type VARCHAR(25) NOT NULL,
--Event_Date DATE NOT NULL,
--Registration_Deadline DATE NOT NULL,
--Status VARCHAR(20) NOT NULL
--     CHECK (Status IN ('Scheduled', 'Ongoing', 'Completed', 'Cancelled'))
--FOREIGN KEY (UserID) REFERENCES Users(UserID));

--Create table Categories
--(CategoryID INT NOT NULL PRIMARY KEY,
--EventID INT NOT NULL,
--Category_Name VARCHAR(25) NOT NULL,
--Disrtance_km INT NOT NULL,
--Entry_Fee INT NOT NULL,
--Max_Participants INT NOT NULL,
--Start_Time TIME NOT NULL,
--FOREIGN KEY (EventID) REFERENCES Events(EventID));

--Create table Enrolments
--(EnrolmentID INT NOT NULL PRIMARY KEY,
--UserID INT NOT NULL,
--CategoryID INT NOT NULL,
--Enrolment_Date DATE NOT NULL,
--Bib_Number INT NOT NULL,
--Status VARCHAR(20) NOT NULL
--    CHECK (Status IN ('Partaking', 'Not Partaking'))
--FOREIGN KEY (UserID) REFERENCES Users(UserID),
--FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID));

--Create table Results
--(ResultID INT NOT NULL PRIMARY KEY,
--EnrolmentID INT NOT NULL,
--Finish_Time_Seconds TIME(0) NOT NULL,
--Position_Overall INT NOT NULL,
--Status VARCHAR(20) NOT NULL
--    CHECK (Status IN ('Finished', 'Not finished'))
--FOREIGN KEY (EnrolmentID) REFERENCES Enrolments(EnrolmentID));

--Create table Routes
--(RouteID INT NOT NULL PRIMARY KEY,
--EventID INT NOT NULL,
--Elevation_Gain DECIMAL(6,2),
--FOREIGN KEY (EventID) REFERENCES Events(EventID));

--ALTER TABLE Users
--ADD CONSTRAINT UQ_Users_Email UNIQUE (Email);

--ALTER TABLE Enrolments
--ADD CONSTRAINT UQ_Enrolments_Bib_number UNIQUE (Bib_number);

INSERT INTO dbo.Users (UserID, Name, Surname, Email, Password, Role)
VALUES 
(1, 'Lubabalo', 'Madyibi', 'lubamadyibi@gmail.com', 'lub@', 'Organiser'),
(2, 'Pontsho', 'Malatsi', 'pontshom@gmail.com', 'molapo', 'Organiser'),
(3, 'Kulani', 'Zwane', 'kzbillion@gmail.com', 'kgethi', 'Participant'),
(4, 'Senti', 'Manzini', 'sentimanzini@gmail.com', 'kacey','Participant'),
(5, 'Keamo', 'Noko', 'keamonoko@gmail.com', 'noko', 'Participant');

INSERT INTO dbo.Events (EventID, UserID, Title, Description, City, Event_Type, Event_Date, Registration_Deadline, Status)
VALUES
(1, 3, 'Comrades marathon', 'Marathon', 'Durban', 'Race', '20 June 2026', '4 May 2026', 'Scheduled'),
(2, 4, 'Soweto Run', 'Marathon', 'Johannesburg', 'Race', '1 December 2026', '31 October 2026', 'Cancelled'),
(3, 5, 'Common Wealth Games', 'Olympics event', 'Cape Town', 'Athletics', '5 September 2026', '15 August 2026', 'Ongoing');

INSERT INTO dbo.Categories (CategoryID, EventID, Category_Name, Disrtance_km, Entry_Fee, Max_Participants, Start_Time)
VALUES
(1, 1, 'Half Marathon', '10', '150', '1', '08:00'),
(2, 2, 'Marathon', '25', '200', '2', '06:00'),
(3, 3, 'Competition', '2', '70', '5', '13:30');

INSERT INTO dbo.Enrolments (EnrolmentID, UserID, CategoryID, Enrolment_Date, Bib_Number, Status)
VALUES
(1, 3, 1, '1 May 2026', '301', 'Partaking'),
(2, 4, 2, '31 October 2026', '2900', 'Not Partaking'),
(3, 5, 3, '15 August 2026', '130', 'Partaking');

INSERT INTO dbo.Results (ResultID, EnrolmentID, Finish_Time_Seconds, Position_Overall, Status)
VALUES
(1, 1, '09:10:00', '145', 'Finished'),
(2, 2, '00:00:00', '0', 'Not Finished'),
(3, 3, '00:15:34', '3', 'Not Finished');

INSERT INTO dbo.Routes (RouteID, EventID, Elevation_Gain)
VALUES
(1, 1, 100),
(2, 2, 0),
(3, 3, 200);

SELECT * FROM Users;
SELECT * FROM Events;
SELECT * FROM Categories;
SELECT * FROM Enrolments;
SELECT * FROM Results;
SELECT * FROM Routes;