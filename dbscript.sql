/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-01-10 21:40:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for concepts
-- ----------------------------
DROP TABLE IF EXISTS `concepts`;
CREATE TABLE `concepts` (
  `idconcept` int(11) NOT NULL,
  `idlesson` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `video_url` varchar(250) DEFAULT NULL,
  `concept_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idconcept`),
  KEY `fk_concepts_lessons1_idx` (`idlesson`),
  CONSTRAINT `fk_concepts_lessons1` FOREIGN KEY (`idlesson`) REFERENCES `lessons` (`idlesson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of concepts
-- ----------------------------

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `idcourse` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `released_date` varchar(45) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `slogan` varchar(1000) DEFAULT NULL,
  `idskill_level` int(11) NOT NULL,
  `cost` decimal(15,2) DEFAULT NULL,
  `timeline` varchar(45) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idcourse`),
  KEY `fk_courses_skill_levels_idx` (`idskill_level`),
  CONSTRAINT `fk_courses_skill_levels` FOREIGN KEY (`idskill_level`) REFERENCES `skill_levels` (`idskill_level`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('1', 'Intro to HTML and CSS', '01-03-2009', 'In this introductory programming class, you’ll learn Object-Oriented Programming, a must-have technique for software engineers that will allow you to reuse and share code easily. You’ll learn by doing, and will build byte-sized (ha!) mini projects in each lesson to learn and practice programming concepts.We’ve heard that programming can be intimidating.', 'Not Your Typical Intro to Web Dev', '1', '0.00', '6', '1');
INSERT INTO `courses` VALUES ('2', 'Programming Foundations with Python', '01-02-2007', 'Learn Object-Oriented Programming', 'In this introductory programming class, you’ll learn Object-Oriented Programming, a must-have technique for software engineers that will allow you to reuse and share code easily. You’ll learn by doing, and will build byte-sized (ha!) mini projects in each lesson to learn and practice programming concepts.We’ve heard that programming can be intimidating.', '1', '0.00', '6', '1');
INSERT INTO `courses` VALUES ('3', 'Developing Scalable Apps in Python', '01-02-2010', 'Feel the Power of Google App Engine', 'You will learn about challenges of building applications that can serve hundreds of thousands of users, and how you can prepare for them as a developer. And more importantly - you will learn how to harness the power of App Engine ', '3', '0.00', '6', '1');
INSERT INTO `courses` VALUES ('4', 'Advanced Ruby', '01-02-2010', 'Scale it up With Ruby', 'In this Intermediate Course You will learn how to make a scale app with ruby', '2', '0.00', '4', '0');

-- ----------------------------
-- Table structure for courses_categories
-- ----------------------------
DROP TABLE IF EXISTS `courses_categories`;
CREATE TABLE `courses_categories` (
  `idcourse_categories` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcourse_categories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_categories
-- ----------------------------
INSERT INTO `courses_categories` VALUES ('1', 'Web Development');
INSERT INTO `courses_categories` VALUES ('2', 'Android');
INSERT INTO `courses_categories` VALUES ('3', 'Software Engineering');
INSERT INTO `courses_categories` VALUES ('4', 'Data Sciencie');

-- ----------------------------
-- Table structure for courses_providers
-- ----------------------------
DROP TABLE IF EXISTS `courses_providers`;
CREATE TABLE `courses_providers` (
  `idcourse_provider` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idcourse_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_providers
-- ----------------------------

-- ----------------------------
-- Table structure for courses_reviews
-- ----------------------------
DROP TABLE IF EXISTS `courses_reviews`;
CREATE TABLE `courses_reviews` (
  `idreview` int(11) NOT NULL,
  `idcourse` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idreview`),
  KEY `fk_courses_reviews_courses1_idx` (`idcourse`),
  CONSTRAINT `fk_courses_reviews_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for courses_vs_categories
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_categories`;
CREATE TABLE `courses_vs_categories` (
  `idcourse` int(11) NOT NULL,
  `idcourse_categories` int(11) NOT NULL,
  KEY `fk_courses_vs_categories_courses1_idx` (`idcourse`),
  KEY `fk_courses_vs_categories_course_categories1_idx` (`idcourse_categories`),
  CONSTRAINT `fk_courses_vs_categories_course_categories1` FOREIGN KEY (`idcourse_categories`) REFERENCES `courses_categories` (`idcourse_categories`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_vs_categories_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_categories
-- ----------------------------
INSERT INTO `courses_vs_categories` VALUES ('1', '1');
INSERT INTO `courses_vs_categories` VALUES ('2', '1');
INSERT INTO `courses_vs_categories` VALUES ('3', '1');
INSERT INTO `courses_vs_categories` VALUES ('4', '1');

-- ----------------------------
-- Table structure for courses_vs_programs
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_programs`;
CREATE TABLE `courses_vs_programs` (
  `idcourse` int(11) NOT NULL,
  `idprogram` int(11) NOT NULL,
  KEY `fk_courses_vs_programs_courses1_idx` (`idcourse`),
  KEY `fk_courses_vs_programs_programs1_idx` (`idprogram`),
  CONSTRAINT `fk_courses_vs_programs_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_vs_programs_programs1` FOREIGN KEY (`idprogram`) REFERENCES `programs` (`idprogram`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_programs
-- ----------------------------
INSERT INTO `courses_vs_programs` VALUES ('1', '1');
INSERT INTO `courses_vs_programs` VALUES ('2', '1');
INSERT INTO `courses_vs_programs` VALUES ('1', '2');

-- ----------------------------
-- Table structure for courses_vs_providers
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_providers`;
CREATE TABLE `courses_vs_providers` (
  `idcourse` int(11) NOT NULL,
  `idcourse_provider` int(11) NOT NULL,
  KEY `fk_courses_vs_providers_courses1_idx` (`idcourse`),
  KEY `fk_courses_vs_providers_course_providers1_idx` (`idcourse_provider`),
  CONSTRAINT `fk_courses_vs_providers_course_providers1` FOREIGN KEY (`idcourse_provider`) REFERENCES `courses_providers` (`idcourse_provider`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_vs_providers_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_providers
-- ----------------------------

-- ----------------------------
-- Table structure for courses_vs_requeriments
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_requeriments`;
CREATE TABLE `courses_vs_requeriments` (
  `idcourse` int(11) NOT NULL,
  `idrequeriment` int(11) NOT NULL,
  KEY `fk_courses_vs_requeriments_courses1_idx` (`idcourse`),
  KEY `fk_courses_vs_requeriments_requeriments1_idx` (`idrequeriment`),
  CONSTRAINT `fk_courses_vs_requeriments_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_vs_requeriments_requeriments1` FOREIGN KEY (`idrequeriment`) REFERENCES `requeriments` (`idrequeriment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_requeriments
-- ----------------------------

-- ----------------------------
-- Table structure for courses_vs_teachers
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_teachers`;
CREATE TABLE `courses_vs_teachers` (
  `idcourse` int(11) NOT NULL,
  `idteacher` int(11) NOT NULL,
  KEY `fk_teachers_vs_courses_courses1_idx` (`idcourse`),
  KEY `fk_teachers_vs_courses_teachers1_idx` (`idteacher`),
  CONSTRAINT `fk_teachers_vs_courses_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_vs_courses_teachers1` FOREIGN KEY (`idteacher`) REFERENCES `teachers` (`idteacher`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_teachers
-- ----------------------------

-- ----------------------------
-- Table structure for courses_vs_technologies
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_technologies`;
CREATE TABLE `courses_vs_technologies` (
  `idcourse` int(11) NOT NULL,
  `idtecnology` int(11) NOT NULL,
  KEY `fk_courses_vs_technologies_courses1_idx` (`idcourse`),
  KEY `fk_courses_vs_technologies_technologies1_idx` (`idtecnology`),
  CONSTRAINT `fk_courses_vs_technologies_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_vs_technologies_technologies1` FOREIGN KEY (`idtecnology`) REFERENCES `technologies` (`idtecnology`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_technologies
-- ----------------------------
INSERT INTO `courses_vs_technologies` VALUES ('1', '2');
INSERT INTO `courses_vs_technologies` VALUES ('1', '3');
INSERT INTO `courses_vs_technologies` VALUES ('2', '1');

-- ----------------------------
-- Table structure for courses_vs_users
-- ----------------------------
DROP TABLE IF EXISTS `courses_vs_users`;
CREATE TABLE `courses_vs_users` (
  `idcourse` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `registered_date` date DEFAULT NULL,
  KEY `fk_courses_vs_users_courses1_idx` (`idcourse`),
  KEY `fk_courses_vs_users_users1_idx` (`iduser`),
  CONSTRAINT `fk_courses_vs_users_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_vs_users_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_vs_users
-- ----------------------------

-- ----------------------------
-- Table structure for employers
-- ----------------------------
DROP TABLE IF EXISTS `employers`;
CREATE TABLE `employers` (
  `idemployer` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idemployer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employers
-- ----------------------------

-- ----------------------------
-- Table structure for lessons
-- ----------------------------
DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons` (
  `idlesson` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lesson_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlesson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lessons
-- ----------------------------

-- ----------------------------
-- Table structure for lessons_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `lessons_descriptions`;
CREATE TABLE `lessons_descriptions` (
  `idlesson` int(11) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  KEY `fk_lesson_descriptions_lessons1_idx` (`idlesson`),
  CONSTRAINT `fk_lesson_descriptions_lessons1` FOREIGN KEY (`idlesson`) REFERENCES `lessons` (`idlesson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lessons_descriptions
-- ----------------------------

-- ----------------------------
-- Table structure for programs
-- ----------------------------
DROP TABLE IF EXISTS `programs`;
CREATE TABLE `programs` (
  `idprogram` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `slogan` varchar(1000) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `cost` decimal(15,2) DEFAULT NULL,
  `is_plus` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `timeline` int(11) DEFAULT NULL,
  `released_date` date DEFAULT NULL,
  PRIMARY KEY (`idprogram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programs
-- ----------------------------
INSERT INTO `programs` VALUES ('1', 'full stack web developer', 'Build Complex Web Applications', 'This program will prepare you for a job as a Full Stack Web Developer, and teach you to build complex server-side web applications that use powerful relational databases to persistently store data', '200.00', '1', '1', '6', null);
INSERT INTO `programs` VALUES ('2', 'front end stack web developer', 'Create Stunning User Experiences', 'Master the skills required to become a Front-End Web Developer, and start building beautiful, responsive websites optimized for mobile and desktop performance.', '200.00', '1', '1', '6', null);
INSERT INTO `programs` VALUES ('3', 'beginning ruby nanodegree ', 'Learn to Build Web Applications', 'In this program, you’ll be learning Ruby, a modern programming language that reads almost like English, making it perfect for beginners! This will prepare you to learn Ruby on Rails, a powerful framework which uses Ruby and powers websites like GitHub, Groupon, and Twitter', '200.00', '1', '0', '6', null);

-- ----------------------------
-- Table structure for programs_reviews
-- ----------------------------
DROP TABLE IF EXISTS `programs_reviews`;
CREATE TABLE `programs_reviews` (
  `idreview` int(11) NOT NULL,
  `idprogram` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idreview`),
  KEY `fk_programs_reviews_programs1_idx` (`idprogram`),
  CONSTRAINT `fk_programs_reviews_programs1` FOREIGN KEY (`idprogram`) REFERENCES `programs` (`idprogram`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programs_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for programs_vs_projects
-- ----------------------------
DROP TABLE IF EXISTS `programs_vs_projects`;
CREATE TABLE `programs_vs_projects` (
  `idprogram` int(11) NOT NULL,
  `idprojects` int(11) NOT NULL,
  KEY `fk_programs_vs_projects_programs1_idx` (`idprogram`),
  KEY `fk_programs_vs_projects_projects1_idx` (`idprojects`),
  CONSTRAINT `fk_programs_vs_projects_programs1` FOREIGN KEY (`idprogram`) REFERENCES `programs` (`idprogram`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programs_vs_projects_projects1` FOREIGN KEY (`idprojects`) REFERENCES `projects` (`idprojects`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programs_vs_projects
-- ----------------------------

-- ----------------------------
-- Table structure for programs_vs_requeriments
-- ----------------------------
DROP TABLE IF EXISTS `programs_vs_requeriments`;
CREATE TABLE `programs_vs_requeriments` (
  `idcourse` int(11) NOT NULL,
  `idrequeriment` int(11) NOT NULL,
  KEY `fk_programs_vs_requeriments_courses1_idx` (`idcourse`),
  KEY `fk_programs_vs_requeriments_requeriments1_idx` (`idrequeriment`),
  CONSTRAINT `fk_programs_vs_requeriments_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programs_vs_requeriments_requeriments1` FOREIGN KEY (`idrequeriment`) REFERENCES `requeriments` (`idrequeriment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programs_vs_requeriments
-- ----------------------------

-- ----------------------------
-- Table structure for programs_vs_users
-- ----------------------------
DROP TABLE IF EXISTS `programs_vs_users`;
CREATE TABLE `programs_vs_users` (
  `idprogram` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `registered_date` date DEFAULT NULL,
  `finished_date` date DEFAULT NULL,
  KEY `fk_programs_vs_users_programs1_idx` (`idprogram`),
  KEY `fk_programs_vs_users_users1_idx` (`iduser`),
  CONSTRAINT `fk_programs_vs_users_programs1` FOREIGN KEY (`idprogram`) REFERENCES `programs` (`idprogram`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programs_vs_users_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programs_vs_users
-- ----------------------------

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `idprojects` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `released_date` date DEFAULT NULL,
  PRIMARY KEY (`idprojects`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects
-- ----------------------------

-- ----------------------------
-- Table structure for projects_supported_courses
-- ----------------------------
DROP TABLE IF EXISTS `projects_supported_courses`;
CREATE TABLE `projects_supported_courses` (
  `idprojects` int(11) NOT NULL,
  `idcourse` int(11) NOT NULL,
  KEY `fk_projects_supported_courses_projects1_idx` (`idprojects`),
  KEY `fk_projects_supported_courses_courses1_idx` (`idcourse`),
  CONSTRAINT `fk_projects_supported_courses_courses1` FOREIGN KEY (`idcourse`) REFERENCES `courses` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_supported_courses_projects1` FOREIGN KEY (`idprojects`) REFERENCES `projects` (`idprojects`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects_supported_courses
-- ----------------------------

-- ----------------------------
-- Table structure for quizzes
-- ----------------------------
DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes` (
  `idquiz` int(11) NOT NULL,
  `idlesson` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idquiz`),
  KEY `fk_quizzes_lessons1_idx` (`idlesson`),
  CONSTRAINT `fk_quizzes_lessons1` FOREIGN KEY (`idlesson`) REFERENCES `lessons` (`idlesson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quizzes
-- ----------------------------

-- ----------------------------
-- Table structure for requeriments
-- ----------------------------
DROP TABLE IF EXISTS `requeriments`;
CREATE TABLE `requeriments` (
  `idrequeriment` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrequeriment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requeriments
-- ----------------------------

-- ----------------------------
-- Table structure for skill_levels
-- ----------------------------
DROP TABLE IF EXISTS `skill_levels`;
CREATE TABLE `skill_levels` (
  `idskill_level` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idskill_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skill_levels
-- ----------------------------
INSERT INTO `skill_levels` VALUES ('1', 'beginner');
INSERT INTO `skill_levels` VALUES ('2', 'intermediate');
INSERT INTO `skill_levels` VALUES ('3', 'advanced');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `idteacher` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idteacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers
-- ----------------------------

-- ----------------------------
-- Table structure for technologies
-- ----------------------------
DROP TABLE IF EXISTS `technologies`;
CREATE TABLE `technologies` (
  `idtecnology` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtecnology`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technologies
-- ----------------------------
INSERT INTO `technologies` VALUES ('1', 'Python');
INSERT INTO `technologies` VALUES ('2', 'HTML');
INSERT INTO `technologies` VALUES ('3', 'CSS');
INSERT INTO `technologies` VALUES ('4', 'javascript');
INSERT INTO `technologies` VALUES ('5', 'postgresql');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for users_success
-- ----------------------------
DROP TABLE IF EXISTS `users_success`;
CREATE TABLE `users_success` (
  `iduser` int(11) NOT NULL,
  `idprogram` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `idemployer` int(11) NOT NULL,
  KEY `fk_users_success_users1_idx` (`iduser`),
  KEY `fk_users_success_programs1_idx` (`idprogram`),
  KEY `fk_users_success_Employers1_idx` (`idemployer`),
  CONSTRAINT `fk_users_success_Employers1` FOREIGN KEY (`idemployer`) REFERENCES `employers` (`idemployer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_success_programs1` FOREIGN KEY (`idprogram`) REFERENCES `programs` (`idprogram`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_success_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_success
-- ----------------------------

-- ----------------------------
-- Table structure for users_vs_concepts
-- ----------------------------
DROP TABLE IF EXISTS `users_vs_concepts`;
CREATE TABLE `users_vs_concepts` (
  `iduser` int(11) NOT NULL,
  `idconcept` int(11) NOT NULL,
  `taken_date` date DEFAULT NULL,
  KEY `fk_users_vs_content_users1_idx` (`iduser`),
  KEY `fk_users_vs_content_concepts1_idx` (`idconcept`),
  CONSTRAINT `fk_users_vs_content_concepts1` FOREIGN KEY (`idconcept`) REFERENCES `concepts` (`idconcept`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_vs_content_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_vs_concepts
-- ----------------------------
