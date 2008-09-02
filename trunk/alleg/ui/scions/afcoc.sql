-- phpMyAdmin SQL Dump
-- version 2.11.3deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2008 at 12:11 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.4-2ubuntu5.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `alleg`
--

-- --------------------------------------------------------

--
-- Table structure for table `afcoc`
--

CREATE TABLE IF NOT EXISTS `afcoc` (
  `id` int(100) NOT NULL auto_increment,
  `sector_name` varchar(100) NOT NULL,
  `available_techs` varchar(100) NOT NULL,
  `treasures` varchar(100) NOT NULL,
  `total_cash` varchar(100) NOT NULL,
  `resources` varchar(100) NOT NULL,
  `starting_cash` varchar(100) NOT NULL,
  `map` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `visibility` varchar(100) NOT NULL,
  `backgrounds` varchar(500) NOT NULL,
  `icons` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `afcoc`
--

INSERT INTO `afcoc` (`id`, `sector_name`, `available_techs`, `treasures`, `total_cash`, `resources`, `starting_cash`, `map`, `location`, `visibility`, `backgrounds`, `icons`, `timestamp`) VALUES
(1, 'Jupiter', 'Tac Exp Sup', '2', '4', '4', '3', 'LargeHighHigher', '514,679', ' rebels scions', '', '', '2008-08-24 19:20:04'),
(2, 'Rebel', 'Tac Exp Sup', '2', '4', '4', '3', 'LargeHighHigher', '514,123', '', '', '', '0000-00-00 00:00:00'),
(3, 'Gobo', 'Tac Exp Sup', '3', '5', '4', '3', 'LargeStar', '695,400', '', '', '', '0000-00-00 00:00:00'),
(4, 'Yavin', 'Sup', '1', '1', '5', '3', 'InsideOut', '605,492', '', '', '', '0000-00-00 00:00:00'),
(5, 'Helios', 'Tac Exp Sup', '3', '6', '6', '6', 'Sapphire', '237,492', '', '', '', '0000-00-00 00:00:00'),
(6, 'Rigel', 'Tac Exp Sup', '3', '5', '1', '3', 'Jade', '792,492', '', '', '', '0000-00-00 00:00:00'),
(7, 'Ploor', 'Tac Exp Sup', '2', '5', '7', '2', 'LargeStar', '605,308', '', '', '', '0000-00-00 00:00:00'),
(8, 'Delgon', 'Tac Exp Sup', '2', '7', '3', '1', 'Sapphire', '932,679', '', '', '', '0000-00-00 00:00:00'),
(9, 'Velantia', 'Tac Exp Sup', '2', '4', '4', '3', 'Palladium', '696,633', '', '', '', '0000-00-00 00:00:00'),
(10, 'Denom', 'Tac', '1', '5', '5', '3', 'LargeStar', '422,492', '', '', '', '0000-00-00 00:00:00'),
(11, 'Thrale', 'Tac Exp Sup', '3', '2', '8', '4', 'LargeSplit', '330,400', '', '', '', '0000-00-00 00:00:00'),
(12, 'Eich', 'Exp', '1', '1', '5', '2', 'LargeSplit', '514,308', '', '', '', '0000-00-00 00:00:00'),
(13, 'Arisia', 'Tac Exp Sup', '2', '3', '8', '6', 'Sliver', '792,586', '', '', '', '0000-00-00 00:00:00'),
(14, 'Mars', 'Tac Exp Sup', '2', '2', '4', '3', 'PolishedDiamond', '695,168', '', '', '', '0000-00-00 00:00:00'),
(15, 'Venus', 'Tac Exp Sup', '2', '5', '2', '2', 'Kill', '792,214', '', '', '', '0000-00-00 00:00:00'),
(16, 'Saturn', 'Tac Exp Sup', '2', '4', '3', '6', 'Blender', '330,168', '', '', '', '0000-00-00 00:00:00'),
(17, 'Neptune', 'Tac Exp Sup', '2', '6', '4', '3', 'Star', '330,633', '', '', '', '0000-00-00 00:00:00'),
(18, 'Pluto', 'Tac Exp Sup', '2', '3', '7', '5', 'Topaz', '144,586', '', '', '', '0000-00-00 00:00:00'),
(19, 'Mercury', 'Tac Exp Sup', '2', '7', '6', '2', 'Ruby', '94,119', '', '', '', '0000-00-00 00:00:00'),
(20, 'Metis', 'Tac Exp Sup', '2', '4', '4', '2', 'SplitMix', '882,308', '', '', '', '0000-00-00 00:00:00'),
(21, 'Thebe', 'Sup Exp', '1', '2', '5', '4', 'LargeGrid', '605,400', ' rebels', '', '', '2008-08-24 19:36:32'),
(22, 'Leda', 'Tac Sup', '1', '4', '5', '3', 'PolishedDiamond', '514,492', '', '', '', '0000-00-00 00:00:00'),
(23, 'Callisto', 'Tac Exp Sup', '3', '1', '4', '3', 'InsideOut', '237,307', '', '', '', '2008-08-24 19:36:42'),
(24, 'Pan', 'Tac Exp Sup', '2', '3', '3', '5', 'HighHigher', '422,307', '', '', '', '0000-00-00 00:00:00'),
(25, 'Atlas', 'Tac Exp Sup', '3', '4', '2', '2', 'Star', '792,308', '', '', '', '0000-00-00 00:00:00'),
(26, 'Titan', 'Tac Exp Sup', '2', '7', '4', '4', 'LimitedDiamond', '237,586', '', '', '', '0000-00-00 00:00:00'),
(27, 'Rhea', 'Tac Exp Sup', '2', '6', '3', '3', 'Platinum', '422,167', '', '', '', '0000-00-00 00:00:00'),
(28, 'Io', 'Tac Exp Sup', '2', '1', '4', '2', 'Palladium', '423,633', '', '', '', '0000-00-00 00:00:00'),
(29, 'Ariel', 'Tac Exp Sup', '2', '5', '3', '3', 'SplitMix', '140,307', '', '', '', '2008-08-24 19:36:35'),
(30, 'Oberon', 'Tac Exp Sup', '2', '3', '4', '4', 'Platinum', '557,214', '', '', '', '0000-00-00 00:00:00'),
(31, 'Umbriel', 'Tac Exp Sup', '2', '4', '3', '3', 'Blender', '882,492', '', '', '', '0000-00-00 00:00:00'),
(32, 'Despina', 'Tac Exp Sup', '2', '3', '7', '5', 'Ruby', '234,214', '', '', '', '0000-00-00 00:00:00'),
(33, 'Triton', 'Tac Exp Sup', '2', '4', '4', '3', 'Chaos', '470,214', '', '', '', '0000-00-00 00:00:00'),
(34, 'Gala', 'Tac Exp Sup', '2', '2', '8', '4', 'Destroy', '605,633', '', '', '', '0000-00-00 00:00:00'),
(35, 'Charon', 'Tac Exp Sup', '2', '5', '4', '1', 'Kill', '558,586', '', '', '', '0000-00-00 00:00:00'),
(36, 'Phobos', 'Tac Exp Sup', '2', '2', '1', '2', 'Chaos', '468,586', '', '', '', '0000-00-00 00:00:00'),
(37, 'Pook', 'Tac Exp Sup', '2', '4', '4', '5', 'Jade', '603,168', '', '', '', '0000-00-00 00:00:00'),
(38, 'Solap', 'Tac Exp Sup', '2', '8', '5', '7', 'Palladium', '144,492', ' scions', '', '', '2008-08-24 19:36:50'),
(39, 'Thalgor', 'Tac Exp Sup', '2', '1', '1', '1', 'LargeHighHigher', '94,679', ' rebels', '', '', '2008-08-24 19:36:47'),
(40, 'Titty Baby', 'Tac Exp Sup', '2', '4', '4', '4', 'Topaz', '930,120', '', '', '', '0000-00-00 00:00:00'),
(41, 'Lyra', 'Tac Exp', '1', '2', '5', '3', 'InsideOut', '422,400', '', '', '', '2008-08-24 19:36:39'),
(42, 'Optimus', 'Tac Exp Sup', '2', '7', '2', '4', 'LargeGrid', '930,400', '', '', '', '0000-00-00 00:00:00'),
(43, 'Fwiffo', 'Tac Exp Sup', '2', '2', '4', '2', 'Sliver', '144,214', '', '', '', '0000-00-00 00:00:00'),
(44, 'FreeBeer', 'Tac Exp Sup', '2', '5', '4', '3', 'LargeStar', '94,400', '', '', '', '0000-00-00 00:00:00'),
(45, 'Cowbell', 'Tac Exp Sup', '2', '3', '3', '2', 'LimitedDiamond', '882,214', '', '', '', '0000-00-00 00:00:00'),
(46, 'Sp4wn', 'Tac Exp Sup', '2', '6', '4', '3', 'Star', '882,586', '', '', '', '0000-00-00 00:00:00');
