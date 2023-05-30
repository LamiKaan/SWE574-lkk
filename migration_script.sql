-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: swe574-team2-mysql
-- Source Schemata: swe573-mysql
-- Created: Tue May  2 17:33:36 2023
-- Workbench Version: 8.0.31
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema swe574-team2-mysql
-- ----------------------------------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `swe574-team2-mysql` ;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.auth_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.auth_group_permissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`auth_group_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `swe574-team2-mysql`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `swe574-team2-mysql`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.auth_permission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `swe574-team2-mysql`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.auth_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.auth_user_groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`auth_user_groups` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `swe574-team2-mysql`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.auth_user_user_permissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`auth_user_user_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `swe574-team2-mysql`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.blog_post
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`blog_post` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `date_posted` DATETIME(6) NOT NULL,
  `author_id` INT NOT NULL,
  `link` VARCHAR(200) NOT NULL,
  `space_id` BIGINT NULL DEFAULT NULL,
  `image` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id` ASC) VISIBLE,
  INDEX `blog_post_space_id_e658ad6f_fk_spaces_space_id` (`space_id` ASC) VISIBLE,
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id`
    FOREIGN KEY (`author_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`),
  CONSTRAINT `blog_post_space_id_e658ad6f_fk_spaces_space_id`
    FOREIGN KEY (`space_id`)
    REFERENCES `swe574-team2-mysql`.`spaces_space` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.blog_post_favourites
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`blog_post_favourites` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `post_id` BIGINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `blog_post_favourites_post_id_user_id_560172ad_uniq` (`post_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `blog_post_favourites_user_id_1f52fbf7_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `blog_post_favourites_post_id_bfac44cf_fk_blog_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `swe574-team2-mysql`.`blog_post` (`id`),
  CONSTRAINT `blog_post_favourites_user_id_1f52fbf7_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.django_admin_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `swe574-team2-mysql`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.django_content_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.django_migrations
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`django_migrations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.django_session
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.spaces_privatespacerequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`spaces_privatespacerequest` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `date_created` DATETIME(6) NOT NULL,
  `space_id` BIGINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `spaces_privatespacerequest_space_id_23b30b0d_fk_spaces_space_id` (`space_id` ASC) VISIBLE,
  INDEX `spaces_privatespacerequest_user_id_9cc2370b_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `spaces_privatespacerequest_space_id_23b30b0d_fk_spaces_space_id`
    FOREIGN KEY (`space_id`)
    REFERENCES `swe574-team2-mysql`.`spaces_space` (`id`),
  CONSTRAINT `spaces_privatespacerequest_user_id_9cc2370b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.spaces_space
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`spaces_space` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `date_created` DATETIME(6) NOT NULL,
  `policy` VARCHAR(10) NOT NULL,
  `image` VARCHAR(100) NOT NULL,
  `owner_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `spaces_space_name_dab05914_uniq` (`name` ASC) VISIBLE,
  INDEX `spaces_space_owner_id_1379529a_fk_auth_user_id` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `spaces_space_owner_id_1379529a_fk_auth_user_id`
    FOREIGN KEY (`owner_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.spaces_spacemembership
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`spaces_spacemembership` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(20) NOT NULL,
  `space_id` BIGINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `spaces_spacemembership_user_id_space_id_fc78adca_uniq` (`user_id` ASC, `space_id` ASC) VISIBLE,
  INDEX `spaces_spacemembership_space_id_e59cb304_fk_spaces_space_id` (`space_id` ASC) VISIBLE,
  CONSTRAINT `spaces_spacemembership_space_id_e59cb304_fk_spaces_space_id`
    FOREIGN KEY (`space_id`)
    REFERENCES `swe574-team2-mysql`.`spaces_space` (`id`),
  CONSTRAINT `spaces_spacemembership_user_id_10f19539_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.taggit_tag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`taggit_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE,
  UNIQUE INDEX `slug` (`slug` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.taggit_taggeditem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`taggit_taggeditem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `object_id` INT NOT NULL,
  `content_type_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id` ASC, `object_id` ASC, `tag_id` ASC) VISIBLE,
  INDEX `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id` ASC) VISIBLE,
  INDEX `taggit_taggeditem_object_id_e2d7d1df` (`object_id` ASC) VISIBLE,
  INDEX `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id` ASC, `object_id` ASC) VISIBLE,
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `swe574-team2-mysql`.`django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id`
    FOREIGN KEY (`tag_id`)
    REFERENCES `swe574-team2-mysql`.`taggit_tag` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.users_profile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`users_profile` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(100) NOT NULL,
  `updated` DATETIME(6) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table swe574-team2-mysql.users_profile_following
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe574-team2-mysql`.`users_profile_following` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `profile_id` BIGINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_profile_following_profile_id_user_id_d811f5b1_uniq` (`profile_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `users_profile_following_user_id_d19300c2_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `users_profile_following_profile_id_e45bc273_fk_users_profile_id`
    FOREIGN KEY (`profile_id`)
    REFERENCES `swe574-team2-mysql`.`users_profile` (`id`),
  CONSTRAINT `users_profile_following_user_id_d19300c2_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `swe574-team2-mysql`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET FOREIGN_KEY_CHECKS = 1;
