# Day 05 - Бассейн SQL

## _Я улучшил свой SQL-запрос! Пожалуйста, предоставьте доказательства!_

Загрузите [скрипт](../materials/model.sql) с моделью базы данных здесь и примените его к своей базе данных (вы можете использовать командную строку с psql или просто запустить его через любую IDE, например DataGrip от JetBrains или pgAdmin от сообщества PostgreSQL).

![schema](../materials/schema.png)

1. **pizzeria** (Таблица-словарь с доступными пиццериями)
- id - первичный ключ (primary key)
- name - название пиццерии
- rating - средний рейтинг пиццерии (от 0 до 5 баллов)
2. **person** (Таблица-словарь с людьми, которые любят пиццу)
- id - первичный ключ
- name - имя человека
- age - возраст человека
- gender - пол человека
- address - адрес человека
3. **menu** (Таблица-словарь с доступным меню и ценой на конкретную пиццу)
- id - первичный ключ
- pizzeria_id - внешний ключ к пиццерии (foreign key)
- pizza_name - название пиццы в пиццерии
- price - цена конкретной пиццы
4. **person_visits** (Операционная таблица с информацией о посещениях пиццерии)
- id - первичный ключ
- person_id - внешний ключ к человеку
- pizzeria_id - внешний ключ к пиццерии
- visit_date - дата (например 2022-01-01) посещения человека
5. **person_order** (операционная таблица с информацией о заказах людей)
- id - первичный ключ
- person_id - внешний ключ к человеку
- menu_id - внешний ключ к меню
- order_date - дата (например 2022-01-01) заказа человека

Посещение лиц и заказ лиц являются разными сущностями и не содержат никакой корреляции между данными. Например, клиент может находиться в одном ресторане (просто просматривая меню) и в это время сделать заказ в другом по телефону или через мобильное приложение. Или другой случай, просто быть дома и снова сделать звонок с заказом без всяких визитов.

## Упражнение 00. Давайте создадим индексы для каждого внешнего ключа

Пожалуйста, создайте простой индекс BTree для каждого внешнего ключа в нашей базе данных. Шаблон имени должен удовлетворять следующему правилу «idx_{table_name}_{column_name}». Например, имя индекса BTree для столбца `pizzeria_id` в `menu` таблице — `idx_menu_pizzeria_id`.

## Упражнение 01. Как убедиться, что индекс работает?

Перед дальнейшими шагами напишите оператор SQL, который возвращает названия пицц и соответствующих им пиццерий. Пожалуйста, взгляните на пример результата ниже (сортировка не требуется).

| pizza_name | pizzeria_name |
| ------ | ------ |
| cheese pizza | Pizza Hut |
| ... | ... |

Давайте предоставим доказательства того, что ваши индексы работают для вашего SQL. Образец доказательства — это вывод `EXPLAIN ANALYZE` команды. Пожалуйста, взгляните на пример команды вывода.

    ...
    ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
    ...

**Подсказка**: подумайте, почему ваши индексы не работают напрямую и что нам нужно сделать, чтобы это включить?

## Упражнение 02. Формула находится в указателе. Это нормально?

Пожалуйста, создайте функциональный индекс B-Tree с именем `idx_person_name` для имени столбца `person` таблицы. Индекс должен содержать имена людей в верхнем регистре.

Пожалуйста, напишите и предоставьте любой SQL с доказательством ( `EXPLAIN ANALYZE` ), что индекс `idx_person_name` работает.

## Упражнение 03. Многоколоночный индекс для наших целей

Пожалуйста, создайте лучший многостолбцовый индекс B-Tree с именем `idx_person_order_multi` для приведенного ниже оператора SQL.

    SELECT person_id, menu_id,order_date
    FROM person_order
    WHERE person_id = 8 AND menu_id = 19;


Команда `EXPLAIN ANALYZE` должна вернуть следующий шаблон. Обратите внимание на сканирование "Index Only Scan"!

    Index Only Scan using idx_person_order_multi on person_order ...

Предоставьте любой SQL с доказательством ( `EXPLAIN ANALYZE` ), что индекс `idx_person_order_multi` работает.

## Упражнение 04. Уникальность данных

Создайте уникальный индекс BTree с именем `idx_menu_unique` в `menu` таблице `pizzeria_id` и `pizza_name` столбцах. Пожалуйста, напишите и предоставьте любой SQL с доказательством ( `EXPLAIN ANALYZE` ), что индекс `idx_menu_unique` работает.

## Упражнение 05. Частичная уникальность данных

Создайте частичный уникальный индекс BTree с именем `idx_person_order_order_date` в `person_order` таблице `person_id` и `menu_id` атрибутами с частичной уникальностью для `order_date` столбца на дату «2022-01-01».

Команда `EXPLAIN ANALYZE` должна вернуть следующий шаблон

    Index Only Scan using idx_person_order_order_date on person_order …

## Упражнение 06. Улучшим производительность

Пожалуйста, взгляните на приведенный ниже SQL с технической точки зрения (игнорируйте логический вариант этого оператора SQL).

    SELECT
        m.pizza_name AS pizza_name,
        max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
    FROM  menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    ORDER BY 1,2;

Создайте новый индекс BTree с именем `idx_1`, которое должно улучшить показатель «Время выполнения» этого SQL. Пожалуйста, предоставьте доказательство ( `EXPLAIN ANALYZE` ) того, что SQL был улучшен.

**Подсказка**: это упражнение выглядит как задача «грубой силы» по поиску хорошего покрывающего индекса, поэтому перед новым тестом удалите `idx_1` index.

Пример:

**До**:

    Sort  (cost=26.08..26.13 rows=19 width=53) (actual time=0.247..0.254 rows=19 loops=1)
    "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
    Sort Method: quicksort  Memory: 26kB
    ->  WindowAgg  (cost=25.30..25.68 rows=19 width=53) (actual time=0.110..0.182 rows=19 loops=1)
            ->  Sort  (cost=25.30..25.35 rows=19 width=21) (actual time=0.088..0.096 rows=19 loops=1)
                Sort Key: pz.rating
                Sort Method: quicksort  Memory: 26kB
                ->  Merge Join  (cost=0.27..24.90 rows=19 width=21) (actual time=0.026..0.060 rows=19 loops=1)
                        Merge Cond: (m.pizzeria_id = pz.id)
                        ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..12.42 rows=19 width=22) (actual time=0.013..0.029 rows=19 loops=1)
                            Heap Fetches: 19
                        ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.13..12.22 rows=6 width=15) (actual time=0.005..0.008 rows=6 loops=1)
    Planning Time: 0.711 ms
    Execution Time: 0.338 ms

**После**:

    Sort  (cost=26.28..26.33 rows=19 width=53) (actual time=0.144..0.148 rows=19 loops=1)
    "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
    Sort Method: quicksort  Memory: 26kB
    ->  WindowAgg  (cost=0.27..25.88 rows=19 width=53) (actual time=0.049..0.107 rows=19 loops=1)
            ->  Nested Loop  (cost=0.27..25.54 rows=19 width=21) (actual time=0.022..0.058 rows=19 loops=1)
                ->  Index Scan using idx_1 on …
                ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..2.19 rows=3 width=22) (actual time=0.004..0.005 rows=3 loops=6)
    …
    Planning Time: 0.338 ms
    Execution Time: 0.203 ms
