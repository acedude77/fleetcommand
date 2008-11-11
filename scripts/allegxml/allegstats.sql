-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 11, 2008 at 02:33 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6-2ubuntu4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `allegstats`
--

-- --------------------------------------------------------

--
-- Table structure for table `fileinfo`
--

DROP TABLE IF EXISTS `fileinfo`;
CREATE TABLE IF NOT EXISTS `fileinfo` (
  `id` int(100) NOT NULL auto_increment,
  `filename` varchar(100) NOT NULL,
  `checksum` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `gameinfo`
--

DROP TABLE IF EXISTS `gameinfo`;
CREATE TABLE IF NOT EXISTS `gameinfo` (
  `id` int(100) NOT NULL auto_increment,
  `Server` varchar(100) NOT NULL,
  `GameOverReason` varchar(100) NOT NULL,
  `Date` varchar(100) NOT NULL,
  `Core` varchar(100) NOT NULL,
  `checksum` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `playerinfo`
--

DROP TABLE IF EXISTS `playerinfo`;
CREATE TABLE IF NOT EXISTS `playerinfo` (
  `id` int(100) NOT NULL auto_increment,
  `Kills` varchar(100) NOT NULL,
  `TimePlayed` varchar(100) NOT NULL,
  `BaseKills` varchar(100) NOT NULL,
  `IsCommander` varchar(100) NOT NULL,
  `TeamNumber` varchar(100) NOT NULL,
  `Ejections` varchar(100) NOT NULL,
  `Score` varchar(100) NOT NULL,
  `Deaths` varchar(100) NOT NULL,
  `Rank` varchar(100) NOT NULL,
  `Assists` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `BaseCaptures` varchar(100) NOT NULL,
  `checksum` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=672 ;

-- --------------------------------------------------------

--
-- Table structure for table `teaminfo`
--

DROP TABLE IF EXISTS `teaminfo`;
CREATE TABLE IF NOT EXISTS `teaminfo` (
  `id` int(100) NOT NULL auto_increment,
  `Faction` varchar(100) NOT NULL,
  `TeamNumber` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `checksum` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;
