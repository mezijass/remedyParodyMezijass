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
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` int NOT NULL,
  `user_id` int NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.comments: ~7 rows (приблизительно)
DELETE FROM `comments`;
INSERT INTO `comments` (`id`, `comment_text`, `card_id`, `user_id`, `updated_at`, `created_at`) VALUES
	(1, 'Текст комментария', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Ещё', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'Новый комментарий', 1, 1, '2022-11-19 15:50:13', '2022-11-19 15:50:13'),
	(4, 'Ещё блин коммент', 1, 1, '2022-11-19 15:52:34', '2022-11-19 15:52:34'),
	(5, 'Мой новый комментарий по инциденту', 2, 1, '2022-11-19 16:37:34', '2022-11-19 16:37:34'),
	(6, 'Ещё один', 2, 1, '2022-11-19 16:38:23', '2022-11-19 16:38:23'),
	(7, '1234', 1, 3, '2022-12-01 09:58:34', '2022-12-01 09:58:34');

-- Дамп структуры для таблица laravel.groups
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
CREATE TABLE IF NOT EXISTS `incidents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int NOT NULL,
  `group_view` int NOT NULL,
  `status` int NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incidents: ~13 rows (приблизительно)
DELETE FROM `incidents`;
INSERT INTO `incidents` (`id`, `header`, `description`, `type`, `user`, `group_view`, `status`, `updated_at`, `created_at`) VALUES
	(1, 'Новый инцидент для Теста', 'Описание инцидента, с которым должен разобраться Тест', 'Массовый', 3, 4, 1, '2022-12-01 10:33:23', '2022-11-11 13:05:04'),
	(2, 'Вылет при авторизации', 'Инцидент про вылет из приложения при попытке авторизации', 'Массовый', 2, 1, 2, '2022-11-30 18:01:34', '2022-11-19 16:36:22'),
	(3, 'Инцидент раз', 'Абра кадабра. 123лотываывьдлжукеls;ldkma;ldfkg;slkhfgl;b,m4534#$%$&^*&(%$#@', 'Массовый', 2, 6, 1, '2022-12-01 10:32:04', '2022-12-01 09:59:54'),
	(4, 'Два инцидент', 'Описание инцидента "Два инцидент"', 'Массовый', 1, 1, 1, '2022-12-01 10:32:26', '2022-12-01 10:32:26'),
	(5, 'Инцидент Три', 'Случилось непоправимое, горим, пользователи жалуются', 'Массовый', 1, 1, 1, '2022-12-01 10:32:30', '2022-12-01 10:32:30'),
	(6, 'Непрохождение платежей', 'Ну платежи не проходят например', 'Массовый', 1, 1, 1, '2022-12-01 10:32:35', '2022-12-01 10:32:35'),
	(7, 'Не играет контент Амедиатеки', 'У 100% пользователей не работают такие сериалы как Игра Престолов, Дом дракона. Пример 79999999999.', 'Массовый', 1, 1, 1, '2022-12-11 13:05:43', '2022-12-01 10:32:39'),
	(8, 'Test', 'Sed ut perspiciatis, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, qui dolorem eum fugiat, quo voluptas nulla pariatur?', 'Массовый', 1, 1, 1, '2022-12-01 10:32:43', '2022-12-01 10:32:43'),
	(9, 'Test2', 'Et harum quidem rerum facilis est et expedita distinctio, quis nostrum exercitationem ullam corporis suscipit laboriosam', 'Массовый', 1, 1, 1, '2022-12-01 10:32:49', '2022-12-01 10:32:49'),
	(10, 'Test4', 'qui ratione voluptatem sequi nesciunt, neque porro quisquam est, nisi ut aliquid ex ea commodi consequatur!', 'Массовый', 1, 1, 1, '2022-12-01 10:32:53', '2022-12-01 10:32:53'),
	(11, 'TEst5', 'Ut enim ad minima veniam, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, velit esse cillum dolore eu fugiat nulla pariatur?', 'Массовый', 1, 1, 1, '2022-12-01 10:32:57', '2022-12-01 10:32:57'),
	(12, 'Test6', 'Ut enim ad minima veniam, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Массовый', 1, 1, 1, '2022-12-01 10:33:02', '2022-12-01 10:33:02'),
	(13, 'Все не работает', 'Вообще все.', 'Массовый', 1, 1, 1, '2022-12-01 10:33:09', '2022-12-01 10:33:09');

-- Дамп структуры для таблица laravel.incident_groups
CREATE TABLE IF NOT EXISTS `incident_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
CREATE TABLE IF NOT EXISTS `incident_groups_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `incident_group_id` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incident_groups_users: ~6 rows (приблизительно)
DELETE FROM `incident_groups_users`;
INSERT INTO `incident_groups_users` (`id`, `user_id`, `incident_group_id`, `updated_at`, `created_at`) VALUES
	(65, 3, 1, '2022-12-01 10:00:00', '2022-12-01 10:00:00'),
	(66, 3, 2, '2022-12-01 10:00:00', '2022-12-01 10:00:00'),
	(67, 3, 3, '2022-12-01 10:00:00', '2022-12-01 10:00:00'),
	(68, 3, 4, '2022-12-01 10:00:00', '2022-12-01 10:00:00'),
	(69, 3, 5, '2022-12-01 10:00:00', '2022-12-01 10:00:00'),
	(70, 3, 6, '2022-12-01 10:00:00', '2022-12-01 10:00:00');

-- Дамп структуры для таблица laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.migrations: ~11 rows (приблизительно)
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
	(11, '2022_11_14_142628_create_comments_table', 11);

-- Дамп структуры для таблица laravel.personal_access_tokens
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
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
CREATE TABLE IF NOT EXISTS `usergroups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.usergroups: ~1 rows (приблизительно)
DELETE FROM `usergroups`;
INSERT INTO `usergroups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1);

-- Дамп структуры для таблица laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.users: ~3 rows (приблизительно)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Тест Тестов', 'test.testov@product.ru', NULL, '$2y$10$F.RqebCrjKMeqQg1jWXjqeKlig.C.7A3qwdiUNiEAZKRtNhKZy6ua', NULL, '2022-10-26 05:55:57', '2022-10-26 05:55:57'),
	(2, 'Тест Тестов2', 'test.testov2@product.ru', NULL, '$2y$10$GIDvqHZFCceVL1Hye5e0juQ0aAGCUWQTSC1Hgg3bLQM6DdqkGOgBO', NULL, '2022-10-29 12:12:18', '2022-10-29 12:12:18'),
	(3, 'Марков Максим Юрьевич', 'mezijass@gmail.com', NULL, '$2y$10$40thtBSxYjvxtQf7oGN3xuUWfXyUog4DZC8u9lXg//gRVq0xVbRaK', NULL, '2022-11-30 04:53:51', '2022-11-30 04:53:51');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
