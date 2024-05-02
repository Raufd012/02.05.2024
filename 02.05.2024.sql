CREATE DATABASE SPOTIFY

CREATE TABLE Users
(
Id int  Primary Key,
[Name] NvarChar(64) Not Null,
Surname NvarChar(64) Null Default 'XXX',
UserName VarChar(64) Not Null,
[Password] VarChar(64) Not Null,
Gender VarChar(64)
)
CREATE TABLE Artists 
(
ID Int Primary Key,
[Name] VARCHAR(64),
Surname VARCHAR(64),
Birthday DATE,
Gender VARCHAR(64)
)
CREATE TABLE Categories 
(
Id INT PRIMARY KEY,
Name VARCHAR(64)
)
CREATE TABLE Musics
(
Id Int  Primary Key,
[Name] VarChar(64),
Duration Int,
CategoryID Int  FOREIGN KEY (CategoryID)References Categories(Id),
ArtistID Int  FOREIGN KEY (ArtistID)References Artists(Id)
)

CREATE TABLE PlayLists
(
Id Int Identity Primary key,
[Name] VarChar (64),
UserID Int FOREIGN KEY (UserID) References Users(Id)

)

CREATE TABLE PlaylistMusics
(
Id Int Primary Key,
PlaylistID Int References Playlists(Id),
MusicID Int  References Musics(Id)
)


INSERT INTO Users 
VALUES 
(1,'Rauf', 'Dostuyev', 'RAUF41', 'RAUF1', 'Male'),
(2,'Ulvi', 'Abdullazada', 'ABDULLAZADA39', 'ABDULLAZADA1', 'MALE')


INSERT INTO Artists
VALUES
(1,'IBRAHIM', 'TATLISES', '1950-03-11', 'Male'),
(2,'AHMET ', 'KAYA', '1970-01-25', 'male')


INSERT INTO Categories
VALUES 
(1,'TURKU'),
(2,'TURKU')



INSERT INTO Musics 
VALUES
(1,'ARAMAM', 320, 5, 1),
(2,'KUM GIBI', 240, 4, 2)



INSERT INTO Playlists 
VALUES 
('Rauf-Playlist', 1),
('Ulvi-Playlist', 2)

INSERT INTO PlaylistMusics 
VALUES 
(1,1, 1),
(2,1, 2)



CREATE VIEW SPOTIFYInfo AS
SELECT 
    m.Name AS MusicName,
    m.Duration,
    c.Name AS CategoryName,
    a.Name AS ArtistName
FROM 
    Musics m
JOIN 
    Categories c ON m.CategoryID = c.Id
JOIN 
    Artists a ON m.ArtistID = a.Id



SELECT pm.Id, p.Name AS PlaylistName, m.Name AS MusicName
FROM PlaylistMusics pm
JOIN Playlists p ON pm.PlaylistID = p.Id
JOIN Musics m ON pm.MusicID = m.Id
WHERE p.UserID = 1


SELECT * FROM Musics 
ORDER BY Duration


SELECT a.Name AS ArtistName, COUNT(*) AS SongCount
FROM Musics m
JOIN Artists a ON m.ArtistID = a.Id
GROUP BY a.Name
ORDER BY SongCount 