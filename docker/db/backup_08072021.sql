/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.2.36-MariaDB-log : Database - backend_labo_r7
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`backend_labo_r7` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `backend_labo_r7`;

/*Table structure for table `lnk_client_projet` */

DROP TABLE IF EXISTS `lnk_client_projet`;

CREATE TABLE `lnk_client_projet` (
  `client_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`projet_id`),
  KEY `projet_id` (`projet_id`),
  CONSTRAINT `lnk_client_projet_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_client` (`client_id`),
  CONSTRAINT `lnk_client_projet_ibfk_2` FOREIGN KEY (`projet_id`) REFERENCES `tbl_projets` (`projet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lnk_client_projet` */

/*Table structure for table `lnk_projet_chantiers` */

DROP TABLE IF EXISTS `lnk_projet_chantiers`;

CREATE TABLE `lnk_projet_chantiers` (
  `chantier_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`chantier_id`,`projet_id`),
  KEY `projet_id` (`projet_id`),
  CONSTRAINT `lnk_projet_chantiers_ibfk_2` FOREIGN KEY (`chantier_id`) REFERENCES `tbl_chantiers` (`chantier_id`),
  CONSTRAINT `lnk_projet_chantiers_ibfk_3` FOREIGN KEY (`projet_id`) REFERENCES `tbl_projets` (`projet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lnk_projet_chantiers` */

/*Table structure for table `mail_tbl_mail` */

DROP TABLE IF EXISTS `mail_tbl_mail`;

CREATE TABLE `mail_tbl_mail` (
  `regle_id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mail_type_id` int(11) NOT NULL,
  `mail_object` varchar(255) NOT NULL,
  `mail_expediteur` varchar(64) DEFAULT NULL,
  `mail_destinataire` varchar(512) NOT NULL,
  `mail_cc` varchar(512) DEFAULT NULL,
  `mail_bcc` varchar(512) DEFAULT NULL,
  `mail_body` text DEFAULT NULL,
  `mail_vue_data` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`regle_id`,`user_id`),
  KEY `FK_mail_tbl_mail_mail_type_id` (`mail_type_id`),
  CONSTRAINT `mail_tbl_mail_FK_1` FOREIGN KEY (`regle_id`) REFERENCES `mail_tbl_regle` (`regle_id`),
  CONSTRAINT `mail_tbl_mail_FK_2` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_tbl_mail_type` (`mail_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mail_tbl_mail` */

/*Table structure for table `mail_tbl_mail_type` */

DROP TABLE IF EXISTS `mail_tbl_mail_type`;

CREATE TABLE `mail_tbl_mail_type` (
  `mail_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_type_lib` varchar(64) NOT NULL,
  `mail_type_objet` varchar(255) NOT NULL,
  `mail_type_expediteur` varchar(64) DEFAULT NULL,
  `mail_type_cc` varchar(512) DEFAULT NULL,
  `mail_type_bcc` varchar(512) DEFAULT NULL,
  `mail_type_actif` tinyint(1) NOT NULL DEFAULT 1,
  `mail_type_body` text DEFAULT NULL,
  PRIMARY KEY (`mail_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `mail_tbl_mail_type` */

insert  into `mail_tbl_mail_type`(`mail_type_id`,`mail_type_lib`,`mail_type_objet`,`mail_type_expediteur`,`mail_type_cc`,`mail_type_bcc`,`mail_type_actif`,`mail_type_body`) values 
(1,'Nouvelle intervention liée au modele inconu','Nouvelle intervention liée au modele inconu','karim.amguir@gmail.com',NULL,NULL,1,'<p>Bonjour,</p>\r\n\r\n<p>Vous avez une nouvelle intervention li&eacute;e a un mod&egrave;le inconu&nbsp;!</p>\r\n\r\n<p>Merci d&#39;intervenir sur le lien suivant : {lien}</p>\r\n\r\n<p>Cordialement,</p>\r\n\r\n<p><u><strong>Votre &eacute;quipe Group-LFE.</strong></u></p>'),
(2,'New outil tentative','Nouvel Outil tentative !','karim.amguir@gmail.com',NULL,NULL,1,'<p><span style=\"font-size:small\"><span style=\"font-family:arial,helvetica,sans-serif\">Bonjour,</span></span></p>\r\n\r\n<p><span style=\"font-family:arial,helvetica,sans-serif; font-size:small\">Vous avez un nouvel outil de type tentative !</span></p>\r\n\r\n<p>Merci d&#39;intervenir sur le lien suivant : {lien}</p>\r\n\r\n<p><span style=\"font-size:small\"><span style=\"font-family:arial,helvetica,sans-serif\">Cordialement,</span></span></p>\r\n\r\n<p><u><strong><span style=\"font-size:small\"><span style=\"font-family:arial,helvetica,sans-serif\">Votre &eacute;quipe Group-LFE.</span></span></strong></u><br />\r\n&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"left:-43px; position:absolute; top:129.333px\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>'),
(3,'New pdr tentative','New pdr tentative','karim.amguir@gmail.com',NULL,NULL,1,'<p>Bonjour,</p>\r\n\r\n<p>Vous avez un nouveau produit de type tentative !</p>\r\n\r\n<p>Merci d&#39;intervenir sur le lien suivant : {lien}</p>\r\n\r\n<p>Cordialement,</p>\r\n\r\n<p><u><strong>Votre &eacute;quipe Group-LFE.</strong></u></p>');

/*Table structure for table `mail_tbl_regle` */

DROP TABLE IF EXISTS `mail_tbl_regle`;

CREATE TABLE `mail_tbl_regle` (
  `regle_id` int(11) NOT NULL AUTO_INCREMENT,
  `regle_lib` varchar(64) NOT NULL,
  `vue_id` int(11) NOT NULL,
  `mail_type_id` int(11) NOT NULL,
  `regle_heure` time NOT NULL DEFAULT '00:00:00',
  `regle_frequence_id` int(11) NOT NULL,
  `regle_actif` tinyint(1) NOT NULL DEFAULT 0,
  `regle_date_envoi` datetime NOT NULL DEFAULT '2009-01-01 00:00:00',
  `regle_renvoi` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`regle_id`),
  KEY `FK_mail_tbl_regle_mail_type_id` (`mail_type_id`),
  KEY `FK_mail_tbl_regle_frequence_id` (`regle_frequence_id`),
  KEY `FK_mail_tbl_regle_vue_id` (`vue_id`),
  CONSTRAINT `mail_tbl_regle_FK_1` FOREIGN KEY (`vue_id`) REFERENCES `mail_tbl_vue` (`vue_id`),
  CONSTRAINT `mail_tbl_regle_FK_2` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_tbl_mail_type` (`mail_type_id`),
  CONSTRAINT `mail_tbl_regle_FK_3` FOREIGN KEY (`regle_frequence_id`) REFERENCES `mail_tbl_regle_frequence` (`regle_frequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `mail_tbl_regle` */

insert  into `mail_tbl_regle`(`regle_id`,`regle_lib`,`vue_id`,`mail_type_id`,`regle_heure`,`regle_frequence_id`,`regle_actif`,`regle_date_envoi`,`regle_renvoi`) values 
(1,'New intervention avec modele inconu',1,1,'00:00:00',3,1,'2020-01-07 14:28:37',0),
(2,'New outil tentative',2,2,'00:00:00',3,1,'2020-01-07 14:28:37',0),
(3,'New pdr tentative',3,3,'00:00:00',3,1,'2020-01-07 14:28:37',0);

/*Table structure for table `mail_tbl_regle_frequence` */

DROP TABLE IF EXISTS `mail_tbl_regle_frequence`;

CREATE TABLE `mail_tbl_regle_frequence` (
  `regle_frequence_id` int(11) NOT NULL AUTO_INCREMENT,
  `regle_frequence_lib` varchar(32) NOT NULL,
  `regle_frequence_delai` varchar(64) NOT NULL,
  PRIMARY KEY (`regle_frequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `mail_tbl_regle_frequence` */

insert  into `mail_tbl_regle_frequence`(`regle_frequence_id`,`regle_frequence_lib`,`regle_frequence_delai`) values 
(1,'Tous les jours','23 hours 51 minutes'),
(2,'Toutes les heures','51 minutes'),
(3,'Immediat','1 second'),
(4,'Toutes les semaines','6 days 23 hours 51 minutes');

/*Table structure for table `mail_tbl_vue` */

DROP TABLE IF EXISTS `mail_tbl_vue`;

CREATE TABLE `mail_tbl_vue` (
  `vue_id` int(11) NOT NULL AUTO_INCREMENT,
  `vue_lib` varchar(64) NOT NULL,
  `vue_sql_propel` text DEFAULT NULL,
  `vue_post_sql_raw` text DEFAULT NULL,
  `vue_sql_raw` text DEFAULT NULL,
  PRIMARY KEY (`vue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `mail_tbl_vue` */

insert  into `mail_tbl_vue`(`vue_id`,`vue_lib`,`vue_sql_propel`,`vue_post_sql_raw`,`vue_sql_raw`) values 
(1,'New intervention avec modele inconu',NULL,'','-- Intervention : modele Inconnue \r\n  \r\n   SELECT \r\n  CONCAT(\'#Intervention#\',i.`intervention_id`,\'#\',i.`outil_id`) AS user_id,\r\n  \'karim.amguir@gmail.com\' AS destinataire,\r\n  i.`intervention_id`,\r\n  m.`modele_id`,\r\n  CONCAT (\'https://backend.group-lfe.com/\',i.`intervention_id`,\'/fiche\') AS lien,\r\n  i.`created_at` FROM `tbl_intervention` i\r\n  INNER JOIN `tbl_outils_modele_client` m\r\n  ON i.`outil_id` = m.`client_produit_id`\r\n  INNER JOIN `ref_modele` r\r\n  ON m.`modele_id` = r.`modele_id`\r\n  WHERE r.`modele_libelle` LIKE \'%inconnu%\' AND r.`designation` LIKE \'%inconnu%\'\r\n    AND CONCAT(\'#Intervention#\',i.`intervention_id`,\'#\',i.`outil_id`)  NOT IN (SELECT user_id FROM mail_tbl_mail ) \r\n AND CONCAT(\'#Intervention#\',i.`intervention_id`,\'#\',i.`outil_id`,\'_Exception\')  NOT IN (SELECT user_id FROM mail_tbl_mail );'),
(2,'New outil tentative',NULL,'','-- query mail from `tbl_outils_modele_client` where is_tentaive=1 and created_at > 7 jours\r\nSELECT \r\n  CONCAT(\'#OutilsModele#\',c.`client_produit_id`,\'#\',c.`modele_id`) AS user_id,\r\n  \'karim.amguir@gmail.com\' AS destinataire,\r\n  c.`client_produit_id`,\r\n  c.`client_id`,\r\n  c.`modele_id`,\r\n  c.`is_tentative`,\r\n  CONCAT (\'https://backend.group-lfe.com/outillages/\',c.`client_produit_id`,\'/edit\') AS lien,\r\n  c.`created_at` FROM `tbl_outils_modele_client` c\r\n  WHERE c.`is_tentative` = 1 AND DATEDIFF(NOW(),c.`created_at`)>= 7\r\n  AND CONCAT(\'#OutilsModele#\',c.`client_produit_id`,\'#\',c.`modele_id`)  NOT IN (SELECT user_id FROM mail_tbl_mail ) \r\n AND CONCAT(\'#OutilsModele#\',c.`client_produit_id`,\'#\',c.`modele_id`,\'_Exception\')  NOT IN (SELECT user_id FROM mail_tbl_mail );'),
(3,'New pdr tentative',NULL,'','-- query mail from `tbl_pieces_rechange` where is_tentaive=1 and created_at > 7 jours\r\n \r\n SELECT \r\n  CONCAT(\'#PiecesRechange#\',p.`pieces_rechange_id`,\'#\',p.`modele_id`) AS user_id,\r\n  \'karim.amguir@gmail.com\' AS destinataire,\r\n  p.`pieces_rechange_id`,\r\n  p.`modele_id`,\r\n  p.`ref_pdr`,\r\n  p.`designation_pdr`,\r\n  CONCAT (\'https://backend.group-lfe.com/piecesRechange/\',p.`pieces_rechange_id`,\'/edit\') AS lien,\r\n  p.`created_at` FROM `tbl_pieces_rechange` p\r\n  WHERE p.`is_tentative` = 1 AND DATEDIFF(NOW(),p.`created_at`)>= 7\r\n  AND CONCAT(\'#PiecesRechange#\',p.`pieces_rechange_id`,\'#\',p.`modele_id`)  NOT IN (SELECT user_id FROM mail_tbl_mail ) \r\n AND CONCAT(\'#PiecesRechange#\',p.`pieces_rechange_id`,\'#\',p.`modele_id`,\'_Exception\')  NOT IN (SELECT user_id FROM mail_tbl_mail );');

/*Table structure for table `migration_versions` */

DROP TABLE IF EXISTS `migration_versions`;

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migration_versions` */

/*Table structure for table `ref_beton_type` */

DROP TABLE IF EXISTS `ref_beton_type`;

CREATE TABLE `ref_beton_type` (
  `beton_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `beton_type_lib` varchar(255) DEFAULT NULL,
  `beton_type_lib_court` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`beton_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ref_beton_type` */

insert  into `ref_beton_type`(`beton_type_id`,`beton_type_lib`,`beton_type_lib_court`) values 
(1,'B25',NULL),
(2,'B35 HYD',NULL),
(3,'B30',NULL),
(4,'B35',NULL),
(5,'B40',NULL);

/*Table structure for table `ref_civilite` */

DROP TABLE IF EXISTS `ref_civilite`;

CREATE TABLE `ref_civilite` (
  `civilite_id` int(11) NOT NULL AUTO_INCREMENT,
  `civilite_lib` varchar(8) NOT NULL,
  PRIMARY KEY (`civilite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ref_civilite` */

insert  into `ref_civilite`(`civilite_id`,`civilite_lib`) values 
(1,'Mr'),
(2,'MME'),
(3,'Mlle');

/*Table structure for table `ref_etat` */

DROP TABLE IF EXISTS `ref_etat`;

CREATE TABLE `ref_etat` (
  `etat_id` int(11) NOT NULL AUTO_INCREMENT,
  `etat_lib` varchar(255) DEFAULT NULL,
  `etat_lib_court` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`etat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ref_etat` */

/*Table structure for table `ref_nbr_essai` */

DROP TABLE IF EXISTS `ref_nbr_essai`;

CREATE TABLE `ref_nbr_essai` (
  `essai_id` int(11) NOT NULL AUTO_INCREMENT,
  `essai_lib_court` varchar(128) DEFAULT NULL,
  `essai_lib` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`essai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `ref_nbr_essai` */

insert  into `ref_nbr_essai`(`essai_id`,`essai_lib_court`,`essai_lib`) values 
(1,'1',NULL),
(2,'2',NULL),
(3,'3',NULL),
(4,'4',NULL),
(5,'5',NULL),
(6,'6',NULL),
(7,'7',NULL);

/*Table structure for table `ref_pays` */

DROP TABLE IF EXISTS `ref_pays`;

CREATE TABLE `ref_pays` (
  `pays_id` int(11) NOT NULL AUTO_INCREMENT,
  `pays_lib` varchar(100) DEFAULT NULL,
  `pays_flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pays_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ref_pays` */

insert  into `ref_pays`(`pays_id`,`pays_lib`,`pays_flag`) values 
(1,'Maroc','morocco.png'),
(2,'France','france.png'),
(3,'Tunis','tunisia.png');

/*Table structure for table `ref_profil` */

DROP TABLE IF EXISTS `ref_profil`;

CREATE TABLE `ref_profil` (
  `profil_id` int(11) NOT NULL,
  `profil_lib` varchar(50) NOT NULL,
  `profil_ordre` smallint(6) NOT NULL,
  `profil_lib_court` varchar(128) NOT NULL,
  `profil_sf` varchar(128) DEFAULT NULL,
  `profil_for_user` int(11) DEFAULT 1 COMMENT '1 = user; 2 = client ; 3 all',
  PRIMARY KEY (`profil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ref_profil` */

/*Table structure for table `tbl_chantiers` */

DROP TABLE IF EXISTS `tbl_chantiers`;

CREATE TABLE `tbl_chantiers` (
  `chantier_id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_suivi` varchar(128) DEFAULT NULL,
  `chantier_designation` varchar(255) DEFAULT NULL,
  `nbr_prelevement` int(11) unsigned DEFAULT NULL,
  `num_dossier` varchar(128) DEFAULT NULL,
  `chantier_detail` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`chantier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_chantiers` */

/*Table structure for table `tbl_client` */

DROP TABLE IF EXISTS `tbl_client`;

CREATE TABLE `tbl_client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_raison_social` varchar(255) NOT NULL,
  `client_raccourci` varchar(28) DEFAULT NULL,
  `client_cnss` varchar(255) NOT NULL,
  `client_patente` varchar(255) NOT NULL,
  `client_ice` varchar(255) NOT NULL,
  `client_reg_commerce` varchar(255) DEFAULT NULL,
  `client_dg_nom` varchar(255) NOT NULL,
  `client_dg_prenom` varchar(255) DEFAULT NULL,
  `client_dg_tel` varchar(255) DEFAULT NULL,
  `client_adresse` text DEFAULT NULL,
  `client_tel` varchar(156) DEFAULT NULL,
  `client_url` varchar(255) DEFAULT NULL,
  `current_num` int(11) DEFAULT 0,
  `pays_id` int(11) NOT NULL DEFAULT 1,
  `client_commentaire` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_pays_id` (`pays_id`),
  CONSTRAINT `fk_pays_id` FOREIGN KEY (`pays_id`) REFERENCES `ref_pays` (`pays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_client` */

/*Table structure for table `tbl_detail_devis` */

DROP TABLE IF EXISTS `tbl_detail_devis`;

CREATE TABLE `tbl_detail_devis` (
  `detail_devis_id` int(11) NOT NULL AUTO_INCREMENT,
  `devis_id` int(11) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `quantite` float DEFAULT NULL,
  `montant_ht` float DEFAULT NULL,
  `montant_ttc` float DEFAULT NULL,
  `montant_tva` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deteled_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_devis_id`),
  KEY `devis_id` (`devis_id`),
  CONSTRAINT `tbl_detail_devis_ibfk_1` FOREIGN KEY (`devis_id`) REFERENCES `tbl_devis` (`devis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_detail_devis` */

/*Table structure for table `tbl_devis` */

DROP TABLE IF EXISTS `tbl_devis`;

CREATE TABLE `tbl_devis` (
  `devis_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `chantier_id` int(11) DEFAULT NULL,
  `designation_devis` text DEFAULT NULL,
  `montant_ht` float DEFAULT NULL,
  `montant_ttc` float DEFAULT NULL,
  `montant_tva` float DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `etat_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`devis_id`),
  KEY `etat_id` (`etat_id`),
  KEY `client_id` (`client_id`),
  KEY `chantier_id` (`chantier_id`),
  CONSTRAINT `tbl_devis_ibfk_1` FOREIGN KEY (`etat_id`) REFERENCES `ref_etat` (`etat_id`),
  CONSTRAINT `tbl_devis_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_client` (`client_id`),
  CONSTRAINT `tbl_devis_ibfk_3` FOREIGN KEY (`chantier_id`) REFERENCES `tbl_chantiers` (`chantier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_devis` */

/*Table structure for table `tbl_essais` */

DROP TABLE IF EXISTS `tbl_essais`;

CREATE TABLE `tbl_essais` (
  `essai_id` int(11) NOT NULL AUTO_INCREMENT,
  `prelevement_id` int(11) DEFAULT NULL,
  `nombre_essai_id` int(11) DEFAULT NULL,
  `valeur_1` float DEFAULT NULL,
  `valeur_2` float DEFAULT NULL,
  `valeur_3` float DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`essai_id`),
  KEY `prelevement_id` (`prelevement_id`),
  KEY `nombre_essai_id` (`nombre_essai_id`),
  CONSTRAINT `tbl_essais_ibfk_1` FOREIGN KEY (`prelevement_id`) REFERENCES `tbl_prelevements` (`prelevement_id`),
  CONSTRAINT `tbl_essais_ibfk_2` FOREIGN KEY (`nombre_essai_id`) REFERENCES `ref_nbr_essai` (`essai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_essais` */

/*Table structure for table `tbl_param` */

DROP TABLE IF EXISTS `tbl_param`;

CREATE TABLE `tbl_param` (
  `param_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `param_code` varchar(100) NOT NULL,
  `param_value` varchar(100) DEFAULT NULL,
  `param_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_param` */

insert  into `tbl_param`(`param_id`,`param_code`,`param_value`,`param_description`) values 
(1,'ETAT_SERVEUR','0','etat du serveur de mail'),
(2,'MAIL_SMTP','localhost',''),
(3,'MAIL_USER_PORT','25',''),
(4,'MAIL_USER_LOGIN','',''),
(5,'MAIL_USER_PWD','',''),
(6,'HEADER_TITLE','BE-LABO',''),
(7,'ENV_SRV','prod','Site de recette'),
(8,'VERSION','1.0',''),
(9,'ENV_LINK',NULL,'https://github.com/Slurp/sheepmusic'),
(10,'LIBREOFFICE_VERSION','LibreOffice 5.0.6.2 00(Build:2)','https://colorlib.com/wp/music-website-templates/');

/*Table structure for table `tbl_prelevements` */

DROP TABLE IF EXISTS `tbl_prelevements`;

CREATE TABLE `tbl_prelevements` (
  `prelevement_id` int(11) NOT NULL AUTO_INCREMENT,
  `chantier_id` int(11) DEFAULT NULL,
  `bon_livraison` varchar(255) DEFAULT NULL,
  `affaissement` int(11) DEFAULT NULL,
  `prelevement_date` datetime DEFAULT NULL,
  `etat_id` int(11) DEFAULT NULL,
  `numero_pv` int(11) DEFAULT NULL,
  `partie_ouvrage` varchar(255) DEFAULT NULL,
  `provenance_beton` varchar(255) DEFAULT NULL,
  `beton_type_id` int(11) DEFAULT NULL,
  `essai_supplementaire` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`prelevement_id`),
  KEY `chantier_id` (`chantier_id`),
  KEY `beton_type_id` (`beton_type_id`),
  CONSTRAINT `tbl_prelevements_ibfk_1` FOREIGN KEY (`chantier_id`) REFERENCES `tbl_chantiers` (`chantier_id`),
  CONSTRAINT `tbl_prelevements_ibfk_2` FOREIGN KEY (`beton_type_id`) REFERENCES `ref_beton_type` (`beton_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_prelevements` */

/*Table structure for table `tbl_projets` */

DROP TABLE IF EXISTS `tbl_projets`;

CREATE TABLE `tbl_projets` (
  `projet_id` int(11) NOT NULL AUTO_INCREMENT,
  `projet_lib` varchar(255) DEFAULT NULL,
  `projet_lib_court` varchar(128) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`projet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_projets` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
