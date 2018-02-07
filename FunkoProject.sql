CREATE TABLE Fandoms (
	pk_FandomId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FandomName varchar(100) NOT NULL
)

CREATE TABLE Categories (
	pk_CategoryId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CategoryName varchar(100) NOT NULL
)

CREATE TABLE Items (
	pk_ItemId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fk_FandomId INT NOT NULL REFERENCES Fandoms(pk_FandomId),
	fk_CategoryId INT NOT NULL REFERENCES Categories(pk_CategoryId),
	ItemName varchar(100) NOT NULL,
	Active BIT DEFAULT (1),
	Price Decimal(19,4) NOT NULL
)

CREATE TABLE Ratings (
	pk_RatingId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	fk_ItemId INT NOT NULL REFERENCES Items(pk_ItemId),
	Rating INT NOT NULL,
	Comment TEXT,
	CommentDate DATETIME DEFAULT(GETDATE())
)

--Inserts
SET IDENTITY_INSERT Fandoms ON
	INSERT Fandoms (pk_FandomId, FandomName) VALUES (1, 'Fallout')
	INSERT Fandoms (pk_FandomId, FandomName) VALUES (2, 'Rick and Morty')
	INSERT Fandoms (pk_FandomId, FandomName) VALUES (3, 'Borderlands')
	INSERT Fandoms (pk_FandomId, FandomName) VALUES (4, 'DC')
	INSERT Fandoms (pk_FandomId, FandomName) VALUES (5, 'Cuphead')
	INSERT Fandoms (pk_FandomId, FandomName) VALUES (6, 'Simpsons')
SET IDENTITY_INSERT Fandoms OFF


SET IDENTITY_INSERT Categories ON
	INSERT Categories (pk_CategoryId, CategoryName) VALUES (1, 'The Vault')
	INSERT Categories (pk_CategoryId, CategoryName) VALUES (2, 'Keychain')
	INSERT Categories (pk_CategoryId, CategoryName) VALUES (3, 'Rides')
	INSERT Categories (pk_CategoryId, CategoryName) VALUES (4, 'Games')
	INSERT Categories (pk_CategoryId, CategoryName) VALUES (5, 'Pen Topper')
	INSERT Categories (pk_CategoryId, CategoryName) VALUES (6, 'Tees')
SET IDENTITY_INSERT Categories OFF

INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (2, 1, 'T-60 Power Armor', 1, 12.99)
INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (3, 2, 'Mad Max Rick', 1, 14.99)
INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (4, 3, 'Claptrap', 1, 9.99)
INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (4, 1, 'Vault Boy', 1, 12.99)
INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (5, 4, 'Bombshells', 1, 12.99)
INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (6, 5, 'Cuphead and Bosses', 1, 24.99)
INSERT Items (fk_CategoryId, fk_FandomId, ItemName, Active, Price) VALUES (1, 6, 'T-60 Power Armor', 0, 12.99)

INSERT Ratings (fk_ItemId, Rating, Comment, CommentDate) VALUES (1, 3, 'Fancy Lil Lad', GetDate())
INSERT Ratings (fk_ItemId, Rating, Comment, CommentDate) VALUES (1, 3, 'My New Homie', GetDate())
INSERT Ratings (fk_ItemId, Rating, Comment, CommentDate) VALUES (1, 5, 'My Best Friend', GetDate())


--Tests--
SELECT * FROM Items
SELECT * FROM Categories
SELECT * FROM Fandoms
SELECT * FROM Ratings
SELECT * FROM Items it JOIN Categories ca ON it.fk_CategoryId = ca.pk_CategoryId WHERE ca.pk_CategoryId = 4
SELECT * FROM Items it JOIN Categories ca ON it.fk_CategoryId = ca.pk_CategoryId WHERE it.fk_FandomId = 1
SELECT * FROM Ratings WHERE fk_ItemId = 1
--Tests--

--DROP THAT ISH
DROP TABLE Ratings;
DROP TABLE Items;
DROP TABLE Fandoms;
DROP TABLE Categories;
