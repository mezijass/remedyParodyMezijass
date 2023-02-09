-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.26 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных laravel
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel`;

-- Дамп структуры для таблица laravel.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`,`card_id`),
  KEY `users_to_comments_user_id_idx` (`user_id`),
  KEY `incidents_to_comments_card_id_idx` (`card_id`),
  CONSTRAINT `incidents_to_comments_card_id` FOREIGN KEY (`card_id`) REFERENCES `incidents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.comments: ~14 rows (приблизительно)
DELETE FROM `comments`;
INSERT INTO `comments` (`id`, `comment_text`, `card_id`, `user_id`, `updated_at`, `created_at`) VALUES
	(1, 'Текст комментария', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Ещё', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'Новый комментарий', 1, 1, '2022-11-19 15:50:13', '2022-11-19 15:50:13'),
	(4, 'Ещё блин коммент', 1, 1, '2022-11-19 15:52:34', '2022-11-19 15:52:34'),
	(5, 'Мой новый комментарий по инциденту', 2, 1, '2022-11-19 16:37:34', '2022-11-19 16:37:34'),
	(6, 'Ещё один', 2, 1, '2022-11-19 16:38:23', '2022-11-19 16:38:23'),
	(7, '1234', 1, 3, '2022-12-01 09:58:34', '2022-12-01 09:58:34'),
	(8, 'новый коммент', 1, 3, '2022-12-11 14:02:51', '2022-12-11 14:02:51'),
	(9, '12', 15, 3, '2023-01-27 18:54:26', '2023-01-27 18:54:26'),
	(10, '123124', 15, 3, '2023-01-28 14:04:11', '2023-01-28 14:04:11'),
	(11, 'hfp hfp', 3, 3, '2023-01-29 12:14:14', '2023-01-29 12:14:14'),
	(12, 'ё2123', 3, 3, '2023-01-29 12:14:44', '2023-01-29 12:14:44'),
	(13, 'Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero. Its words and letters have been changed by addition or removal, so to deliberately render its content nonsensical; it\'s not genuine, correct, or comprehensible Latin anymore. While lorem ipsum\'s still resembles classical Latin, it actually has no meaning whatsoever. As Cicero\'s text doesn\'t contain the letters K, W, or Z, alien to latin, these, and others are often inserted randomly to mimic the typographic appearence of European languages, as are digraphs not to be found in the original.\r\n\r\nIn a professional context it often happens that private or corporate clients corder a publication to be made and presented with the actual content still not being ready. Think of a news blog that\'s filled with content hourly on the day of going live. However, reviewers tend to be distracted by comprehensible content, say, a random text copied from a newspaper or the internet. The are likely to focus on the text, disregarding the layout and its elements. Besides, random text risks to be unintendedly humorous or offensive, an unacceptable risk in corporate environments. Lorem ipsum and its many variants have been employed since the early 1960ies, and quite likely since the sixteenth century.', 3, 3, '2023-01-29 12:29:34', '2023-01-29 12:29:34'),
	(14, '5555', 5, 3, '2023-01-29 13:47:00', '2023-01-29 13:47:00'),
	(15, '1234', 15, 4, '2023-02-04 12:12:15', '2023-02-04 12:12:15'),
	(16, 'Первый комментарий Василия', 17, 4, '2023-02-04 12:34:37', '2023-02-04 12:34:37'),
	(17, '123', 17, 4, '2023-02-04 14:05:18', '2023-02-04 14:05:18'),
	(18, 'коммент', 17, 4, '2023-02-06 14:43:04', '2023-02-06 14:43:04');

-- Дамп структуры для таблица laravel.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.groups: ~3 rows (приблизительно)
DELETE FROM `groups`;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'Администратор', 'Полные права доступа'),
	(2, 'Редактор', 'Редактирование и удаление записей об инцидентах'),
	(3, 'Наблюдатель', 'Только просмотр записей');

-- Дамп структуры для таблица laravel.incidents
DROP TABLE IF EXISTS `incidents`;
CREATE TABLE IF NOT EXISTS `incidents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `solution` text COLLATE utf8mb4_unicode_ci,
  `user` int unsigned NOT NULL,
  `group_view` int unsigned NOT NULL,
  `status` int unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int unsigned NOT NULL,
  PRIMARY KEY (`id`,`status`,`group_view`,`user`,`created_by`),
  KEY `statuses_to_incidents_status_idx` (`status`),
  KEY `incident_groups_to_incidents_group_view_idx` (`group_view`),
  KEY `users_to_incidents_user_idx` (`user`),
  KEY `users_to_incidents_created_by_idx` (`created_by`),
  CONSTRAINT `incident_groups_to_incidents_group_view` FOREIGN KEY (`group_view`) REFERENCES `incident_groups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `statuses_to_incidents_status` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_incidents_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_incidents_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incidents: ~17 rows (приблизительно)
DELETE FROM `incidents`;
INSERT INTO `incidents` (`id`, `header`, `description`, `type`, `solution`, `user`, `group_view`, `status`, `updated_at`, `created_at`, `created_by`) VALUES
	(1, 'Новый инцидент для Теста', '1Описание инцидента, с которым должен разобраться Тест', 'Массовый', NULL, 1, 1, 3, '2022-12-13 16:39:19', '2022-11-11 13:05:04', 1),
	(2, 'Вылет при авторизации', 'Инцидент про вылет из приложения при попытке авторизации', 'Массовый', NULL, 2, 1, 2, '2022-11-30 18:01:34', '2022-11-19 16:36:22', 2),
	(3, '12', '12', 'Массовый', 'решение ldf ldf 123', 2, 6, 3, '2023-01-29 13:19:16', '2022-12-01 09:59:54', 3),
	(4, 'Два инцидент', 'Описание инцидента "Два инцидент"', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:26', '2022-12-01 10:32:26', 3),
	(5, 'Инцидент Три', 'Случилось непоправимое, горим, пользователи жалуются', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:30', '2022-12-01 10:32:30', 2),
	(6, 'Непрохождение платежей', 'Ну платежи не проходят например', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:35', '2022-12-01 10:32:35', 1),
	(7, 'Не играет контент Амедиатеки', '1У 100% пользователей не работают такие сериалы как Игра Престолов, Дом дракона. Пример 79999999999.', 'Массовый', NULL, 1, 1, 1, '2023-01-22 10:14:45', '2022-12-01 10:32:39', 3),
	(8, 'Test', 'Sed ut perspiciatis, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, qui dolorem eum fugiat, quo voluptas nulla pariatur?', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:43', '2022-12-01 10:32:43', 2),
	(9, 'Test2', 'Et harum quidem rerum facilis est et expedita distinctio, quis nostrum exercitationem ullam corporis suscipit laboriosam', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:49', '2022-12-01 10:32:49', 1),
	(10, 'Test4', 'qui ratione voluptatem sequi nesciunt, neque porro quisquam est, nisi ut aliquid ex ea commodi consequatur!', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:53', '2022-12-01 10:32:53', 3),
	(11, 'TEst5', 'Ut enim ad minima veniam, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, velit esse cillum dolore eu fugiat nulla pariatur?', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:57', '2022-12-01 10:32:57', 3),
	(12, 'Test6', 'Ut enim ad minima veniam, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:33:02', '2022-12-01 10:33:02', 3),
	(13, 'Все не работает', 'Вообще все.', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:33:09', '2022-12-01 10:33:09', 3),
	(14, 'Новый инцидент_заголовок', 'описание раз раз', 'Единичный', NULL, 3, 4, 1, '2022-12-11 14:04:13', '2022-12-11 14:04:13', 3),
	(15, 'У 100% пользователей наблюдается проблема с авторизацией', 'При авторизации в приложении пользователь получает сообщение об ошибке', 'Массовый', 'Выполнен откат релиза 1.3.2.4-1', 4, 4, 3, '2023-02-09 17:13:26', '2023-01-27 17:29:39', 3),
	(16, '227777', '3344567', 'Массовый', NULL, 2, 1, 1, '2023-01-28 10:21:00', '2023-01-28 10:21:00', 3),
	(17, 'Новый инцидент Василия Пупкина', 'описание2', 'Единичный', 'решение1', 4, 4, 1, '2023-02-06 14:43:24', '2023-02-04 12:21:06', 4);

-- Дамп структуры для таблица laravel.incident_groups
DROP TABLE IF EXISTS `incident_groups`;
CREATE TABLE IF NOT EXISTS `incident_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incident_groups: ~6 rows (приблизительно)
DELETE FROM `incident_groups`;
INSERT INTO `incident_groups` (`id`, `name`) VALUES
	(1, 'L1 OPS Product'),
	(2, 'L2 OPS Product'),
	(3, 'L3 Support Product'),
	(4, 'ВП Application Product'),
	(5, 'ВП Backend Product'),
	(6, 'Маркетинг и тарифы');

-- Дамп структуры для таблица laravel.incident_groups_users
DROP TABLE IF EXISTS `incident_groups_users`;
CREATE TABLE IF NOT EXISTS `incident_groups_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `incident_group_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`,`incident_group_id`),
  KEY `users_to_incident_groups_users_user_id_idx` (`user_id`),
  KEY `incident_groups_to_incident_groups_users_incident_group_id_idx` (`incident_group_id`),
  CONSTRAINT `incident_groups_to_incident_groups_users_incident_group_id` FOREIGN KEY (`incident_group_id`) REFERENCES `incident_groups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_incident_groups_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incident_groups_users: ~9 rows (приблизительно)
DELETE FROM `incident_groups_users`;
INSERT INTO `incident_groups_users` (`id`, `user_id`, `incident_group_id`, `updated_at`, `created_at`) VALUES
	(87, 3, 2, '2023-01-28 08:51:38', '2023-01-28 08:51:38'),
	(88, 3, 3, '2023-01-28 08:51:38', '2023-01-28 08:51:38'),
	(89, 3, 4, '2023-01-28 08:51:38', '2023-01-28 08:51:38'),
	(90, 3, 5, '2023-01-28 08:51:38', '2023-01-28 08:51:38'),
	(91, 3, 6, '2023-01-28 08:51:38', '2023-01-28 08:51:38'),
	(92, 4, 2, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(93, 4, 3, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(94, 4, 4, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(95, 4, 5, '2023-02-04 12:12:02', '2023-02-04 12:12:02');

-- Дамп структуры для таблица laravel.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.migrations: ~12 rows (приблизительно)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2022_10_26_145421_create_incidents_table', 2),
	(3, '2022_10_26_154001_create_usergroups_table', 3),
	(4, '2022_10_26_154329_create_groups_table', 4),
	(5, '2022_10_26_160147_create_incident_groups_table', 5),
	(6, '2022_10_26_161523_create_incident_groups_users_table', 6),
	(7, '2022_11_11_125337_create_incidents_table', 7),
	(8, '2022_11_11_130349_create_incidents_table', 8),
	(9, '2022_11_14_134315_create_statuses_table', 9),
	(10, '2022_11_14_140616_create_comments_table', 10),
	(11, '2022_11_14_142628_create_comments_table', 11),
	(12, '2023_01_28_091719_add_solution_and_created_by_in_incident', 12);

-- Дамп структуры для таблица laravel.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.personal_access_tokens: ~0 rows (приблизительно)
DELETE FROM `personal_access_tokens`;

-- Дамп структуры для таблица laravel.statuses
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.statuses: ~3 rows (приблизительно)
DELETE FROM `statuses`;
INSERT INTO `statuses` (`id`, `name`, `updated_at`, `created_at`) VALUES
	(1, 'Назначен', '2022-11-14 16:48:36', '2022-11-14 16:48:36'),
	(2, 'Взят в работу', '2022-11-14 16:48:36', '2022-11-14 16:48:36'),
	(3, 'Решён', '2022-11-14 16:48:36', '2022-11-14 16:48:36');

-- Дамп структуры для таблица laravel.usergroups
DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE IF NOT EXISTS `usergroups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.usergroups: ~0 rows (приблизительно)
DELETE FROM `usergroups`;
INSERT INTO `usergroups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1);

-- Дамп структуры для таблица laravel.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.users: ~4 rows (приблизительно)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Тест Тестов', 'test.testov@product.ru', NULL, '$2y$10$F.RqebCrjKMeqQg1jWXjqeKlig.C.7A3qwdiUNiEAZKRtNhKZy6ua', NULL, '2022-10-26 02:55:57', '2022-10-26 02:55:57'),
	(2, 'Тест Тестов2', 'test.testov2@product.ru', NULL, '$2y$10$GIDvqHZFCceVL1Hye5e0juQ0aAGCUWQTSC1Hgg3bLQM6DdqkGOgBO', NULL, '2022-10-29 09:12:18', '2022-10-29 09:12:18'),
	(3, 'Марков Максим Юрьевич', 'mezijass@gmail.com', NULL, '$2y$10$DULHy0s30OI0eo96JGOUHee0qvBBQzpKaSxSffF.PRD4kuarL1AZS', NULL, '2022-11-30 01:53:51', '2022-11-30 01:53:51'),
	(4, 'Пупкин Василий Геннадьевич', 'pupkin@mail.ru', NULL, '$2y$10$DULHy0s30OI0eo96JGOUHee0qvBBQzpKaSxSffF.PRD4kuarL1AZS', NULL, '2023-02-04 09:11:36', '2023-02-04 09:11:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
