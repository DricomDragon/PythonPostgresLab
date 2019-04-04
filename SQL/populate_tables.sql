-- Trucks
INSERT INTO truck(tru_id, tru_available)
VALUES
('AC-543-AG', true),
('AD-671-TR', true),
('AH-126-GG', true),
('AM-654-TU', true),
('BA-865-PF', true),
('BA-921-AA', false);

-- Drivers
INSERT INTO driver(dri_firstname, dri_lastname, dri_available, tru_id)
VALUES
('Arthur', 'DENT', true, 'AC-543-AG'),
('Henry', 'LE ROC’H', true, 'BA-865-PF'),
('Hervé', 'DUPUIS', true, 'AH-126-GG'),
('Jacques', 'WEBER', true, 'BA-921-AA');

-- Loadings docks
INSERT INTO postaladdress(
add_number, add_name, add_city)
VALUES
(5, 'allée Beltégueuse', 'Soumoulou'),
(15, 'rue des Rochers', 'Metz'),
(10, 'boulevard des marins', 'Nice');

INSERT INTO loadingpoint(add_id)
VALUES (1), (2), (3);

-- Companies
INSERT INTO postaladdress(add_id, add_number, add_name, add_city)
VALUES
(4, 12, 'boulevard Wezemir', 'Paris'),
(5, 1, 'cours Saint Pierre', 'Bordeaux'),
(6, 24, 'rue du pont', 'Angers');

INSERT INTO company(com_id, com_name, add_id)
VALUES
(1, 'Vegans Ltd', 4),
(2, 'Wizima', 5),
(3, 'SunnyCorp', 6);

-- Warehouses
INSERT INTO postaladdress(add_id, add_number, add_name, add_city)
VALUES
(7, 5, 'allée des rémouleurs', 'Pau'),
(8, 25, 'impasse des tulipes', 'Bayonne'),
(9, 2, 'rue des plantes', 'Marseille'),
(10, 67, 'rue des 5 portes', 'Brest'),
(11, 8, 'rue des marchands', 'Tarbes'),
(12, 1, 'rue de la braderie', 'Lille'),
(13, 32, 'impasse des lumières', 'Lyon'),
(14, 14, 'rue de la tour', 'Narbonne'),
(15, 7, 'impasse des 3 saules', 'Strasbourg');

INSERT INTO warehouse(com_id, add_id)
VALUES
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 11),
(2, 12),
(2, 13),
(3, 14),
(3, 15);

-- Orders
INSERT INTO product(pro_name)
VALUES
('Watermelon'),
('Potatoes'),
('Strawberries'),
('Peaches'),
('Kiwis'),
('Potatotes'),
('Oranges'),
('Leek');

INSERT INTO bookorder(ord_date, com_id)
VALUES
('2019-03-13 14:00:00', 1),
('2019-03-14 15:35:00', 2),
('2019-03-15 9:31:00', 3);

INSERT INTO ordereditem(ori_quantity, ori_deliveryduedate, pro_id, ord_id,
war_id)
VALUES
(300, '2019-11-15 14:00:00', 1, 1, 1),
(1000, '2019-11-15 14:00:00', 2, 1, 1),
(100, '2019-11-15 16:30:00', 3, 1, 2),
(1000, '2019-11-16 8:00:00', 4, 3, 8),
(100, '2019-11-16 8:00:00', 5, 3, 8),
(1000, '2019-11-16 8:00:00', 6, 3, 8),
(100, '2019-11-22 15:00:00', 7, 2, 7),
(200, '2019-11-22 15:00:00', 8, 2, 7);

-- Missions
INSERT INTO mission(lpt_id, tru_id, mis_loadingdate, dri_id)
VALUES
(1, 'AC-543-AG', '2019-11-14 18:00:00', 1),
(2, 'BA-865-PF', '2019-11-15 16:00:00', 2);

INSERT INTO ordereditemmission(ori_id, mis_id)
VALUES (1, 1), (2, 1), (4, 1), (5, 2);