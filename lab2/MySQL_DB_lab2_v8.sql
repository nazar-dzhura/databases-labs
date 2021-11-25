-- 1.Отримати інформацію про комп’ютери, що
-- мають частоту процесора не менше 500 МГц та ціну нижче 800 дол.
-- Вихідні дані впорядкувати за спаданням за стовпцем price.
SELECT * FROM pc 
	WHERE speed >= 500 AND price < 800 
	ORDER BY price DESC;
    
-- 2. Вивести всі моделі ПК, у номерах яких є хоча б
-- дві одинички.    
SELECT model FROM pc 
	WHERE model LIKE '%1%1%';

-- 3. Для кораблів таблиці Ships вивести їх водотоннаж-
-- ність.
SELECT name, displacement FROM ships
	JOIN classes ON ships.class = classes.class;

-- 4. Знайти моделі та ціни ноутбуків, вартість яких є
-- вищою за вартість будь-якого ПК. Вивести: model, price.
SELECT * FROM laptop
	JOIN pc ON laptop.code = pc.code;
    
-- 5. Знайдіть виробників, які б випускали ноутбуки
-- зі швидкістю 500 МГц та нижче. Виведіть: maker.    
SELECT p.maker FROM laptop l 
	LEFT JOIN product p ON l.model = p.model
	WHERE l.speed <= 500;
    
-- 6. Вивести значення таблиці Ships із коментарями,
-- наприклад, 'name: California', 'class: Tennessee', 'launched: 1921'.    
SELECT * FROM ships
	WHERE name = 'California' AND class = 'Tennessee' AND launched = '1921';

-- 7. Визначіть дні, коли було виконано максимальну
-- кількість рейсів із міста 'Rostov'. Вивести: date, число рейсів.
SELECT time_out, COUNT(*) AS race_count FROM trip
	WHERE town_from ='Rostov'
    GROUP BY town_from
    HAVING MAX(race_count);
    
-- 8. Знайдіть виробників, які б випускали ноутбуки з
-- мінімальною швидкістю не менше 600 МГц. Вивести: maker,
-- мінімальна швидкість.
SELECT p.maker FROM laptop l
	LEFT JOIN product p ON l.model = p.model 
	WHERE l.speed >= 600;
    
-- 9. Визначити назви всіх кораблів із таблиці Ships, які
-- задовольняють, у крайньому випадку, комбінації будь-яких чотирьох
-- критеріїв із наступного списку: numGuns=8, bore=15,
-- displacement=32000, type='bb', country='USA', launched=1915,
-- class='Kongo'. Вивести: name, numGuns, bore, displacement, type,
-- country, launched, class. (Підказка: використати для перевірки умов
-- оператор CASE)
SELECT name, numGuns, bore, displacement, type, country, launched, classes.class FROM ships 
	JOIN classes ON ships.class = classes.class
    WHERE
		CASE WHEN numGuns = 8 THEN 1 ELSE 0 END +
		CASE WHEN bore = 15 THEN 1 ELSE 0 END +
		CASE WHEN displacement = 32000 THEN 1 ELSE 0 END +
		CASE WHEN type = 'bb' THEN 1 ELSE 0 END +
		CASE WHEN launched = 1915 THEN 1 ELSE 0 END +
		CASE WHEN ships.class = 'Kongo' THEN 1 ELSE 0 END +
		CASE WHEN country = 'USA' THEN 1 ELSE 0 END >= 4;

-- 10. Знайдіть класи, у які входять лише один або два
-- кораблі із цілої БД (врахувати також кораблі в таблиці Outcomes, яких
-- немає в таблиці Ships). Вивести: class, кількість кораблів у класі.
-- (Підказка: використовувати оператор UNION та операцію EXISTS)
SELECT class, 
(SELECT COUNT(*)
FROM Ships
WHERE Ships.class=Classes.class)
AS numOfShipsInClass
FROM Classes
WHERE EXISTS(SELECT * FROM Ships WHERE Ships.class=Classes.class)
UNION SELECT class,
(SELECT COUNT(*)
FROM Outcomes
WHERE Classes.class = Outcomes.ship
) AS numOfShipsInClass
FROM Classes
WHERE EXISTS(SELECT * FROM Outcomes WHERE Classes.class = Outcomes.ship)
AND NOT EXISTS(SELECT * FROM Ships WHERE Ships.class=Classes.class)

