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
(1, 'Альберт Эйнштейн', 1879, 1955, 'Германия/США'),
(2, 'Мария Кюри', 1867, 1934, 'Польша/Франция'),
(3, 'Никола Тесла', 1856, 1943, 'Сербия/США'),
(4, 'Исаак Ньютон', 1643, 1727, 'Англия'),
(5, 'Чарльз Дарвин', 1809, 1882, 'Англия'),
(6, 'Дмитрий Менделеев', 1834, 1907, 'Россия'),
(7, 'Галилео Галилей', 1564, 1642, 'Италия'),
(8, 'Стивен Хокинг', 1942, 2018, 'Англия'),
(9, 'Розалинд Франклин', 1920, 1958, 'Англия'),
(10, 'Нильс Бор', 1885, 1962, 'Дания'),
(11, 'Рихард Фейнман', 1918, 1988, 'США');

INSERT INTO Discoveries VALUES
(1, 'Теория относительности', 1905, 'Общая и специальная теория относительности'),
(2, 'Радиоактивность', 1896, 'Открытие явления радиоактивности'),
(3, 'Переменный ток', 1888, 'Разработка системы переменного тока'),
(4, 'Закон всемирного тяготения', 1687, 'Законы движения и гравитации'),
(5, 'Теория эволюции', 1859, 'Происхождение видов путем естественного отбора'),
(6, 'Периодическая таблица', 1869, 'Периодический закон химических элементов'),
(7, 'Гелиоцентризм', 1610, 'Подтверждение гелиоцентрической системы'),
(8, 'Излучение Хокинга', 1974, 'Теоретическое предсказание излучения черных дыр'),
(9, 'Структура ДНК', 1953, 'Рентгеновская дифракция ДНК'),
(10, 'Модель атома', 1913, 'Квантовая модель атома'),
(11, 'Квантовая электродинамика', 1940, 'Теория квантовой электродинамики');

INSERT INTO Fields VALUES
(1, 'Физика', 'Наука о природе и свойствах материи и энергии'),
(2, 'Химия', 'Наука о веществах и их превращениях'),
(3, 'Биология', 'Наука о живых организмах'),
(4, 'Астрономия', 'Наука о небесных объектах'),
(5, 'Математика', 'Наука о структурах, порядке и отношениях'),
(6, 'Генетика', 'Наука о наследственности и изменчивости'),
(7, 'Квантовая механика', 'Раздел физики, изучающий квантовые системы'),
(8, 'Электродинамика', 'Раздел физики об электромагнитных явлениях'),
(9, 'Термодинамика', 'Раздел физики о тепловых явлениях'),
(10, 'Ядерная физика', 'Раздел физики о ядрах атомов');



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

-- Найти всех ученых в области физики
SELECT s.Name, s.Country
FROM Scientists s, Discoveries d, Fields f, MadeDiscovery md, BelongsToField bf
WHERE MATCH(s-(md)->d-(bf)->f)
AND f.Name = 'Физика';

-- Найти открытия, сделанные учеными из Англии
SELECT d.Title, d.Year
FROM Scientists s, Discoveries d, MadeDiscovery md
WHERE MATCH(s-(md)->d)
AND s.Country LIKE '%Англия%';

-- Найти ученых, повлиявших на Стивена Хокинга (прямо или косвенно)
SELECT s1.Name AS Influencer, s2.Name AS Influenced
FROM Scientists s1, Scientists s2, Influenced i
WHERE MATCH(s1-(i)->s2)
AND s2.Name = 'Стивен Хокинг';

-- Найти ученых, работавших в квантовой механике
SELECT DISTINCT s.Name
FROM Scientists s, Discoveries d, Fields f, MadeDiscovery md, BelongsToField bf
WHERE MATCH(s-(md)->d-(bf)->f)
AND f.Name = 'Квантовая механика';

-- Найти открытия, связанные с работами Марии Кюри
SELECT d.Title, d.Year
FROM Scientists s, Discoveries d, Fields f, MadeDiscovery md, BelongsToField bf
WHERE MATCH(s-(md)->d-(bf)->f)
AND s.Name = 'Мария Кюри';

----Shortest_path----

--  Найти кратчайший путь влияния от Галилео Галилея до Ричарда Фейнмана
SELECT Scientist1.Name AS StartScientist, 
       STRING_AGG(Scientist2.Name, ' -> ') WITHIN GROUP (GRAPH PATH) AS InfluenceChain,
       LAST_VALUE(Scientist2.Name) WITHIN GROUP (GRAPH PATH) AS EndScientist
FROM Scientists AS Scientist1,
     Scientists FOR PATH AS Scientist2,
     Influenced FOR PATH AS Influence
WHERE MATCH(SHORTEST_PATH(Scientist1(-(Influence)->Scientist2)+))
AND Scientist1.Name = 'Галилео Галилей'
AND Scientist2.Name = 'Рихард Фейнман';

-- Найти все возможные пути влияния длиной от 1 до 3 шагов между Ньютоном и Хокингом
SELECT Scientist1.Name AS StartScientist, 
       STRING_AGG(Scientist2.Name, ' -> ') WITHIN GROUP (GRAPH PATH) AS InfluenceChain,
       COUNT(Scientist2.Name) WITHIN GROUP (GRAPH PATH) AS PathLength
FROM Scientists AS Scientist1,
     Scientists FOR PATH AS Scientist2,
     Influenced FOR PATH AS Influence
WHERE MATCH(SHORTEST_PATH(Scientist1(-(Influence)->Scientist2){1,3}))
AND Scientist1.Name = 'Исаак Ньютон'
AND Scientist2.Name = 'Стивен Хокинг';

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