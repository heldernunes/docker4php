DROP TABLE IF EXISTS `Product`;
CREATE TABLE `Product` (
	`productId` INT(11) NOT NULL AUTO_INCREMENT,
	`model` VARCHAR(500) NOT NULL COLLATE 'utf8_unicode_ci',
	`ram` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
  `hdd` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
  `location` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
	`memoryId` INT(11) NOT NULL,
	`discTypeId` INT(11) NOT NULL,
	`storageId` INT(11) NOT NULL,
	`currencyId` INT(11) NOT NULL,
	PRIMARY KEY (`productId`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

DROP TABLE IF EXISTS `Currency`;
CREATE TABLE `Currency` (
	`currencyId` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(500) NOT NULL COLLATE 'utf8_unicode_ci',
	`currency` VARCHAR(3) NOT NULL COLLATE 'utf8_unicode_ci',
  `symbol` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`currencyId`),
  UNIQUE INDEX `symbol` (`symbol`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

DROP TABLE IF EXISTS `Storage`;
CREATE TABLE `Storage` (
	`storageId` INT(11) NOT NULL AUTO_INCREMENT,
	`size` INT(3) NOT NULL DEFAULT 0,
	`scale` VARCHAR(3) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`storageId`),
  UNIQUE INDEX `size` (`size`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

CREATE TABLE `Memory` (
	`memoryId` INT(11) NOT NULL AUTO_INCREMENT,
	`size` INT(3) NOT NULL DEFAULT 0,
	`scale` VARCHAR(3) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`memoryId`),
  UNIQUE INDEX `size` (`size`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

DROP TABLE IF EXISTS `DiscType`;
CREATE TABLE `DiscType` (
	`discTypeId` INT(11) NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(4) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`discTypeId`),
  UNIQUE INDEX `type` (`type`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;


DROP TABLE IF EXISTS `Migrated`;
CREATE TABLE `Migrated` (
	`migratedId` INT(11) NOT NULL AUTO_INCREMENT,
	`file` VARCHAR(500) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci',
	`created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`migratedId`),
  UNIQUE INDEX `file` (`file`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO Currency (name, currency, symbol) VALUES ('euro', 'EUR', '€'), ('US Dollar', 'USD', '$'), ('Singapore Dollar', 'SGD', 'S$');

INSERT INTO Storage (size, scale) VALUES ('250', 'GB'), ('500', 'GB'),('1', 'TB'),('2', 'TB'),('3', 'TB'),('4', 'TB'),('8', 'TB'),('12', 'TB'),('24', 'TB'),('48', 'TB'),('72', 'TB');

INSERT INTO Memory (size, scale) VALUES ('2', 'GB'), ('4', 'GB'),('8', 'GB'),('12', 'GB'),('16', 'GB'),('24', 'GB'),('32', 'GB'),('48', 'GB'),('64', 'GB'),('96', 'GB');

INSERT INTO DiscType (type) VALUES ('SAS'), ('SATA'), ('SSD');
