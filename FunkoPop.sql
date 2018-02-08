CREATE TABLE Fandoms (
	FandomId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FandomName varchar(100) NOT NULL
)

CREATE TABLE Categories (
	CategoryId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CategoryName varchar(100) NOT NULL
)

CREATE TABLE Items (
	ItemId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FandomId INT NOT NULL REFERENCES Fandoms(FandomId),
	CategoryId INT NOT NULL REFERENCES Categories(CategoryId),
	ItemName varchar(100) NOT NULL,
	Active BIT DEFAULT (1),
	Price Decimal(19,2) NOT NULL
)

CREATE TABLE Ratings (
	RatingId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ItemId INT NOT NULL REFERENCES Items(ItemId),
	Rating INT NOT NULL,
	Comment TEXT,
	CommentDate DATETIME DEFAULT(GETDATE())
)

--Inserts
SET IDENTITY_INSERT Fandoms ON
	INSERT Fandoms (FandomId, FandomName) VALUES (1, 'Fallout')
	INSERT Fandoms (FandomId, FandomName) VALUES (2, 'Rick and Morty')
	INSERT Fandoms (FandomId, FandomName) VALUES (3, 'Borderlands')
	INSERT Fandoms (FandomId, FandomName) VALUES (4, 'DC')
	INSERT Fandoms (FandomId, FandomName) VALUES (5, 'Cuphead')
	INSERT Fandoms (FandomId, FandomName) VALUES (6, 'Simpsons')
SET IDENTITY_INSERT Fandoms OFF


SET IDENTITY_INSERT Categories ON
	INSERT Categories (CategoryId, CategoryName) VALUES (1, 'The Vault')
	INSERT Categories (CategoryId, CategoryName) VALUES (2, 'Keychain')
	INSERT Categories (CategoryId, CategoryName) VALUES (3, 'Rides')
	INSERT Categories (CategoryId, CategoryName) VALUES (4, 'Games')
	INSERT Categories (CategoryId, CategoryName) VALUES (5, 'Pen Topper')
	INSERT Categories (CategoryId, CategoryName) VALUES (6, 'Tees')
SET IDENTITY_INSERT Categories OFF

INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (2, 1, 'T-60 Power Armor', 1, 12.99)
INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (3, 2, 'Mad Max Rick', 1, 14.99)
INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (4, 3, 'Claptrap', 1, 9.99)
INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (4, 1, 'Vault Boy', 1, 12.99)
INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (5, 4, 'Bombshells', 1, 12.99)
INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (6, 5, 'Cuphead and Bosses', 1, 24.99)
INSERT Items (CategoryId, FandomId, ItemName, Active, Price) VALUES (1, 6, 'T-60 Power Armor', 0, 12.99)

INSERT Ratings (ItemId, Rating, Comment, CommentDate) VALUES (1, 3, 'Fancy Lil Lad', GetDate())
INSERT Ratings (ItemId, Rating, Comment, CommentDate) VALUES (1, 3, 'My New Homie', GetDate())
INSERT Ratings (ItemId, Rating, Comment, CommentDate) VALUES (1, 5, 'My Best Friend', GetDate())


--Tests--
SELECT * FROM Items
SELECT * FROM Categories
SELECT * FROM Fandoms
SELECT * FROM Ratings
SELECT * FROM Items it JOIN Categories ca ON it.CategoryId = ca.CategoryId WHERE ca.CategoryId = 4
SELECT * FROM Items it JOIN Categories ca ON it.CategoryId = ca.CategoryId WHERE it.FandomId = 1

SELECT
	ca.CategoryName,
	fa.FandomName,
	it.ItemName,
	it.Price
FROM
	Items it
	INNER JOIN Fandoms fa
		ON it.FandomId = fa.FandomId
	INNER JOIN Categories ca
		ON it.CategoryId = ca.CategoryId
	LEFT JOIN Ratings ra
		ON it.ItemId = ra.ItemId

--Tests--

--DROP THAT ISH
DROP TABLE Ratings;
DROP TABLE Items;
DROP TABLE Fandoms;
DROP TABLE Categories;

SELECT
	*
FROM
