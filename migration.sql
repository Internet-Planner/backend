--
-- Create model RevokedToken
--
CREATE TABLE `api_revokedtoken` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY);
--
-- Create model Event
--
CREATE TABLE `api_event` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `title` varchar(30) NOT NULL, `duration` date NOT NULL, `isLive` bool NOT NULL, `reccurence` varchar(30) NOT NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NULL);
--
-- Create model Planning
--
CREATE TABLE `api_planning` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(200) NOT NULL, `description` varchar(500) NOT NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NULL);
--
-- Create model Video
--
CREATE TABLE `api_video` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `link` varchar(200) NOT NULL, `description` varchar(500) NOT NULL, `thumbnail` varchar(200) NOT NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NULL);
--
-- Create model User
--
CREATE TABLE `api_user` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `password` varchar(128) NOT NULL, `last_login` datetime(6) NULL, `is_superuser` bool NOT NULL, `username` varchar(150) NOT NULL UNIQUE, `first_name` varchar(150) NOT NULL, `last_name` varchar(150) NOT NULL, `email` varchar(254) NOT NULL, `is_staff` bool NOT NULL, `is_active` bool NOT NULL, `date_joined` datetime(6) NOT NULL, `role` varchar(50) NOT NULL, `created_at` datetime(6) NOT NULL, `updated_at` datetime(6) NULL);
CREATE TABLE `api_user_groups` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `user_id` bigint NOT NULL, `group_id` integer NOT NULL);
CREATE TABLE `api_user_user_permissions` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `user_id` bigint NOT NULL, `permission_id` integer NOT NULL);
ALTER TABLE `api_user_groups` ADD CONSTRAINT `api_user_groups_user_id_group_id_9c7ddfb5_uniq` UNIQUE (`user_id`, `group_id`);
ALTER TABLE `api_user_groups` ADD CONSTRAINT `api_user_groups_user_id_a5ff39fa_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);
ALTER TABLE `api_user_groups` ADD CONSTRAINT `api_user_groups_group_id_3af85785_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
ALTER TABLE `api_user_user_permissions` ADD CONSTRAINT `api_user_user_permissions_user_id_permission_id_a06dd704_uniq` UNIQUE (`user_id`, `permission_id`);
ALTER TABLE `api_user_user_permissions` ADD CONSTRAINT `api_user_user_permissions_user_id_f3945d65_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);
ALTER TABLE `api_user_user_permissions` ADD CONSTRAINT `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);