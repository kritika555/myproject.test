-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2021 at 03:45 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demopro`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 1, '2021-08-05 08:26:24', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_richText_sdriwuzz` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_richText_sdriwuzz`) VALUES
(1, 1, 1, NULL, '2021-08-05 07:02:07', '2021-08-05 07:02:07', '6563c9da-6ac2-44a3-9430-5484f94fe16c', NULL),
(2, 2, 1, 'Home', '2021-08-05 07:14:27', '2021-08-05 08:26:24', '056e4487-40a6-4d2d-9f48-3f5953b12141', '<p>Welcome to the test application. <br />This is a demo project where I showcase my ability to use <strong>CraftCMS</strong>.</p>\r\n<p>In this application I am going to implement YELP API . <br /></p>'),
(3, 3, 1, 'Home', '2021-08-05 07:14:27', '2021-08-05 07:14:27', '19d19396-0bfa-41a0-be28-7625b0e48602', NULL),
(4, 4, 1, 'Home', '2021-08-05 07:14:28', '2021-08-05 07:14:28', '0384d1bf-6067-4433-bd83-c0d37fe8a0fb', NULL),
(5, 5, 1, 'Home', '2021-08-05 08:11:08', '2021-08-05 08:11:08', '7400cce8-25a7-4bcd-9d3c-a4ba2510f236', NULL),
(6, 6, 1, 'Home', '2021-08-05 08:17:21', '2021-08-05 08:17:21', '59364ea9-cfcf-4393-bca5-f44c2d3ca37f', NULL),
(8, 8, 1, 'Home', '2021-08-05 08:22:56', '2021-08-05 08:22:56', '9441f481-e815-47b9-9718-189bb7222528', '<p>Welcome to the test application. This is a demo project where I showcase my ability to use CraftCMS</p>'),
(10, 10, 1, 'Home', '2021-08-05 08:26:25', '2021-08-05 08:26:25', '50ecfaeb-e44d-4e67-bafe-92ba70c80441', '<p>Welcome to the test application. <br />This is a demo project where I showcase my ability to use <strong>CraftCMS</strong>.</p>\r\n<p>In this application I am going to implement YELP API . <br /></p>');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-08-05 07:02:07', '2021-08-05 07:02:07', NULL, NULL, '228b4bbb-d992-4f75-b995-ebea31a681e1'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 07:14:27', '2021-08-05 08:26:24', NULL, NULL, '201f4f45-5a6a-4550-8141-e410b059f8f5'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 07:14:27', '2021-08-05 07:14:27', NULL, NULL, '8d782b78-839b-4971-887d-2f0ae92f8ec0'),
(4, 2, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 07:14:28', '2021-08-05 07:14:28', NULL, NULL, 'ae7be45a-f04f-4119-86b7-6f210f224a53'),
(5, 2, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 08:11:08', '2021-08-05 08:11:08', NULL, NULL, '810afdac-c378-42e2-9b44-334dbc7c8c6e'),
(6, 2, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 08:17:20', '2021-08-05 08:17:20', NULL, NULL, '5ecc8b70-5a60-4b77-a37c-d27494b34a76'),
(8, 2, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 08:22:55', '2021-08-05 08:22:56', NULL, NULL, 'b73224ee-1c5c-4aae-8154-950ec76eef47'),
(10, 2, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2021-08-05 08:26:24', '2021-08-05 08:26:25', NULL, NULL, '2c6803f2-afa4-43ca-b39d-ad6a6dc6b457');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-08-05 07:02:07', '2021-08-05 07:02:07', 'defd1372-4851-48dc-9c2f-4f0c6fc73c5a'),
(2, 2, 1, 'home', '__home__', 1, '2021-08-05 07:14:27', '2021-08-05 07:14:27', 'fefd8d1c-539b-48f4-8477-f6835a8cbc5b'),
(3, 3, 1, 'home', '__home__', 1, '2021-08-05 07:14:27', '2021-08-05 07:14:27', '8ccbdf0e-52fe-4f2d-8164-c3c099b330ed'),
(4, 4, 1, 'home', '__home__', 1, '2021-08-05 07:14:28', '2021-08-05 07:14:28', 'ab0ca6ee-351a-42be-89a6-23951d293f15'),
(5, 5, 1, 'home', '__home__', 1, '2021-08-05 08:11:08', '2021-08-05 08:11:08', '2d3a0053-c5d8-40e6-9a50-e52279f2c465'),
(6, 6, 1, 'home', '__home__', 1, '2021-08-05 08:17:21', '2021-08-05 08:17:21', '63036eeb-a542-4481-91ac-f6e86015d74c'),
(8, 8, 1, 'home', '__home__', 1, '2021-08-05 08:22:56', '2021-08-05 08:22:56', 'bc836ef2-0f33-4dcd-926d-da41cfcfad7f'),
(10, 10, 1, 'home', '__home__', 1, '2021-08-05 08:26:25', '2021-08-05 08:26:25', 'c850050b-d7ce-438f-907b-f080bcf2e5c1');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 07:14:27', '2021-08-05 07:14:27', '019024be-f429-475b-a077-f124d43b940a'),
(3, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 07:14:27', '2021-08-05 07:14:27', '98992da1-7e19-4c40-9216-51561bd52bc7'),
(4, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 07:14:28', '2021-08-05 07:14:28', '7007a34d-f631-40ae-b87f-f803d152932f'),
(5, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 08:11:08', '2021-08-05 08:11:08', '08836638-447c-472b-b354-d136ef05e511'),
(6, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 08:17:21', '2021-08-05 08:17:21', 'a91429f8-22a1-4edf-ac74-ff51f24f954c'),
(8, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 08:22:56', '2021-08-05 08:22:56', '02c563c4-d60c-47cc-8dca-e34c1eb9e5cf'),
(10, 1, NULL, 1, NULL, '2021-08-05 07:14:00', NULL, NULL, '2021-08-05 08:26:25', '2021-08-05 08:26:25', '2a1dc81a-099a-4027-b3ab-7c9bf5e4ad4a');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Home', 'home', 0, 'site', NULL, '{section.name|raw}', 1, '2021-08-05 07:14:26', '2021-08-05 07:14:26', NULL, '01548255-ac52-442a-97cb-9a670f2be032');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-08-05 07:02:05', '2021-08-05 07:02:05', NULL, '42a502c3-75c8-4511-a1da-18094b792c24');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 3, 1, 0, 1, '2021-08-05 08:17:20', '2021-08-05 08:17:20', 'f432a882-51f5-40e5-8d34-29d74d44b975');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2021-08-05 07:14:26', '2021-08-05 07:14:26', NULL, '8b2bfcc3-1233-4355-bc0f-48f89c39d00e');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"579c0fbf-ee3b-42ed-a05d-659ce95916e7\"}]', 1, '2021-08-05 08:17:20', '2021-08-05 08:17:20', '5be91763-adda-4abd-a93b-01d327354f81');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Rich Text', 'richText', 'global', 'sdriwuzz', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"1\",\"showUnpermittedFiles\":true,\"showUnpermittedVolumes\":true,\"uiMode\":\"enlarged\"}', '2021-08-05 08:14:36', '2021-08-05 08:21:37', '579c0fbf-ee3b-42ed-a05d-659ce95916e7');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.7', '3.7.7', 0, 'nruwromsnemh', 'tbmyxfudascr', '2021-08-05 07:02:04', '2021-08-05 08:21:37', '6d6553c2-e0a8-4ad7-ba03-93de947db507');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-08-05 07:02:09', '2021-08-05 07:02:09', '2021-08-05 07:02:09', '1b38796e-36bb-4c01-a55b-b5e7e50eff60'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2463c39e-5d81-4b2d-b839-785a6f75d582'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', 'a24e304b-3096-47c3-b07e-5ec041997f93'),
(4, 'craft', 'm150403_184533_field_version', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', 'b760c3a7-a264-434e-85a7-a681e418dd61'),
(5, 'craft', 'm150403_184729_type_columns', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '9c140cc9-b205-4cb2-98ed-d011758a4da0'),
(6, 'craft', 'm150403_185142_volumes', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '480f2caf-cd10-4db9-a85e-e2b65dbf3b66'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '74dd6b20-814f-49f1-80ff-75027ad2c390'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '17d7ed9a-8867-4625-8ebd-eb385c427cd4'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '1984537a-4400-4db7-a7d4-c74fd538f2f1'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-08-05 07:02:10', '2021-08-05 07:02:10', '2021-08-05 07:02:10', 'f88f281b-59b5-492d-af08-044074c584d1'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '175b744b-49cd-425b-823c-9e301175eef6'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', 'aa0b2076-b737-4b44-b4e6-4fb0f51dbcea'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '20bd75a0-84fb-44a9-8b0b-83ad13c60e40'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '60bdcd76-4cbe-4885-9ac1-464362b1f264'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '79d0af5d-aafb-4ed3-b926-2f78edf2d9b7'),
(16, 'craft', 'm151209_000000_move_logo', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '964797fe-a3df-4ff7-905c-a1059fa5f20b'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '97bd3548-d000-4c85-9223-940940c33848'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '6bc75b42-51dc-43de-8460-1b6802b02c51'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '82f490c9-7f38-4205-bf42-099e366c73c2'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', 'f5f6293b-338d-4d03-8427-5fd5889ab9d0'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '688b84e0-eee9-4c95-a0f7-6024035b43ef'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', 'ff42a30e-e82e-4e06-93df-4a662d5d65be'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '8562df2e-0277-457c-a521-61c41c564dac'),
(24, 'craft', 'm160807_144858_sites', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '433cc8b8-e047-4da0-ac52-f146990fe03b'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', 'a6bfc3b1-197f-451a-9b72-2405b1d2eb8b'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '80254fd2-8fe5-4fc4-b3c5-3dccfbc18aab'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', 'd052cabc-b95f-4ef9-be0d-223e41f18412'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', 'cc6743dd-475f-4770-af1f-cdcda6ae1217'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '6d1737ec-cba5-4b91-a4b5-b412b014cb1d'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '2021-08-05 07:02:11', '1eb7e2e5-fd6a-43a6-8273-5225a969dbdc'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '5ed7cbfa-66d0-4f27-93e5-0c301c1306b8'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', 'fc8bb8a6-05a3-45c1-952c-2783b861ff9a'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '9127d505-3a9c-4bd0-a7f6-4f1e9c1f2dca'),
(34, 'craft', 'm161013_175052_newParentId', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '48340c97-3e4b-49fb-9f8f-addd0f3c1c45'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '7a9e844b-0947-4730-a70b-0821b9127eee'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', 'd2c68d54-263e-436f-a5d2-f9edd3d229de'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', 'b94c6d9c-4e8f-4596-a9ea-5edcd2b1d2ab'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '8346bf78-3c73-4b14-8c75-30f67cf91692'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', 'b1750c80-efd8-464c-93c0-e8af8020a221'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', 'b4efc014-4316-4255-af9f-1747577699c3'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '472a8d74-1783-4ab6-a361-bf89b681ef8f'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '71a9aa07-2a88-4c04-9e5c-5612385d420e'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '13519cb2-38f6-4f11-a507-d9eaa918496a'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '502f10fc-d9d9-45de-9665-2a30dce1226a'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-08-05 07:02:12', '2021-08-05 07:02:12', '2021-08-05 07:02:12', 'd82e19f9-fc87-4429-ab86-b57f0aa81cc3'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '13ca20a3-f674-4565-93b9-ad55afd8e369'),
(47, 'craft', 'm170206_142126_system_name', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'a3ff8950-d8bf-42f3-aa82-f51bfe6be323'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '6a436abf-4264-4e2f-b112-7a8c29a84680'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'b7bb07d9-8688-4ae4-9a64-b010ba82661f'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '74a78fe6-7539-41cf-b0db-5d1aa86ca949'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2500aaa0-01b4-4b2c-b75f-089460abfdb7'),
(52, 'craft', 'm170228_171113_system_messages', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'a6852dbc-2918-4a52-8307-1760fef2188c'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'cd148305-9746-45c3-8245-7fcf08c3252f'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'bee78935-1498-488a-9d10-baa385b3d151'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '907bdaf0-e73c-4a8b-9331-4956430f2daa'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'c36f8c42-c47a-4419-a134-746bf8f9b9ea'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '25a0086d-3196-4d67-a12a-81b9cddfa924'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '5255f9b8-57a1-45fe-803d-0a6b86a9a3c0'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '30d7eb36-2cc1-4565-8c71-eeeca5669890'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '9837b7c8-f7bd-4fed-b4f8-0480709c586d'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '974894be-9673-49f2-bede-25c54ba56161'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '8cad953f-166e-4b57-8a95-6177aa5ea452'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-08-05 07:02:13', '2021-08-05 07:02:13', '2021-08-05 07:02:13', 'd7d43647-86ce-43f0-95e4-18eb64010bc5'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'b4e33c28-118b-49b0-8b58-5e36c7d3b4a8'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'a267a59d-035e-4fa4-8be0-5f77af17e019'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'e34db18e-ee99-43e2-9af9-3939ef8d2350'),
(67, 'craft', 'm171011_214115_site_groups', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'e21cbbd7-4f12-4400-b20d-d6f8ac95ffd7'),
(68, 'craft', 'm171012_151440_primary_site', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '1c10d1a8-8d43-44aa-9958-f26d7d2906ce'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'f5e40ef1-e55a-44b8-8260-2ebff5f5c0de'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '83b25894-3b0f-482b-8471-a951e1e45713'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '16a74dc2-d5fc-4ede-b844-ee48fe97ce0c'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '0f7edbb0-734c-49e9-8cde-2da4e1707687'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '486d6e33-68da-4f07-bcd5-e85d70cfdd5a'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'a6bc19d3-d794-4d30-8adc-787b52f85e8a'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '1bb65aaa-32b2-4a87-940d-35d4c6d1ee55'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'd7b3bb6e-2bd3-4147-9b7d-b46d2b56d099'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', 'd8ece819-2c1d-4fc7-b9fb-492d852080f0'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '62eb35e3-a19f-4790-bf0b-9ada662fc17e'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '7ea64dc0-5f3a-486b-a93e-bf59b6a0d206'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '2021-08-05 07:02:14', '0603faff-8c1d-4461-b78d-cf498e6610af'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '81e7a3dc-30ca-4558-a2c4-67005b452acd'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '85c5a587-2236-4789-afcc-7ab0328f381b'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '8df1c881-6fcd-40a2-a332-43c891fbcab0'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', 'f33b64bc-7ca2-4221-a59b-52eb3f57e831'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', 'dd39cfb3-87fe-4d95-9f96-e05360ada11b'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '84c77b80-9343-4be5-a533-a5929d1a4e55'),
(87, 'craft', 'm180321_233505_small_ints', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '65f289cb-2224-4c41-8df9-18d5a59d094a'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', 'f574848b-07d4-4961-b376-5803dcb65b8e'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '41232175-13e6-4029-83fe-e2e80336fb01'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '214bce39-88e8-495d-836a-e883abeca745'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', 'd2f0c1be-9105-4d65-9cc9-a59eff23d28f'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '405640e7-a8fd-4a9d-85a2-e5d8ad6d2c95'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '30e98c4d-e816-4c0e-9a28-c63fa27b01b0'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '5fec565c-24de-49f2-ba1b-fd84411803bb'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', 'c92e78e1-8ef4-4469-9820-30cf98fd8840'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-08-05 07:02:15', '2021-08-05 07:02:15', '2021-08-05 07:02:15', 'a21d5fc9-7e36-4056-8036-7f5dc2c15096'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '8497a740-be61-4aba-a47f-d03d9e69c29d'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', 'd45759fa-1e50-4939-b55e-740b92c5bc74'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '81a4aa8b-199d-43e8-9474-150e3583a104'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', 'ed0c11a0-1926-484f-8587-9ef03cdeab3b'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '85590ff1-8a3a-4dd8-b595-89bdeedbbb28'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '1a97bed7-fb55-4a4a-bcd6-6cedfeb5eab3'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '7c93ea50-c725-42f4-9b90-22d040e32bd7'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '3885980d-2713-477f-af0c-4e5f4c45f804'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '07d2d389-44c8-4353-b659-5a155b2288a0'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '9e8a13b7-d7e0-4efd-82b4-8f4624336791'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', 'fcb587a0-5132-4e75-b19a-2c569f64fb6b'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '3ba97169-4eef-4a25-befa-1ca61ce55dee'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '1b644f1f-d4a3-427b-8464-0721e5040732'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '1cc4918a-5ed0-4a1e-9d05-706e712b9586'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', 'c92a13fd-2968-42c1-a164-758e89b42011'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '73b4f6dd-4424-4cce-81bc-d3aadb5e57eb'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-08-05 07:02:16', '2021-08-05 07:02:16', '2021-08-05 07:02:16', 'b9924a2b-a3d8-405f-8b03-8e6a86b7cebc'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'eeaec5b6-0f1b-442e-81fb-26c857736fd3'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '669d761c-27c0-4a2e-92cc-3b1e46721434'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'cafe6480-7ec5-4d36-b629-572771dbe7f4'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '5cd6422b-c09c-4a1d-98a9-fd5e6ee1d3c3'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '307ad872-6ba5-4d80-a122-6ac2ec7697f0'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'f9c28081-fa92-4c99-92d4-f749e8393c6e'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'db9d4284-e806-4464-8882-b364af7705d3'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'c1aee55c-88b8-4727-a22c-96e9bda0cec9'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '27cbc16b-3b8f-4677-89c9-a75c46fef845'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'a835b996-7065-4640-8f31-89e0fb43504b'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'd3618c3f-cd05-43bf-80ce-269a30bfb53a'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', 'b7e8c3ac-9e30-414b-9cb7-794aa1bce147'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '0d8a4949-caa2-47f8-8d5a-b59fc3fc850e'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '06839903-55a2-48df-acea-9e5785379b30'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '55f73abd-4d24-4e0e-9951-ffd15247dc85'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2a492b7b-0193-47fc-a611-30cd8699dec2'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '080f5df9-0de0-4f2d-9e43-dbca781769f1'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '045fce8e-4c09-4966-b898-cef3939db771'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '2021-08-05 07:02:17', '000fbc55-d828-4208-8ed6-c6255dd6f285'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '58adcc8d-40d6-4625-8de4-f09650534cb0'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '19de09de-887c-4b73-861e-710999b1c688'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '68f527f3-4852-41a2-aad5-c4b35eb6881e'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '5492283d-5588-44a8-902c-71dc732ba1b5'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', 'ac319bba-898a-4365-a7bb-eec1cac87ff5'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '991b384a-57b2-40e8-9b4c-29040fe88b11'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '01b59989-90fc-4688-8420-397a54a3a439'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', 'a54a50fe-ab03-447b-a423-2cadc70c29bf'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '08577510-7ea8-4f81-8bfe-87133902c070'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '48c3db79-4d64-4f3d-a593-31bc76e0b814'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '24674b13-ad12-41f8-bd48-d85a50ed6b33'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '5b390291-fee3-437c-8260-276467994b5e'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', 'f6e37ab7-1062-4757-a774-97f4f8bbf68f'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '9b8578c0-03aa-4a98-9e36-d5589268ec46'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '8933fe65-9031-4eeb-a932-311a83468cc3'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '5653ae75-d357-4d1f-bb92-31c5f474323e'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '1d8e9e85-86bd-4a8a-9103-cbe7ebb43f7f'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '02e35740-f74b-47f6-a558-a5a0d1d7cced'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '53e2b98e-d693-4449-b8dd-e4ede34bbad2'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', 'bf299f0e-2d53-4cde-bb7d-e405cc09619e'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', 'deb041d1-43bc-456a-bae2-fde3e46cf03d'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '2021-08-05 07:02:18', '3f6a2763-9022-4978-ae3e-f9826427f994'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '8b13daa1-ae84-4cc4-8bec-5b8ead31cf4c'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'c8702cef-000b-4ffc-98ba-5fb5dab7ce0b'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '807895d4-fefc-49df-8680-4fbcb7fad768'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '06314354-59c8-45c6-a522-7938b6a0f2c6'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'e82249db-66b9-4353-9ca4-218c5f1ed6fd'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'ca7e2510-ac8a-46df-a5d8-efed722daf97'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'b524e9ed-fe00-4eb5-ad30-c4d3a68cb6f3'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'aab3b487-b517-4f96-9428-8fbee876ca1a'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '34e3142b-67ff-4234-87b6-926907055b1c'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'c6f7a0a4-dc2c-4538-98e4-2b29a384db21'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '0b198778-ceda-4afc-8a17-ac0587025b20'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '29e20112-feee-4a97-82d1-6a4a1ef1069c'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '1492fc60-1640-47ca-8510-9ad32c9d699b'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '5832d167-2945-4795-855f-e8b25ae2501a'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '8adc4384-58e2-41a7-a47d-efee732267a2'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '60a14314-6875-448f-a0e8-368f00cfce5a'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '0a7048dd-2b50-42bd-8655-655737951210'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', 'e08db327-9db0-4231-b372-9a659cc5dfb4'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '8ea43f9d-ce10-4cdf-88d1-f8b238f8e4df'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '2021-08-05 07:02:19', '7dfaf340-e15b-4379-bac4-864e3389f79b'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'b3c4e1fd-3c85-468d-8747-c2d709b732ed'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '52085741-b434-461a-81ce-daddfc998890'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '6076d978-0fc1-438d-bd24-b7e0e18ceecd'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '488dce58-739d-4aff-af9b-7fc49c1f0446'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'd9454b06-329b-4d95-9431-5ffb296e6f3b'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '3da285e7-6e12-41e2-ba55-afe8b5c80022'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '5d506af4-02d2-4626-ab72-176f7ba49c7e'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'cf3e2f62-3974-429c-8c5e-84ccb5a91e77'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '88fe8115-13b8-44fe-8311-731ecfc5b69c'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'b6bfc53b-d125-40b4-aac7-bad88c275208'),
(185, 'craft', 'm210331_220322_null_author', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '903c2e4a-fd1c-4314-a0dc-093c29bbebe9'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'fc0217a2-bbd3-470d-b648-84097441f70c'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '26e02770-93f6-4320-bf8f-5560e28de7ca'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'a153c8a3-76f8-40c7-b171-316da07595fb'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '483968c8-1b0c-4692-bb83-c7a28902b656'),
(190, 'craft', 'm210613_184103_announcements', '2021-08-05 07:02:20', '2021-08-05 07:02:20', '2021-08-05 07:02:20', 'b9706a99-095f-4f6d-afd8-e29e11e66984'),
(191, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2021-08-05 07:38:21', '2021-08-05 07:38:21', '2021-08-05 07:38:21', 'b409e11b-9722-4101-ba65-2399d00a1117'),
(192, 'plugin:redactor', 'Install', '2021-08-05 07:38:21', '2021-08-05 07:38:21', '2021-08-05 07:38:21', '557f7543-3ce0-4d20-a25d-cab7cae205e4'),
(193, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2021-08-05 07:38:21', '2021-08-05 07:38:21', '2021-08-05 07:38:21', '28131eff-eb24-4252-b68b-c2ee96ae6aff');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.8', '2.3.0', 'unknown', NULL, '2021-08-05 07:38:21', '2021-08-05 07:38:21', '2021-08-05 08:08:41', '7f7a7ee0-ec19-48de-9794-40a2e51163c2');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1628151697'),
('email.fromEmail', '\"kritika01@gmail.com\"'),
('email.fromName', '\"Craft CMS Demo\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.class', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.disabled', 'false'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.id', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.instructions', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.label', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.max', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.min', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.name', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.orientation', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.readonly', 'false'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.requirable', 'false'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.size', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.step', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.tip', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.title', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.warning', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.0.width', '100'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.fieldUid', '\"579c0fbf-ee3b-42ed-a05d-659ce95916e7\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.instructions', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.label', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.required', 'false'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.tip', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.warning', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.elements.1.width', '100'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.name', '\"Content\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.fieldLayouts.8b2bfcc3-1233-4355-bc0f-48f89c39d00e.tabs.0.sortOrder', '1'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.handle', '\"home\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.hasTitleField', 'false'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.name', '\"Home\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.section', '\"7cf52a4c-f280-47a3-a067-a288f37dbd81\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.sortOrder', '1'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.titleTranslationKeyFormat', 'null'),
('entryTypes.01548255-ac52-442a-97cb-9a670f2be032.titleTranslationMethod', '\"site\"'),
('fieldGroups.42a502c3-75c8-4511-a1da-18094b792c24.name', '\"Common\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.columnSuffix', '\"sdriwuzz\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.contentColumnType', '\"text\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.fieldGroup', '\"42a502c3-75c8-4511-a1da-18094b792c24\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.handle', '\"richText\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.instructions', '\"\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.name', '\"Rich Text\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.searchable', 'false'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.availableTransforms', '\"*\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.availableVolumes', '\"*\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.cleanupHtml', 'true'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.columnType', '\"text\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.configSelectionMode', '\"choose\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.defaultTransform', '\"\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.manualConfig', '\"\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.purifierConfig', '\"\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.purifyHtml', '\"1\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.redactorConfig', '\"\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.removeEmptyTags', '\"1\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.removeInlineStyles', '\"1\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.removeNbsp', '\"1\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.showHtmlButtonForNonAdmins', '\"1\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.showUnpermittedFiles', 'true'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.showUnpermittedVolumes', 'true'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.settings.uiMode', '\"enlarged\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.translationKeyFormat', 'null'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.translationMethod', '\"none\"'),
('fields.579c0fbf-ee3b-42ed-a05d-659ce95916e7.type', '\"craft\\\\redactor\\\\Field\"'),
('meta.__names__.01548255-ac52-442a-97cb-9a670f2be032', '\"Home\"'),
('meta.__names__.42a502c3-75c8-4511-a1da-18094b792c24', '\"Common\"'),
('meta.__names__.579c0fbf-ee3b-42ed-a05d-659ce95916e7', '\"Rich Text\"'),
('meta.__names__.7cf52a4c-f280-47a3-a067-a288f37dbd81', '\"Home\"'),
('meta.__names__.a00cdfe6-f9ce-4683-90ce-fc81d296b749', '\"Craft CMS Demo\"'),
('meta.__names__.fd9be23f-bcf7-48fb-aa11-90ea374b6d90', '\"Craft CMS Demo\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.defaultPlacement', '\"end\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.enableVersioning', 'true'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.handle', '\"home\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.name', '\"Home\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.propagationMethod', '\"all\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.siteSettings.a00cdfe6-f9ce-4683-90ce-fc81d296b749.enabledByDefault', 'true'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.siteSettings.a00cdfe6-f9ce-4683-90ce-fc81d296b749.hasUrls', 'true'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.siteSettings.a00cdfe6-f9ce-4683-90ce-fc81d296b749.template', '\"index\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.siteSettings.a00cdfe6-f9ce-4683-90ce-fc81d296b749.uriFormat', '\"__home__\"'),
('sections.7cf52a4c-f280-47a3-a067-a288f37dbd81.type', '\"single\"'),
('siteGroups.fd9be23f-bcf7-48fb-aa11-90ea374b6d90.name', '\"Craft CMS Demo\"'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.handle', '\"default\"'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.hasUrls', 'true'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.language', '\"en-US\"'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.name', '\"Craft CMS Demo\"'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.primary', 'true'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.siteGroup', '\"fd9be23f-bcf7-48fb-aa11-90ea374b6d90\"'),
('sites.a00cdfe6-f9ce-4683-90ce-fc81d296b749.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Craft CMS Demo\"'),
('system.schemaVersion', '\"3.7.7\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('145f9071', '@lib/element-resize-detector'),
('19a4da62', '@lib/element-resize-detector'),
('1c409c69', '@lib/iframe-resizer-cw'),
('23cb4e4f', '@craft/web/assets/fieldsettings/dist'),
('2420413', '@lib/jquery-ui'),
('27bb86ea', '@lib/velocity'),
('2a40ccf9', '@lib/velocity'),
('36347197', '@bower/jquery/dist'),
('36676311', '@lib/jquery.payment'),
('37935c57', '@craft/web/assets/updateswidget/dist'),
('3b9c2902', '@lib/jquery.payment'),
('3bcf3b84', '@bower/jquery/dist'),
('3d8d84fa', '@craft/web/assets/pluginstore/dist'),
('43d5b460', '@lib/vue'),
('4ceb9fb6', '@lib/velocity'),
('4d8b0466', '@app/web/assets/dashboard/dist'),
('4e2efe73', '@lib/vue'),
('4e3c964e', '@craft/web/assets/fields/dist'),
('50cc305e', '@lib/jquery.payment'),
('5d6468cb', '@bower/jquery/dist'),
('5f5d63d1', '@craft/web/assets/login/dist'),
('625d5ca9', '@app/web/assets/sites/dist'),
('63c55d06', '@lib/axios'),
('64dc6672', '@craft/redactor/assets/redactor/dist'),
('64e9575c', '@lib/jquery-ui'),
('668975d1', '@craft/redactor/assets/redactor-plugins/dist/video'),
('684ee958', '@craft/web/assets/feed/dist'),
('69121d4f', '@lib/jquery-ui'),
('6d11e74b', '@craft/web/assets/cp/dist'),
('70e5705', '@modules/demomodule/assetbundles/demomodule/dist'),
('72f4c33e', '@lib/element-resize-detector'),
('771fbd0c', '@craft/web/assets/utilities/dist'),
('77252654', '@lib/axios'),
('7ee0c16', '@craft/web/assets/admintable/dist'),
('85b079c8', '@lib/selectize'),
('87867ac7', '@lib/garnishjs'),
('89249b1f', '@craft/web/assets/craftsupport/dist'),
('895445a', '@lib/axios'),
('8a7d30d4', '@lib/garnishjs'),
('8ab85f54', '@app/web/assets/login/dist'),
('8ad05ce6', '@app/web/assets/recententries/dist'),
('91e56e5', '@app/web/assets/cp/dist'),
('9291e39', '@craft/web/assets/recententries/dist'),
('92c0aef9', '@lib/fabric'),
('9695d35c', '@craft/web/assets/dashboard/dist'),
('9f3be4ea', '@lib/fabric'),
('a0db1613', '@lib/d3'),
('a2764cee', '@lib/fileupload'),
('a32e39ea', '@lib/iframe-resizer'),
('a3e38308', '@app/web/assets/craftsupport/dist'),
('a960f20f', '@craft/web/assets/utilities/dist'),
('ab955da4', '@craft/web/assets/plugins/dist'),
('aed573f9', '@lib/iframe-resizer'),
('af8d06fd', '@lib/fileupload'),
('b0c13bc1', '@lib/jquery-touch-events'),
('b36ea848', '@craft/web/assets/cp/dist'),
('b43b6d41', '@lib/d3'),
('b46a1e88', '@app/web/assets/updateswidget/dist'),
('b633115c', '@craft/web/assets/editentry/dist'),
('b7650703', '@lib/picturefill'),
('b88a893a', '@app/web/assets/login/dist'),
('b9d543d8', '@app/web/assets/generalsettings/dist'),
('ba9e4d10', '@lib/picturefill'),
('bd3a71d2', '@lib/jquery-touch-events'),
('c09dab85', '@lib/xregexp'),
('c3004aa6', '@app/web/assets/cp/dist'),
('c5856aa5', '@lib/iframe-resizer'),
('c92655b2', '@lib/fileupload'),
('c9582a38', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('cf728090', '@craft/web/assets/dashboard/dist'),
('d0c3c8d3', '@craft/web/assets/craftsupport/dist'),
('d1ce544c', '@lib/picturefill'),
('d66a688e', '@lib/jquery-touch-events'),
('d756513a', '@craft/web/assets/recententries/dist'),
('d9914315', '@craft/web/assets/admintable/dist'),
('de951765', '@craft/web/assets/updater/dist'),
('df6b741d', '@lib/d3'),
('e31b2a87', '@lib/selectize'),
('e3f2cbf9', '@craft/web/assets/pluginstore/dist'),
('e48c241e', '@lib/xregexp'),
('e7f5a052', '@craft/web/assets/installer/dist'),
('e9776e0d', '@lib/xregexp'),
('e9ec1354', '@craft/web/assets/updateswidget/dist'),
('ecd6639b', '@lib/garnishjs'),
('eee06094', '@lib/selectize'),
('efd44290', '@craft/web/assets/editentry/dist'),
('f1d04deb', '@craft/redactor/assets/field/dist'),
('f4ab527a', '@craft/web/assets/editsection/dist'),
('f5e639fa', '@app/web/assets/utilities/dist'),
('f990b7a5', '@lib/fabric');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, 'Applied “Draft 1”'),
(6, 2, 1, 6, 'Applied “Draft 1”');

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' kritika01 gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' home '),
(2, 'slug', 0, 1, ' home ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 'all', 'end', NULL, '2021-08-05 07:14:26', '2021-08-05 07:14:26', NULL, '7cf52a4c-f280-47a3-a067-a288f37dbd81');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'index', 1, '2021-08-05 07:14:26', '2021-08-05 07:14:26', 'fc0548b9-6af1-4c79-9828-5dc3e15fabf7');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft CMS Demo', '2021-08-05 07:02:06', '2021-08-05 07:02:06', NULL, 'fd9be23f-bcf7-48fb-aa11-90ea374b6d90');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Craft CMS Demo', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-08-05 07:02:06', '2021-08-05 07:02:06', NULL, 'a00cdfe6-f9ce-4683-90ce-fc81d296b749');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'mmKOOH7uBZxbWyqH2zyffRlqDCWXqXXs', '[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":2,\"siteId\":1,\"draftId\":2,\"revisionId\":null,\"provisional\":true}]', NULL, NULL, '2021-08-06 08:25:57', '2021-08-05 08:25:57', '2021-08-05 08:25:57', '88da73d4-df16-44b1-9e71-ddd7bbb5deaf');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'kritika01@gmail.com', '$2y$13$hj9WnhxFMpPOH9QJN/HxKe5Lx8lDFKJ2Lf78Ym/6vN9E45yqTAzwW', 1, 0, 0, 0, '2021-08-05 07:09:01', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-08-05 07:02:08', '2021-08-05 07:02:08', '2021-08-05 07:09:04', 'ef767e35-16d9-46f3-8bbe-6347eb660a96');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-08-05 07:09:04', '2021-08-05 07:09:04', 'c2bca39a-ce14-4667-8d89-e7387fcff417'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-08-05 07:09:04', '2021-08-05 07:09:04', 'c4fda478-eedf-4f6e-9a46-d9aa01aa8ccd'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-08-05 07:09:04', '2021-08-05 07:09:04', '0fb0efb2-e9ac-4641-bdc4-52db3d70d150'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-08-05 07:09:04', '2021-08-05 07:09:04', '1781cc0d-b2df-48c5-892c-285103e55945');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wiiutzwsfaylobgxsfpqcoxybfrokqmwimru` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_tebbzbwgyvqjgqhhndkuhbsmdeftcpzhhxvi` (`dateRead`),
  ADD KEY `fk_cshnrcnlqwjwtzddvarekkcwkfbpvktwdrzq` (`pluginId`);

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bjbavxdxozygpnacxomwounzwrdqdxxkqxya` (`sessionId`,`volumeId`),
  ADD KEY `idx_sruebzzxwbumewfwcwajtayvshhzkxpjspvn` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_muxtluwzbzpxrjkwrjrtmylwscrofgvmsaui` (`filename`,`folderId`),
  ADD KEY `idx_qiqcxkixrklukdaujtwczktmtgqxbnpyxcrg` (`folderId`),
  ADD KEY `idx_ksqnmiipjonwanfmybjefjkmejjdpfpqtwuw` (`volumeId`),
  ADD KEY `fk_eimfwcoyxktbjwwitqbxxxamgmddpegyzfsf` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_spdtlcepbzqwtgyjjuaajmmljbwgygrcnxyh` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cidmckkdekltjaitffizjjpphmupkgazbmoa` (`name`),
  ADD KEY `idx_mrzjkfmdafmuivlvcocdyhtbejlejbpzwmed` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_owjwrvllnsthqeicwoimlorlxzqpukfdwawa` (`groupId`),
  ADD KEY `fk_onuqsqvbneieifkcemgmnjpvdjitdhafywoy` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_suhmcytnegnewrjjovzutzqmqahhyswzneyc` (`name`),
  ADD KEY `idx_gglwajkoeymacchpjqbivchrwhfvinbmnpbf` (`handle`),
  ADD KEY `idx_yycqzzuzwwhoyitxvradfdfjoupehgvlogdh` (`structureId`),
  ADD KEY `idx_llberevxvispfvfvxrmkyhwxlsweiacscvgm` (`fieldLayoutId`),
  ADD KEY `idx_lckvnofljewykfnfvokqqezuxbqdsvofmqif` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ywdkqmesjiywgplozwzpdxvtfznfuxtjvozm` (`groupId`,`siteId`),
  ADD KEY `idx_auynfssjhnxanzpzorojbmoomvuxhxswmeht` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_tiungmftzrdhwtshfegzontkettkpvsehdes` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_cbkuypddkeziavdnumgsiwbuiwrdzaajszsy` (`siteId`),
  ADD KEY `fk_lttovkxopciyapglliwpsbsqzqfecdeahmsk` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_gtdsmefbjiodqzpdlmdgjrmsmdsfzbdjhcds` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_iyfglinlibtwlmfctbjxanzkqwzvbcocdxkm` (`siteId`),
  ADD KEY `fk_tsbdihrfdcopdewfljhwjhxwzunacqsjkeen` (`fieldId`),
  ADD KEY `fk_rkhfsifneqmcbxpcaaweialcqjnnhhrdxowg` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_iavajmryolpykvaavckrnovwobdjbqxmaatv` (`elementId`,`siteId`),
  ADD KEY `idx_vsajoqwgsvtbnwqnaotbcrbweykdaoqipyfa` (`siteId`),
  ADD KEY `idx_bryqetzhefycymqldfgtruwqpzhdaumyxves` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_xozoavepdtqlkaaxsnpwwznfvuzwqorwojzb` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hezpunxwmkokjbodwthagfxqjjhljprbxkva` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ltqlagofanywwoofxckwfbdxyvirejwnzpzh` (`creatorId`,`provisional`),
  ADD KEY `idx_fpnhlclvqmwacoxcnwjbxdojtqaxzzmmmsvj` (`saved`),
  ADD KEY `fk_wujcrvzgvzcnsoofhbtfzunfjfvjcasgrmfv` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_blpvmxznansyjchbkyekxgxnubvwlpldgcwo` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vxsdknznpqbnxwsdgekkskeyhuublwyvapij` (`dateDeleted`),
  ADD KEY `idx_yvawejesworkrpvtlbylfyhjjtgickxqrifo` (`fieldLayoutId`),
  ADD KEY `idx_tlymziyqmtunsagmzhnehkfhbyypmfnvxyyt` (`type`),
  ADD KEY `idx_zhocwexdhrnrfyarideteqwuqceltnmcnnzb` (`enabled`),
  ADD KEY `idx_ttrbjhhkheqguiygghsemblilnzsqbyjzuqu` (`archived`,`dateCreated`),
  ADD KEY `idx_qtydbdydligdgswfuopuiykxmgcjishvbgfs` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `fk_yvjdxivnyyzjcjbgzlmkywoarzwinyqclwid` (`canonicalId`),
  ADD KEY `fk_ramcqvfifhsasvauofhboptxvtzvvnmxdxnf` (`draftId`),
  ADD KEY `fk_evdfslhzwqdvncfeogceljmkyzenxzintjij` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_suhnzhsujdosztyrugdzjkwrhofzuqkkzibb` (`elementId`,`siteId`),
  ADD KEY `idx_oyoitiygikitonszalaniydqhrzcoefgllkm` (`siteId`),
  ADD KEY `idx_yvldonoyygycdbfcamofjsdfetalguxuggce` (`slug`,`siteId`),
  ADD KEY `idx_wpyhxwejkujbktxahzojdxisfrsvisgfljst` (`enabled`),
  ADD KEY `idx_idahxsxmhaxrssupndcqnryfyztpbihhxcgu` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_apheffiveyfsilhkzimfjfeouihtuatfxxtc` (`postDate`),
  ADD KEY `idx_gdurgftdrsutcvljgrjqlxvgalgafpwpxnvl` (`expiryDate`),
  ADD KEY `idx_ubwwhzbxortopchfcykukfdrefsugpcqyesu` (`authorId`),
  ADD KEY `idx_kjdwzvywfdbrrdbimishvrehinqmpwnagkjj` (`sectionId`),
  ADD KEY `idx_lanmiuxjjttazutkwsggfquedgkuzllowltv` (`typeId`),
  ADD KEY `fk_alpuxlllsxkqmlnoofofiseepxgykizajyiz` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_umakechaktufnvdvcowajsyjmwiokjkngnjd` (`name`,`sectionId`),
  ADD KEY `idx_xsxmaxeimosvjdnqwwiirdnsrtetettvorrj` (`handle`,`sectionId`),
  ADD KEY `idx_aalsogkgssprjmjikyhgodrmqsnsiopoqoee` (`sectionId`),
  ADD KEY `idx_uivjnwrygptkycwqabtlcbjnzajnyvhsjnve` (`fieldLayoutId`),
  ADD KEY `idx_onrkpvrkeuesvztctdarypwvoofgtwgxycvk` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hftilnfzlodbycwgcsrmonmsehzsxeuodnhx` (`name`),
  ADD KEY `idx_fsuokwemvtllzlyxuhtodjfwjsoanjnujunm` (`dateDeleted`,`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vgcqqyxhjrwtjpyhrsljpzzmnlavdhlfwtlk` (`layoutId`,`fieldId`),
  ADD KEY `idx_uzynjdkvvqmcohfzfvpzjwynrjjqbmqjjnug` (`sortOrder`),
  ADD KEY `idx_nfblyozsuuikmbgmzqesqdwkiynbdrivnglk` (`tabId`),
  ADD KEY `idx_xhwmauppqstummgnftuzzbzxizlwmdopszti` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xpowxvbcmghjqjykwgrbyqkkhzwrpdyhdbox` (`dateDeleted`),
  ADD KEY `idx_itowrdiewuuxuzfyvgnavihfjopgevaupjql` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_knqgelubyovliwqzgqxnefvyxqosavlelzjm` (`sortOrder`),
  ADD KEY `idx_qwoixrrxdvxdxhzkxpqxekwxhepjsdhvejhn` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rdmgdxozkocywlqdxhsoredozyftmvmsdxmj` (`handle`,`context`),
  ADD KEY `idx_djailhdkwkhwnbwvwvetrgyvbcamwejldewb` (`groupId`),
  ADD KEY `idx_orpwjjnjlrxmseynwwxrzyvswshvqbytcwig` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_haojwakckqcmxpxbalombbvyllbznjfbwmcq` (`name`),
  ADD KEY `idx_lvshvazdednzctrivoysqdauermdglioxzte` (`handle`),
  ADD KEY `idx_ftyvnoffjdyqorwmlqwxvkprqzjnrqokdbio` (`fieldLayoutId`),
  ADD KEY `idx_qzbtiugacjngadkoizihqrjdrlnstvfpzced` (`sortOrder`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ueofhxzogybawhmiotwoepcwqhsrbbxaqunc` (`accessToken`),
  ADD UNIQUE KEY `idx_dkvpbnkkibftrgwozjphyqblqasiddjwrdwm` (`name`),
  ADD KEY `fk_exgkbnpemmnaerryvcihsciurqrlhrodgpdi` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qcfctrizcctfhtvtkgjjnttlgevpqcdmzapi` (`ownerId`),
  ADD KEY `idx_rnclkxhpelkrqkhmyykshcbtzawatwhhgfyj` (`fieldId`),
  ADD KEY `idx_ffzykcnvvybabnvxedrwlrbxussderuxazxi` (`typeId`),
  ADD KEY `idx_izdjsxntjtmsrkhnxzorlosxxeyshffjmhcs` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ieyybnvahmsltaxfceueeubpjkcakzfdvuje` (`name`,`fieldId`),
  ADD KEY `idx_eiuseopsviuaousedbamopqdzvynxtkgihnc` (`handle`,`fieldId`),
  ADD KEY `idx_vtdnoejbvoyopmyeexksewdzgtrcvebjtsiy` (`fieldId`),
  ADD KEY `idx_bjrvhsgsprqtxyklyvvfyuqpokvmrftojrmf` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_irogntixrtfxlpukugcvpnlaxeldeybbzojp` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lrwlmenwpmiucsbewbgvyzqyvbyheksfhomb` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_oioeqioxqvpudiztzfighfvqtyhjtbijilzp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_gxxbohfzaddchjorwltbmgenhpltsdmabkyn` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_nweyenljxinkcymplvzcerjqnxyfhmirnmgs` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_dcvvrlwqxejzcpftpbnvruelslowjzmzujgp` (`sourceId`),
  ADD KEY `idx_tavggfoinhvjmwmdfsrthyfzpbdcydcddyob` (`targetId`),
  ADD KEY `idx_ygtwybtvdnoeammpejgpqakivyqqsqsnaomx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fprzoukjuewjwknpdwmvetxanekidoutcszr` (`sourceId`,`num`),
  ADD KEY `fk_kalbyehirhbjgybuignfmfylcpfhewcwnpwv` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_znnlevwolrywimyerohcmhyxmywkndiefzhd` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uxkudgipgcwsfuvzlhlepdflheqimfbjilru` (`handle`),
  ADD KEY `idx_oezsnfqyobwkovvrnmeonvtlckzrhpubuvux` (`name`),
  ADD KEY `idx_pzitxobgvklcguwdwxhoxfkobytkdxxagvzv` (`structureId`),
  ADD KEY `idx_brctyelvunclhhhwxxgvsqxdaxlxesluoiid` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_geovawtvjcddohqxjbjqctxufjodmgpoeirr` (`sectionId`,`siteId`),
  ADD KEY `idx_jiodjvggzpqwuolspghqpiucgrrbdayqukfl` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iitiedeubkhyqpfjjnocgpdrwyocpswxzsxc` (`uid`),
  ADD KEY `idx_vzoshhfkiolnslkyhipntethplmgqkqcotuo` (`token`),
  ADD KEY `idx_vosifwcdiwsadtgdniqkwiwswjknkdhqtwoy` (`dateUpdated`),
  ADD KEY `idx_feopzvupmkdhguqphyijrscpfqxkolobmjsz` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vnouulqtqcpyloepkyalrhreirvubfubvhwt` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wdbggghojdkkvkovkzxlhtbkhpygyhyocdba` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kqqegelmrsduvxnnuoyfpcmdlpfywbejodda` (`dateDeleted`),
  ADD KEY `idx_ztfbppmkcmvyytsdxmztsgifqblnyqwanefe` (`handle`),
  ADD KEY `idx_ckjatrlvvhnrwjrchwaxqmvgpzrxwwddxecq` (`sortOrder`),
  ADD KEY `fk_xoubkuykpyrgrjmfzftmydcukxkpdnuxjlay` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uvnzblbosspqcaqxjnaqddlptoczyspbwfau` (`structureId`,`elementId`),
  ADD KEY `idx_sbkkfhvnmihnxvedbagrdoiogwqmvwlvlwrz` (`root`),
  ADD KEY `idx_pskvvhkxxoaesqqmkczpbzvnkaoqzjjzlzvv` (`lft`),
  ADD KEY `idx_lwymbfrtyjthwzoixwjetjdfkdyvmshcklvb` (`rgt`),
  ADD KEY `idx_jtnyqyiyjpkciroqlspkmnbnwurzowxakjko` (`level`),
  ADD KEY `idx_ipkspmrnxhwskulypykqkjquepcacpktnxep` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_npvgdbisuxaeynxpdpdwyamcxbdkgmacsxzv` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rkhqtzxdcmxrbbeztchowjnmbiwivuzsjsuq` (`key`,`language`),
  ADD KEY `idx_sdwxddlmauchuvjkosufevxoaomnsuwzaktc` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hhdwnbpusadkqnfftkgbmmrymwmrfneaoayr` (`name`),
  ADD KEY `idx_ihkijhzddlyjtkepuqxgwwhcipamvwkbheug` (`handle`),
  ADD KEY `idx_kybulxjmolynpjuygtpmuudyjyanidzuhryc` (`dateDeleted`),
  ADD KEY `fk_lqeckddnclglpraglvsbcyrdwviljacunwur` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ixrdmrgebrxnuzrutsblaquhnociihyxhtoc` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sqfobuitdqwfbfijiecxbtgcvkqxdjhsorwi` (`cacheId`),
  ADD KEY `idx_bgyholkvwlshspqkbjnotpmjsjpzspkhgyvi` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qzrsoegyvjjelywveezzsmhybzlzpzunbdcm` (`cacheId`),
  ADD KEY `idx_wpjzquhekvtyjmrncdebizxdtcfoqdhrvlvg` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dqvjnkuulkdslniiwtugzkfkltqccwtlchar` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_bqmonwnkytzzmshrsytmotlcoenqxvbprewz` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_phrxrctzderijmkfgwstzoksazwbjqynfzlh` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_quwpanubvxuohjaprnktktaqbtoagjabdylo` (`token`),
  ADD KEY `idx_wrswhoprgefxwwuxizqadtlsfxehealvyhwq` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_oqaajvoebiubojwqfwrnrspeiavhpepvvqkr` (`handle`),
  ADD KEY `idx_pqpjjkrstvernpnufkzszbebltaeyisbzavc` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bklhtljvajdysbzoskuvaeychvbfoixyqwns` (`groupId`,`userId`),
  ADD KEY `idx_czwxsrgiefjhmrensdhdxnwbzrcgjwpaogtt` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_qjgovuybecmzgwifjjlblzsqcmzuzcwxxopc` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fekmsntwduwwkqkfnpbvraogldmhcqiujkiy` (`permissionId`,`groupId`),
  ADD KEY `idx_vagnjqiqtaythefosxxwhyyscxrxgehzbsld` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vpklmeuvqtxhxajzhcfwjduqnxldhpldaeoi` (`permissionId`,`userId`),
  ADD KEY `idx_roacmqljqvrebxjbsiazowiqjephrcyfgauf` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nevymzjxkncrdpxrtbjkfxvpmxiezdcyuxur` (`uid`),
  ADD KEY `idx_hlkzmlivmxldxarjcdwjnqciitszpxxuxbjn` (`verificationCode`),
  ADD KEY `idx_huapihafrakkrhezkushtrpxqasjulivbbhq` (`email`),
  ADD KEY `idx_jtxhorioebliaiezjwlclmwmnnmecprgiubw` (`username`),
  ADD KEY `fk_pcrjfofnlvhafvklnrzeyetrsoafjnvqcffx` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_talqimfmxevqsvvmxerabvjpxvrudcuxxvyq` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_ehpfbmcktscwjvkudddugfolrjpknbskbdbw` (`parentId`),
  ADD KEY `idx_jqshgkkvhabhppaypndsdxzlhrbmegfjtxko` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pjdpgwxingxzqouinndkvwqglfjusxnbqoca` (`name`),
  ADD KEY `idx_gytudvmjzveftspmjvucxzefjnilhunrqgok` (`handle`),
  ADD KEY `idx_feacdxaalljtjhghaocdpbyntaahoeqgcnog` (`fieldLayoutId`),
  ADD KEY `idx_gfusfsbmwoenqryebntjtamgwmefzbgffbcs` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yxlsbtsbhqgihvbyhsnwpwbklokonmdzuoeh` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_cshnrcnlqwjwtzddvarekkcwkfbpvktwdrzq` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vqdgoydpejllprtvobytajtfbqqdsaocggxg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_teurwezqqbrflwawotnexsqayfxfwajgowen` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_eimfwcoyxktbjwwitqbxxxamgmddpegyzfsf` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_haotyjrkhxvjdrqmkanaxnrcppahfzbdwntb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xyyaopabfebddxryjrdcbrntlopsyiatlbun` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zbnlfercbzkntpetqrjzfzvicdrrnxjcdkyk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_dsxdnpknahbkpzmawutmowxbkfuwqhfnbowa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_onuqsqvbneieifkcemgmnjpvdjitdhafywoy` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_rvmyvmxbkudrqtflmwshvtoljjpywzkffply` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_nflyjalzmazztqarewagvjfmouqxnvbnbpjp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_nltxwzwpariehclqshvglvqigonncbfmekuu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_pstrhtiztfkfripsalnsfeepwoqvwcxxrzur` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_slswpbniyyetuxirjbewqsycohtjeweggqbq` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_cbkuypddkeziavdnumgsiwbuiwrdzaajszsy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lttovkxopciyapglliwpsbsqzqfecdeahmsk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_xbjwlfdjjqirufmqixwkirmnxncqrlkgjldn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_iyfglinlibtwlmfctbjxanzkqwzvbcocdxkm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lxlkkxertspqrdgqbabnkekzwsepihwkgxgi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rkhfsifneqmcbxpcaaweialcqjnnhhrdxowg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tsbdihrfdcopdewfljhwjhxwzunacqsjkeen` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_wppnkksxtxzuaiefrwfppdvczfpndcoxroaj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yjaoxpzfemrigigebcduirtultraicoiojby` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_xozoavepdtqlkaaxsnpwwznfvuzwqorwojzb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_ceeywapzhplfqhxtggxbwxxnpyhkaxqrlmfo` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wujcrvzgvzcnsoofhbtfzunfjfvjcasgrmfv` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_bkaclpapgfyazjeecxevvtwmmazexedxtllc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_evdfslhzwqdvncfeogceljmkyzenxzintjij` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ramcqvfifhsasvauofhboptxvtzvvnmxdxnf` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yvjdxivnyyzjcjbgzlmkywoarzwinyqclwid` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_refhxkvjqdesrgfrmdxlgihbnicnjcpueesu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xknqbpzvbazvpjvygickihbzcspfpxkfbvmy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_alpuxlllsxkqmlnoofofiseepxgykizajyiz` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_cwxvbmjarbbivwxrybjoshbzzunzjsmfhlet` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cywxawnkehhvtryrpitbssuorxyftfxnrcxn` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hoxdjzrtwnmtpzpzkzzqvzispstoykhwhjfk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pwotrcuknoypuwnorxukhgzgohpwubbfvwsw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_fisbqmzxsvoqmkmsxtcqfzyzmoulypodusbh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qohhlcmjphciilwqrhxedjfvaatkdfcuwjfr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_fniszrunflmorkwmkagjglofalqywhbrmjbh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ladmpdptresuqdnryxbfyzlnnoqcgnpofjau` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qerawrtchxocqhlqthcqxidrjhhbdeamymhb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_caqohtmpgfkubfbvgnyfalxhfnsdhbofjrax` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_lekxmxsyrryjqhelydwvekpwvuhukwolodco` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_urdqmfhqkfqgoxxetzxwdqqdmywxzxyqxsrc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yrhggbmkllkuhdkkpzkmdhhweumirpqddaui` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_exgkbnpemmnaerryvcihsciurqrlhrodgpdi` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_gkrglzeuvuhfoskadfdpbunnqrdhukvcowdd` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hehsxizxexaqdojbgjldzuxnemlrkmmshcbz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_psvyjmyferearwvxrpolmvsfiibpmbxuwjzh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_thnvfamehwrkrmaqzuxowzxsqgssdwkvjhbs` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_ngbfyxcvnpwnitjgersiwcepwinemsufxcgv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vxsmxgicdwfdmfmxehinsoijoidmcvwotivo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_dopldpucrbustyujfnfdkaqrwtxeezgtondm` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ebnrhacngmcdtikfhqumcuqowagsbqohelia` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jmqpsikpelixjzmgagwavextusnnyqaqpccl` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lbahejlzokgiumvpsysuxjjlovbitdnrxkrt` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_kalbyehirhbjgybuignfmfylcpfhewcwnpwv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wqvjclljsmgsmwgtcyyjaulwehnwtkiuvvmy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_sgtzknjfkjcvyeflildvqquyqtnrbjysoqyj` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_eftwsrtnyqwwmrquwubhjmkguutzrxsanrjf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yzctcpupinukasmchcurxojamteeyfysfevi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_sefshngwqneuxhzmuokaicqzrjufwuornjnz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_kyhtihipkyryrdazxaeqaivlbognwtafuakf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_xoubkuykpyrgrjmfzftmydcukxkpdnuxjlay` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_ugdpbmsltlgikkrjzupfxmgdrocrsyveyahu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xpwarevisrgbvpcywoofjpgezqhnvivzcfzb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_lqeckddnclglpraglvsbcyrdwviljacunwur` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_atlsluqyckrfwrsztwrimuiygvmjzlydvtmx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nmdsztlbuhobnvgtocuxiussykkkfghreogw` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_ejkpjddxocxyssncgyychlbyphwvhbtaabdi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wbsdtbtiibwcfwipqcbjfvrmydgbroregsvo` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_owmgskwasedmpgnbrgijwlhwworcreiskpdg` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_bppjwihxrgxsjoiygpscrzotpiqnaushdmwe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_crexzhwkcfsthgrpmesulsteiitbbtjaqpuk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sersdzjezvkspiyccrnihmghdfuafmmkzsfm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_rdsouebfdpxnxzfwnudjwhggblppuriogvuo` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_snmojxnsofwbfhyjgidlabdbslrasjniugor` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_kpysjtmjxlaeyoivtgpltlshqxfexwbkpgwd` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xywmjidvmlpxjqbseejuwlqdjccqftgtpdyr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_enceqfqrsquwwnmsimxbdsyotllnylysfdgb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_pcrjfofnlvhafvklnrzeyetrsoafjnvqcffx` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sisfeomirccdwgqewfzohvhgsctjzmlxabbe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_gwtnvvgsaljvzaiwyrsbvdfeftenbaeqxqeu` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rxvvowjdqgmuidodoceyknovwfgwjrywqerk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_cksgldqvcywpgeiyjxuxeirarvirlciatkon` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_sevccdjurpcxnzploncynmplsmbtxurxdlpf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
