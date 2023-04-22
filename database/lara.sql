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
  `card_id` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`,`card_id`),
  KEY `users_to_comments_user_id_idx` (`user_id`),
  KEY `incidents_to_comments_card_id_idx` (`card_id`),
  CONSTRAINT `incidents_to_comments_card_id` FOREIGN KEY (`card_id`) REFERENCES `incidents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.comments: ~14 rows (приблизительно)
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
	(18, 'коммент', 17, 4, '2023-02-06 14:43:04', '2023-02-06 14:43:04'),
	(19, 'Коллеги из L1 OPS Product, прошу проверить', 18, 3, '2023-02-18 15:48:14', '2023-02-18 15:48:14'),
	(20, '123', 3, 3, '2023-02-21 15:23:44', '2023-02-21 15:23:44'),
	(21, '123', 17, 5, '2023-03-03 07:52:05', '2023-03-03 07:52:05'),
	(22, 'Коллеги', 21, 5, '2023-03-03 07:58:27', '2023-03-03 07:58:27'),
	(23, 'цйуцуц', 2, 3, '2023-03-11 12:49:04', '2023-03-11 12:49:04'),
	(24, '12', 16, 6, '2023-03-11 13:48:30', '2023-03-11 13:48:30'),
	(25, '132214', 16, 6, '2023-03-11 13:57:11', '2023-03-11 13:57:11'),
	(26, '54', 27, 3, '2023-03-16 15:16:13', '2023-03-16 15:16:13'),
	(27, '12345', 29, 3, '2023-03-27 23:15:23', '2023-03-27 23:15:23'),
	(28, 'новый комментарий к инциденту Виталия', 30, 7, '2023-04-11 22:44:00', '2023-04-11 22:44:00'),
	(29, '123', 28, 3, '2023-04-13 10:51:11', '2023-04-13 10:51:11');

-- Дамп структуры для таблица laravel.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.grade: ~3 rows (приблизительно)
INSERT INTO `grade` (`id`, `name`) VALUES
	(1, 'Старший инженер'),
	(2, 'Инженер'),
	(3, 'Стажер');

-- Дамп структуры для таблица laravel.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.groups: ~3 rows (приблизительно)
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
  `solution` text COLLATE utf8mb4_unicode_ci,
  `user` int unsigned NOT NULL,
  `group_view` int unsigned NOT NULL,
  `status` int unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int unsigned NOT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `priority_id` int unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`,`status`,`group_view`,`user`,`created_by`,`priority_id`),
  KEY `statuses_to_incidents_status_idx` (`status`),
  KEY `incident_groups_to_incidents_group_view_idx` (`group_view`),
  KEY `users_to_incidents_user_idx` (`user`),
  KEY `users_to_incidents_created_by_idx` (`created_by`),
  KEY `priority_to_incidents_priority_id` (`priority_id`),
  CONSTRAINT `incident_groups_to_incidents_group_view` FOREIGN KEY (`group_view`) REFERENCES `incident_groups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `priority_to_incidents_priority_id` FOREIGN KEY (`priority_id`) REFERENCES `priority` (`id`),
  CONSTRAINT `statuses_to_incidents_status` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_incidents_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_to_incidents_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incidents: ~28 rows (приблизительно)
INSERT INTO `incidents` (`id`, `header`, `description`, `type`, `solution`, `user`, `group_view`, `status`, `updated_at`, `created_at`, `created_by`, `resolved_at`, `deadline`, `priority_id`) VALUES
	(1, 'Новый инцидент для Теста', '1Описание инцидента, с которым должен разобраться Тест', 'Массовый', NULL, 1, 1, 3, '2023-03-11 16:25:38', '2022-11-11 13:05:04', 1, '2023-03-11 16:25:38', '2023-03-15 15:51:59', 4),
	(2, 'Вылет при авторизации', 'Инцидент про вылет из приложения при попытке авторизации', 'Массовый', NULL, 3, 5, 1, '2023-03-11 12:48:57', '2022-11-19 16:36:22', 2, NULL, '2023-03-25 15:51:59', 4),
	(3, '12', '12', 'Массовый', 'решение ldf ldf 123', 4, 6, 1, '2023-02-21 15:24:12', '2022-12-01 09:59:54', 3, NULL, '2023-03-25 15:51:59', 4),
	(4, 'Два инцидент', 'Описание инцидента "Два инцидент"', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:26', '2022-12-01 10:32:26', 3, NULL, '2023-03-25 15:51:59', 4),
	(5, 'Инцидент Три', 'Случилось непоправимое, горим, пользователи жалуются', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:30', '2022-12-01 10:32:30', 2, NULL, '2023-03-25 15:51:59', 4),
	(6, 'Непрохождение платежей', 'Ну платежи не проходят например', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:35', '2022-12-01 10:32:35', 1, NULL, '2023-03-25 15:51:59', 4),
	(7, 'Не играет контент Амедиатеки', '1У 100% пользователей не работают такие сериалы как Игра Престолов, Дом дракона. Пример 79999999999.', 'Массовый', NULL, 1, 1, 1, '2023-01-22 10:14:45', '2022-12-01 10:32:39', 3, NULL, '2023-03-25 15:51:59', 4),
	(8, 'Test', 'Sed ut perspiciatis, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, qui dolorem eum fugiat, quo voluptas nulla pariatur?', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:43', '2022-12-01 10:32:43', 2, NULL, '2023-03-25 15:51:59', 4),
	(9, 'Test2', 'Et harum quidem rerum facilis est et expedita distinctio, quis nostrum exercitationem ullam corporis suscipit laboriosam', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:49', '2022-12-01 10:32:49', 1, NULL, '2023-03-25 15:51:59', 4),
	(10, 'Test4', 'qui ratione voluptatem sequi nesciunt, neque porro quisquam est, nisi ut aliquid ex ea commodi consequatur!', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:53', '2022-12-01 10:32:53', 3, NULL, '2023-03-25 15:51:59', 4),
	(11, 'TEst5', 'Ut enim ad minima veniam, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, velit esse cillum dolore eu fugiat nulla pariatur?', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:32:57', '2022-12-01 10:32:57', 3, NULL, '2023-03-25 15:51:59', 4),
	(12, 'Test6', 'Ut enim ad minima veniam, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:33:02', '2022-12-01 10:33:02', 3, NULL, '2023-03-25 15:51:59', 4),
	(13, 'Все не работает', 'Вообще все.', 'Массовый', NULL, 1, 1, 1, '2022-12-01 10:33:09', '2022-12-01 10:33:09', 3, NULL, '2023-03-25 15:51:59', 4),
	(14, 'Новый инцидент_заголовок', 'описание раз раз', 'Единичный', NULL, 3, 4, 1, '2022-12-11 14:04:13', '2022-12-11 14:04:13', 3, NULL, '2023-03-25 15:51:59', 4),
	(15, 'У 100% пользователей наблюдается проблема с авторизацией', 'При авторизации в приложении пользователь получает сообщение об ошибке', 'Массовый', 'Выполнен откат релиза 1.3.2.4-1', 2, 2, 4, '2023-03-11 13:43:32', '2023-01-27 17:29:39', 3, '2023-03-11 16:26:11', '2023-03-25 15:51:59', 4),
	(16, '227777', '334456711323', 'Массовый', 'Выполнен откат релиза 1.3.2.4-1', 4, 5, 4, '2023-03-11 13:57:36', '2023-01-28 10:21:00', 3, '2023-03-11 16:26:11', '2023-03-25 15:51:59', 4),
	(17, 'Новый инцидент Василия Пупкина 12', 'описание2123123', 'Единичный', 'решение1123', 1, 5, 1, '2023-03-03 07:51:59', '2023-02-04 12:21:06', 4, NULL, '2023-03-25 15:51:59', 4),
	(18, 'Ошибка при авторизации', 'Пользователь 79195203322 получает ошибку при авторизации в приложении.', 'Единичный', NULL, 4, 1, 1, '2023-02-18 15:45:16', '2023-02-18 15:45:16', 3, NULL, '2023-03-25 15:51:59', 4),
	(19, 'Ошибка при просмотре сериала "Друзья"', 'При попытке воспроизведения сериала "Друзья" клиент получает ошибку возспроизведения.', 'Единичный', NULL, 4, 2, 1, '2023-02-18 15:50:32', '2023-02-18 15:50:32', 3, NULL, '2023-03-25 15:51:59', 4),
	(20, '12345', 'asdf', 'Единичный', NULL, 3, 3, 1, '2023-02-21 15:24:50', '2023-02-21 15:24:50', 3, NULL, '2023-03-25 15:51:59', 4),
	(21, '123', 'asdf', 'Единичный', NULL, 4, 5, 1, '2023-03-11 10:20:15', '2023-03-03 07:52:28', 5, NULL, '2023-03-25 15:51:59', 4),
	(22, 'Ошибка при воспроизведении контента', 'Ошибка при проигрывании контента "Холодное сердце"', 'Единичный', NULL, 5, 6, 1, '2023-03-11 12:27:05', '2023-03-11 10:37:56', 3, NULL, '2023-03-25 15:51:59', 4),
	(23, 'Инцидент Паши', 'Инцидент Паши', 'Единичный', NULL, 3, 6, 1, '2023-03-11 13:34:44', '2023-03-11 13:34:44', 6, NULL, '2023-03-25 15:51:59', 4),
	(24, 'тест приоритета', 'описание тест приоритета', 'Единичный', NULL, 5, 4, 1, '2023-03-11 14:25:32', '2023-03-11 14:25:32', 6, NULL, '2023-03-25 15:51:59', 3),
	(25, 'тест приоритета', 'описание тест приоритета', 'Единичный', NULL, 3, 3, 1, '2023-03-19 11:16:26', '2023-03-11 14:26:42', 6, NULL, '2023-03-25 15:51:59', 2),
	(26, 'тест дедлайна', 'тест дедлайна', 'Единичный', 'Выполнен откат релиза 1.3.2.4-1', 4, 3, 3, '2023-03-19 09:48:07', '2023-03-11 15:51:59', 6, '2023-03-19 09:48:07', '2023-03-19 15:51:59', 4),
	(27, 'тест дедлайна22', 'тест дедлайна22', 'Массовый', 'Выполнен откат релиза 1.3.2.4-1', 3, 5, 4, '2023-03-16 15:16:25', '2023-03-11 16:53:03', 6, '2023-03-11 16:53:15', '2023-03-10 16:53:03', 2),
	(28, '123', '54', 'Единичный', 'Выполнен откат релиза 1.3.2.4-1', 2, 1, 3, '2023-03-16 15:17:36', '2023-03-16 15:17:22', 3, '2023-03-16 15:17:36', '2023-03-10 15:17:22', 1),
	(29, 'последний тест', 'описание последнего теста', 'Массовый', '12345', 4, 2, 2, '2023-03-27 23:15:26', '2023-03-27 23:14:48', 3, NULL, '2023-03-29 23:14:48', 2),
	(30, 'Заголовок нового инцидента', 'Описание тестового инцидента \r\nизменение описания', 'Единичный', NULL, 7, 2, 1, '2023-04-11 22:42:52', '2023-04-11 22:41:37', 7, NULL, '2023-04-18 22:41:37', 3),
	(31, '123', '123', 'Массовый', NULL, 1, 3, 4, '2023-04-13 10:50:47', '2023-04-13 10:50:18', 3, '2023-04-13 10:50:31', '2023-04-14 10:50:18', 1),
	(32, '123', '@extends(\'header\')\r\n\r\n@section(\'main-content\')\r\n\r\n    <div class="container">\r\n        <div class="row">\r\n            <div class="col">\r\n\r\n                <select class="form-select" name="user" style="margin-top: 60px;" onchange="document.location=this.options[this.selectedIndex].value">\r\n                    @if(request(\'id\'))\r\n                        {{--Имя в селекторе если он уже выбран--}}\r\n                        <option>{{\\App\\Models\\User::find(request(\'id\'))->name}}</option>\r\n                    @else\r\n                        <option>Выберите пользователя для редактирования команд</option>\r\n                    @endif\r\n                    @foreach(\\App\\Models\\User::all() as $user)\r\n                        <option value="user_groups?id={{$user->id}}">{{$user->name}}</option>\r\n                    @endforeach\r\n                </select>\r\n                <br>\r\n                <br>\r\n                @if(request("id"))\r\n\r\n                    <h4 style="text-align: center">Список команд, в которые входит пользователь:</h4>\r\n                    <table class="table table-secondary">\r\n                        <thead>\r\n                        <tr>\r\n                            <th scope="col">Название команды</th>\r\n                            <th scope="col">Доступ</th>\r\n                        </tr>\r\n                        </thead>\r\n                        <tbody>\r\n                        <form action="/check_categories">\r\n                        @foreach(\\App\\Models\\incident_groups::all() as $cat)\r\n                                @php\r\n                                    // эта переменная HTML - атрибут checked, изначально не выставленный\r\n                                    $st = "";\r\n                                @endphp\r\n                                @if(@count(\\App\\Models\\incident_groups_user::all()->where(\'user_id\',\'=\',request(\'id\'))->where(\'incident_group_id\',\'=\',$cat->id)) > 0)\r\n                                    @php\r\n                                        // но если в базе мы видим что на данного пользователя назначена данная группа, то загружаем галочку\r\n                                        $st = "checked";\r\n                                    @endphp\r\n\r\n                                @endif\r\n                            <tr>\r\n                                <th scope="col">{{$cat->name}}</th>\r\n                                <th scope="col"><input name="check_{{$cat->id}}" type="checkbox" {{$st}}></th>\r\n                            </tr>\r\n                        @endforeach\r\n\r\n\r\n                        </tbody>\r\n                    </table>\r\n                    <input type="hidden" value="{{request(\'id\')}}" name="uid">\r\n                    <button class="btn btn-success">Сохранить</button>\r\n                    </form>\r\n                    <br>\r\n                @endif\r\n\r\n            </div>\r\n        </div>\r\n    </div>\r\n\r\n@endsection()', 'Единичный', NULL, 3, 1, 1, '2023-04-13 10:54:01', '2023-04-13 10:54:01', 3, NULL, '2023-04-17 10:54:01', 2);

-- Дамп структуры для таблица laravel.incident_groups
CREATE TABLE IF NOT EXISTS `incident_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incident_groups: ~6 rows (приблизительно)
INSERT INTO `incident_groups` (`id`, `name`) VALUES
	(1, 'L1 OPS Product'),
	(2, 'L2 OPS Product'),
	(3, 'L3 Support Product'),
	(4, 'ВП Application Product'),
	(5, 'ВП Backend Product'),
	(6, 'Маркетинг и тарифы');

-- Дамп структуры для таблица laravel.incident_groups_users
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.incident_groups_users: ~18 rows (приблизительно)
INSERT INTO `incident_groups_users` (`id`, `user_id`, `incident_group_id`, `updated_at`, `created_at`) VALUES
	(92, 4, 2, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(93, 4, 3, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(94, 4, 4, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(95, 4, 5, '2023-02-04 12:12:02', '2023-02-04 12:12:02'),
	(107, 5, 4, '2023-03-03 07:50:46', '2023-03-03 07:50:46'),
	(108, 5, 6, '2023-03-03 07:50:46', '2023-03-03 07:50:46'),
	(109, 2, 1, '2023-03-11 12:28:05', '2023-03-11 12:28:05'),
	(110, 2, 2, '2023-03-11 12:28:05', '2023-03-11 12:28:05'),
	(121, 3, 1, '2023-03-16 15:15:39', '2023-03-16 15:15:39'),
	(122, 3, 3, '2023-03-16 15:15:39', '2023-03-16 15:15:39'),
	(123, 3, 4, '2023-03-16 15:15:39', '2023-03-16 15:15:39'),
	(124, 3, 5, '2023-03-16 15:15:39', '2023-03-16 15:15:39'),
	(125, 3, 6, '2023-03-16 15:15:39', '2023-03-16 15:15:39'),
	(126, 1, 2, '2023-03-27 23:16:28', '2023-03-27 23:16:28'),
	(127, 1, 3, '2023-03-27 23:16:28', '2023-03-27 23:16:28'),
	(128, 7, 1, '2023-04-11 22:39:34', '2023-04-11 22:39:34'),
	(129, 7, 2, '2023-04-11 22:39:34', '2023-04-11 22:39:34'),
	(130, 7, 3, '2023-04-11 22:39:34', '2023-04-11 22:39:34'),
	(131, 7, 6, '2023-04-11 22:39:34', '2023-04-11 22:39:34');

-- Дамп структуры для таблица laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.migrations: ~15 rows (приблизительно)
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
	(12, '2023_01_28_091719_add_solution_and_created_by_in_incident', 12),
	(13, '2023_03_02_205759_add_groups_id_and_grade_id_in_users', 13),
	(14, '2023_03_02_210446_create_grade_table', 14),
	(16, '2023_03_11_111026_create_priority_table', 15);

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

-- Дамп структуры для таблица laravel.priority
CREATE TABLE IF NOT EXISTS `priority` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.priority: ~4 rows (приблизительно)
INSERT INTO `priority` (`id`, `name`) VALUES
	(1, 'Наивысший'),
	(2, 'Высокий'),
	(3, 'Средний'),
	(4, 'Низкий');

-- Дамп структуры для таблица laravel.statuses
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.statuses: ~3 rows (приблизительно)
INSERT INTO `statuses` (`id`, `name`, `updated_at`, `created_at`) VALUES
	(1, 'Назначен', '2022-11-14 16:48:36', '2022-11-14 16:48:36'),
	(2, 'Взят в работу', '2022-11-14 16:48:36', '2022-11-14 16:48:36'),
	(3, 'Решён', '2022-11-14 16:48:36', '2022-11-14 16:48:36'),
	(4, 'Закрыт', '2023-03-11 16:35:23', '2023-03-11 16:35:23');

-- Дамп структуры для таблица laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups_id` int unsigned NOT NULL DEFAULT '3',
  `grade_id` int unsigned NOT NULL DEFAULT '3',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`groups_id`,`grade_id`),
  KEY `groups_to_users_idx` (`groups_id`),
  KEY `grade_to_users_idx` (`grade_id`),
  CONSTRAINT `grade_to_users_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `groups_to_users_groups_id` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы laravel.users: ~5 rows (приблизительно)
INSERT INTO `users` (`id`, `name`, `email`, `groups_id`, `grade_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Тест Тестов', 'test.testov@product.ru', 3, 3, NULL, '$2y$10$F.RqebCrjKMeqQg1jWXjqeKlig.C.7A3qwdiUNiEAZKRtNhKZy6ua', NULL, '2022-10-26 02:55:57', '2022-10-26 02:55:57'),
	(2, 'Тест Тестов2', 'test.testov2@product.ru', 3, 3, NULL, '$2y$10$GIDvqHZFCceVL1Hye5e0juQ0aAGCUWQTSC1Hgg3bLQM6DdqkGOgBO', NULL, '2022-10-29 09:12:18', '2022-10-29 09:12:18'),
	(3, 'Марков Максим Юрьевич', 'mezijass@gmail.com', 1, 1, NULL, '$2y$10$DULHy0s30OI0eo96JGOUHee0qvBBQzpKaSxSffF.PRD4kuarL1AZS', NULL, '2022-11-30 01:53:51', '2022-11-30 01:53:51'),
	(4, 'Пупкин Василий Геннадьевич', 'pupkin@mail.ru', 2, 2, NULL, '$2y$10$DULHy0s30OI0eo96JGOUHee0qvBBQzpKaSxSffF.PRD4kuarL1AZS', NULL, '2023-02-04 09:11:36', '2023-02-04 09:11:36'),
	(5, 'Смирнов Иван Сергеевич', 'ivan@mail.ru', 1, 1, NULL, '$2y$10$WM64im/L/nq5bVbp3EEb0uXqf/1X4BTW6iGil8JSnRUPVOWs2QrmO', NULL, '2023-03-03 04:50:26', '2023-03-03 04:50:26'),
	(6, 'Гуськов Павел Михайлович', 'gus@mail.ru', 3, 3, NULL, '$2y$10$pZzfuN/hO6zAGxZcsUK3GOmx30w2sjNSA48CL6Mfy/muYBZ2JBL9u', NULL, '2023-03-11 10:33:13', '2023-03-11 10:33:13'),
	(7, 'Бетхер Виталий', 'bether@mail.ru', 3, 3, NULL, '$2y$10$FBMNAEvIg4xsbvPqLTtU5.dL4k/4NMd2sXvrJnIlDP4MMmtfVomKu', NULL, '2023-04-11 19:37:05', '2023-04-11 19:37:05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
