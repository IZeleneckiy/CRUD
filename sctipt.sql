DROP SCHEMA IF EXISTS `test`;
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test`;
CREATE TABLE `book` (
`id` INT NOT NULL AUTO_INCREMENT,
`title` VARCHAR(255) NOT NULL,
`description` VARCHAR(255) NULL,
`author` VARCHAR(100) NOT NULL,
`isbn` VARCHAR(20) NULL,
`printYear` INT NOT NULL,
`readAlready` TINYINT NOT NULL,
PRIMARY KEY (`id`));
insert into book(title, description, author, isbn, printYear, readAlready)
values ('Title475266352', 'Description475266352', 'Author475266352', '475266352', 1944, 1),
('Title391447681', 'Description391447681', 'Author391447681', '391447681', 1935, 1),
('Title1935637221', 'Description1935637221', 'Author1935637221', '1935637221', 2004, 1),
('Title403424356', 'Description403424356', 'Author403424356', '403424356', 1943, 1),
('Title321142942', 'Description321142942', 'Author321142942', '321142942', 1945, 1),
('Title745160567', 'Description745160567', 'Author745160567', '745160567', 1922, 0),
('Title610984013', 'Description610984013', 'Author610984013', '610984013', 1932, 0),
('Title1644443712', 'Description1644443712', 'Author1644443712', '1644443712', 1939, 0),
('Title1393931310', 'Description1393931310', 'Author1393931310', '1393931310', 1912, 1),
('Title788117692', 'Description788117692', 'Author788117692', '788117692', 1992, 1),
('Title1566723494', 'Description1566723494', 'Author1566723494', '1566723494', 1909, 0),
('Title510113906', 'Description510113906', 'Author510113906', '510113906', 1940, 0),
('Title1622006612', 'Description1622006612', 'Author1622006612', '1622006612', 1981, 0),
('Title66233253', 'Description66233253', 'Author66233253', '66233253', 1904, 1),
('Title1286783232', 'Description1286783232', 'Author1286783232', '1286783232', 1910, 1),
('Title1874154700', 'Description1874154700', 'Author1874154700', '1874154700', 2002, 0),
('Title1632392469', 'Description1632392469', 'Author1632392469', '1632392469', 1964, 1),
('Title2008362258', 'Description2008362258', 'Author2008362258', '2008362258', 1905, 0),
('Title760563749', 'Description760563749', 'Author760563749', '760563749', 1976, 0),
('Title1753447031', 'Description1753447031', 'Author1753447031', '1753447031', 1974, 0),
('Title1810132623', 'Description1810132623', 'Author1810132623', '1810132623', 1907, 0),
('Title895947612', 'Description895947612', 'Author895947612', '895947612', 1929, 1),
('Title846492085', 'Description846492085', 'Author846492085', '846492085', 1935, 1),
('Title1096283470', 'Description1096283470', 'Author1096283470', '1096283470', 1940, 0),
('Title152005629', 'Description152005629', 'Author152005629', '152005629', 1920, 0),
('Title75457651', 'Description75457651', 'Author75457651', '75457651', 2001, 1),
('Title362239120', 'Description362239120', 'Author362239120', '362239120', 2018, 0),
('Title1796488937', 'Description1796488937', 'Author1796488937', '1796488937', 1960, 0),
('Title423031029', 'Description423031029', 'Author423031029', '423031029', 1997, 1),
('Title1712669532', 'Description1712669532', 'Author1712669532', '1712669532', 1902, 1),
('Title1225373914', 'Description1225373914', 'Author1225373914', '1225373914', 1970, 1),
('Title60830820', 'Description60830820', 'Author60830820', '60830820', 1946, 0),
('Title759156157', 'Description759156157', 'Author759156157', '759156157', 1911, 0),
('Title1635546341', 'Description1635546341', 'Author1635546341', '1635546341', 1970, 1),
('Title1698156408', 'Description1698156408', 'Author1698156408', '1698156408', 2017, 0),
('Title1740035246', 'Description1740035246', 'Author1740035246', '1740035246', 1989, 1),
('Title884457408', 'Description884457408', 'Author884457408', '884457408', 1986, 0),
('Title913190639', 'Description913190639', 'Author913190639', '913190639', 1953, 1),
('Title1845066581', 'Description1845066581', 'Author1845066581', '1845066581', 1917, 1),
('Title1018937824', 'Description1018937824', 'Author1018937824', '1018937824', 2015, 0);