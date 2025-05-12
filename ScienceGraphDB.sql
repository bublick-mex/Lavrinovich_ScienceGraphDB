CREATE DATABASE ScienceGraphDB;
GO

USE ScienceGraphDB;
GO

CREATE TABLE Scientists (
    ScientistID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    BirthYear INT,
    DeathYear INT,
    Country NVARCHAR(50)
) AS NODE;

CREATE TABLE Discoveries (
    DiscoveryID INT PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Year INT,
    Description NVARCHAR(MAX)
) AS NODE;

CREATE TABLE Fields (
    FieldID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX)
) AS NODE;

CREATE TABLE MadeDiscovery AS EDGE;
CREATE TABLE BelongsToField AS EDGE;
CREATE TABLE Influenced AS EDGE;


INSERT INTO Scientists VALUES
(1, '������� ��������', 1879, 1955, '��������/���'),
(2, '����� ����', 1867, 1934, '������/�������'),
(3, '������ �����', 1856, 1943, '������/���'),
(4, '����� ������', 1643, 1727, '������'),
(5, '������ ������', 1809, 1882, '������'),
(6, '������� ���������', 1834, 1907, '������'),
(7, '������� �������', 1564, 1642, '������'),
(8, '������ ������', 1942, 2018, '������'),
(9, '�������� ��������', 1920, 1958, '������'),
(10, '����� ���', 1885, 1962, '�����'),
(11, '������ �������', 1918, 1988, '���');

INSERT INTO Discoveries VALUES
(1, '������ ���������������', 1905, '����� � ����������� ������ ���������������'),
(2, '���������������', 1896, '�������� ������� ���������������'),
(3, '���������� ���', 1888, '���������� ������� ����������� ����'),
(4, '����� ���������� ���������', 1687, '������ �������� � ����������'),
(5, '������ ��������', 1859, '������������� ����� ����� ������������� ������'),
(6, '������������� �������', 1869, '������������� ����� ���������� ���������'),
(7, '�������������', 1610, '������������� ����������������� �������'),
(8, '��������� �������', 1974, '������������� ������������ ��������� ������ ���'),
(9, '��������� ���', 1953, '������������� ��������� ���'),
(10, '������ �����', 1913, '��������� ������ �����'),
(11, '��������� ���������������', 1940, '������ ��������� ���������������');

INSERT INTO Fields VALUES
(1, '������', '����� � ������� � ��������� ������� � �������'),
(2, '�����', '����� � ��������� � �� ������������'),
(3, '��������', '����� � ����� ����������'),
(4, '����������', '����� � �������� ��������'),
(5, '����������', '����� � ����������, ������� � ����������'),
(6, '��������', '����� � ���������������� � ������������'),
(7, '��������� ��������', '������ ������, ��������� ��������� �������'),
(8, '���������������', '������ ������ �� ���������������� ��������'),
(9, '�������������', '������ ������ � �������� ��������'),
(10, '������� ������', '������ ������ � ����� ������');



INSERT INTO MadeDiscovery VALUES
((SELECT $node_id FROM Scientists WHERE ScientistID = 1), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 1)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 2), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 2)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 3), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 3)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 4), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 4)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 5), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 5)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 6), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 6)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 7), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 7)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 8), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 8)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 9), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 9)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 10), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 10)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 11), (SELECT $node_id FROM Discoveries WHERE DiscoveryID = 11));



INSERT INTO BelongsToField VALUES
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 1), (SELECT $node_id FROM Fields WHERE FieldID = 1)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 2), (SELECT $node_id FROM Fields WHERE FieldID = 2)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 3), (SELECT $node_id FROM Fields WHERE FieldID = 8)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 4), (SELECT $node_id FROM Fields WHERE FieldID = 1)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 5), (SELECT $node_id FROM Fields WHERE FieldID = 3)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 6), (SELECT $node_id FROM Fields WHERE FieldID = 2)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 7), (SELECT $node_id FROM Fields WHERE FieldID = 4)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 8), (SELECT $node_id FROM Fields WHERE FieldID = 7)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 9), (SELECT $node_id FROM Fields WHERE FieldID = 6)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 10), (SELECT $node_id FROM Fields WHERE FieldID = 7)),
((SELECT $node_id FROM Discoveries WHERE DiscoveryID = 11), (SELECT $node_id FROM Fields WHERE FieldID = 7));



INSERT INTO Influenced VALUES
((SELECT $node_id FROM Scientists WHERE ScientistID = 4), (SELECT $node_id FROM Scientists WHERE ScientistID = 1)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 7), (SELECT $node_id FROM Scientists WHERE ScientistID = 4)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 1), (SELECT $node_id FROM Scientists WHERE ScientistID = 10)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 10), (SELECT $node_id FROM Scientists WHERE ScientistID = 11)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 2), (SELECT $node_id FROM Scientists WHERE ScientistID = 9)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 6), (SELECT $node_id FROM Scientists WHERE ScientistID = 2)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 3), (SELECT $node_id FROM Scientists WHERE ScientistID = 8)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 5), (SELECT $node_id FROM Scientists WHERE ScientistID = 3)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 9), (SELECT $node_id FROM Scientists WHERE ScientistID = 6)),
((SELECT $node_id FROM Scientists WHERE ScientistID = 11), (SELECT $node_id FROM Scientists WHERE ScientistID = 8));

----Match----

-- ����� ���� ������ � ������� ������
SELECT s.Name, s.Country
FROM Scientists s, Discoveries d, Fields f, MadeDiscovery md, BelongsToField bf
WHERE MATCH(s-(md)->d-(bf)->f)
AND f.Name = '������';

-- ����� ��������, ��������� ������� �� ������
SELECT d.Title, d.Year
FROM Scientists s, Discoveries d, MadeDiscovery md
WHERE MATCH(s-(md)->d)
AND s.Country LIKE '%������%';

-- ����� ������, ���������� �� ������� ������� (����� ��� ��������)
SELECT s1.Name AS Influencer, s2.Name AS Influenced
FROM Scientists s1, Scientists s2, Influenced i
WHERE MATCH(s1-(i)->s2)
AND s2.Name = '������ ������';

-- ����� ������, ���������� � ��������� ��������
SELECT DISTINCT s.Name
FROM Scientists s, Discoveries d, Fields f, MadeDiscovery md, BelongsToField bf
WHERE MATCH(s-(md)->d-(bf)->f)
AND f.Name = '��������� ��������';

-- ����� ��������, ��������� � �������� ����� ����
SELECT d.Title, d.Year
FROM Scientists s, Discoveries d, Fields f, MadeDiscovery md, BelongsToField bf
WHERE MATCH(s-(md)->d-(bf)->f)
AND s.Name = '����� ����';

----Shortest_path----

--  ����� ���������� ���� ������� �� ������� ������� �� ������� ��������
SELECT Scientist1.Name AS StartScientist, 
       STRING_AGG(Scientist2.Name, ' -> ') WITHIN GROUP (GRAPH PATH) AS InfluenceChain,
       LAST_VALUE(Scientist2.Name) WITHIN GROUP (GRAPH PATH) AS EndScientist
FROM Scientists AS Scientist1,
     Scientists FOR PATH AS Scientist2,
     Influenced FOR PATH AS Influence
WHERE MATCH(SHORTEST_PATH(Scientist1(-(Influence)->Scientist2)+))
AND Scientist1.Name = '������� �������'
AND Scientist2.Name = '������ �������';

-- ����� ��� ��������� ���� ������� ������ �� 1 �� 3 ����� ����� �������� � ��������
SELECT Scientist1.Name AS StartScientist, 
       STRING_AGG(Scientist2.Name, ' -> ') WITHIN GROUP (GRAPH PATH) AS InfluenceChain,
       COUNT(Scientist2.Name) WITHIN GROUP (GRAPH PATH) AS PathLength
FROM Scientists AS Scientist1,
     Scientists FOR PATH AS Scientist2,
     Influenced FOR PATH AS Influence
WHERE MATCH(SHORTEST_PATH(Scientist1(-(Influence)->Scientist2){1,3}))
AND Scientist1.Name = '����� ������'
AND Scientist2.Name = '������ ������';

---- Power BI ----

SELECT 
    S1.ScientistID AS IdFirst,
    S1.Name AS First,
    CONCAT('Scientist', S1.ScientistID) AS [First image name],
    S2.ScientistID AS IdSecond,
    S2.Name AS Second,
    CONCAT('Scientist', S2.ScientistID) AS [Second image name]
FROM Scientists AS S1, Influenced AS F, Scientists AS S2
WHERE MATCH(S1-(F)->S2);

SELECT 
    S.ScientistID AS IdFirst,
    S.Name AS First,
    CONCAT('Scientist', S.ScientistID) AS [First image name],
    D.DiscoveryID AS IdSecond,
    D.Title AS Second,
    CONCAT('Discovery', D.DiscoveryID) AS [Second image name]
FROM Scientists AS S, MadeDiscovery AS F, Discoveries AS D
WHERE MATCH(S-(F)->D);

SELECT 
    D.DiscoveryID AS IdFirst,
    D.Title AS First,
    CONCAT('Discovery', D.DiscoveryID) AS [First image name],
    F.FieldID AS IdSecond,
    F.Name AS Second,
    CONCAT('Field', F.FieldID) AS [Second image name],
    'Field' AS [Connection Type]
FROM 
    Discoveries AS D,
    BelongsToField AS BF,
    Fields AS F
WHERE 
    MATCH(D-(BF)->F);