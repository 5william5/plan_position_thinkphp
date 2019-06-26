-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-06-20 09:53:36
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `en_plan_position`
--

-- --------------------------------------------------------

--
-- 表的结构 `airport_code`
--

CREATE TABLE `airport_code` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(3) NOT NULL,
  `airport` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `airport_code`
--

INSERT INTO `airport_code` (`id`, `code`, `airport`) VALUES
(1, 'PVG', '上海浦东'),
(2, 'PEK', '北京首都'),
(3, 'ZQZ', '张家口'),
(4, 'YZY', '张掖'),
(5, 'WMT', '遵义茅台'),
(6, 'ZYI', '遵义新舟'),
(7, 'ZHA', '湛江'),
(8, 'HJJ', '芷江'),
(9, 'ZHY', '中卫'),
(10, 'CGO', '郑州'),
(11, 'HSN', '舟山'),
(12, 'DYG', '张家界'),
(13, 'ZAT', '昭通'),
(14, 'ZUH', '珠海'),
(15, 'LDS', '伊春'),
(16, 'YIN', '伊宁'),
(17, 'YUS', '玉树'),
(18, 'YNJ', '延吉'),
(19, 'YNZ', '盐城'),
(20, 'YIC', '宜春'),
(21, 'YBP', '宜宾'),
(22, 'YIH', '宜昌'),
(23, 'INC', '银川'),
(24, 'YNT', '烟台'),
(25, 'YCU', '运城'),
(26, 'ENY', '延安'),
(27, 'YTY', '扬州'),
(28, 'UYN', '榆林'),
(29, 'LLF', '永州'),
(30, 'YIW', '义乌'),
(31, 'HKG', '中国香港'),
(32, 'XUZ', '徐州'),
(33, 'JHG', '版纳'),
(34, 'XIL', '锡林浩特'),
(35, 'XFN', '襄阳'),
(36, 'XNN', '西宁'),
(37, 'SIA', '西安'),
(38, 'DIG', '香格里拉'),
(39, 'XMN', '厦门'),
(40, 'XIC', '西昌'),
(41, 'ACX', '兴义'),
(42, 'WUA', '乌海'),
(43, 'WXN', '万州'),
(44, 'URC', '乌鲁木齐'),
(45, 'WNZ', '温州'),
(46, 'HLH', '乌兰浩特'),
(47, 'WUS', '武夷山'),
(48, 'WEF', '潍坊'),
(49, 'WUX', '无锡'),
(50, 'WNH', '文山'),
(51, 'WUZ', '梧州'),
(52, 'WUH', '武汉'),
(53, 'WEH', '威海'),
(54, 'TTT', '台东'),
(55, 'TNN', '台南'),
(56, 'RMQ', '台中'),
(57, 'TPE', '台北'),
(58, 'YTY', '泰州'),
(59, 'TYN', '太原'),
(60, 'TLQ', '吐鲁番'),
(61, 'TGO', '通辽'),
(62, 'TSN', '天津'),
(63, 'THQ', '天水'),
(64, 'HYN', '台州'),
(65, 'TCZ', '腾冲'),
(66, 'TCG', '塔城'),
(67, 'TEN', '铜仁'),
(68, 'TVS', '唐山'),
(69, 'HPG', '神农架'),
(70, 'SHA', '上海虹桥'),
(71, 'SHE', '沈阳'),
(72, 'SYX', '三亚'),
(73, 'SJW', '石家庄'),
(74, 'SZX', '深圳'),
(75, 'RKZ', '日喀则'),
(76, 'HBQ', '祁连'),
(77, 'CMJ', '七美'),
(78, 'TAO', '青岛'),
(79, 'NDG', '齐齐哈尔'),
(80, 'IQM', '且末'),
(81, 'IQN', '庆阳'),
(82, 'SHP', '秦皇岛'),
(83, 'JIQ', '黔江'),
(84, 'JUZ', '衢州'),
(85, 'SYM', '普洱'),
(86, 'PZI', '攀枝花'),
(87, 'LZN', '南竿'),
(88, 'NGB', '宁波'),
(89, 'NLT', '那拉提'),
(90, 'KHN', '南昌'),
(91, 'NTG', '南通'),
(92, 'NNY', '南阳'),
(93, 'NNG', '南宁'),
(94, 'NAO', '南充'),
(95, 'NKG', '南京'),
(96, 'MFK', '马祖'),
(97, 'MZG', '马公'),
(99, 'OHE', '漠河'),
(100, 'MXZ', '梅县'),
(101, 'MIG', '绵阳'),
(102, 'NZH', '满洲里'),
(103, 'MDG', '牡丹江'),
(104, 'LUM', '芒市'),
(105, 'LLV', '吕梁'),
(106, 'LYI', '临沂'),
(107, 'LNJ', '临沧'),
(108, 'LXA', '拉萨'),
(109, 'LCX', '连城'),
(110, 'HZH', '黎平'),
(111, 'LYG', '连云港'),
(112, 'LZO', '泸州'),
(113, 'LZH', '柳州'),
(114, 'LZY', '林芝'),
(115, 'LLB', '荔波'),
(116, 'LJG', '丽江'),
(117, 'LYA', '洛阳'),
(118, 'LHW', '兰州'),
(119, 'KJH', '凯里'),
(120, 'KJI', '喀纳斯'),
(121, 'KCA', '库车'),
(122, 'KRL', '库尔勒'),
(123, 'KRY', '克拉玛依'),
(124, 'KGT', '康定'),
(125, 'KMG', '昆明'),
(126, 'KHG', '喀什'),
(127, 'CYI', '嘉义'),
(128, 'KNH', '金门'),
(129, 'SWA', '揭阳'),
(130, 'JIC', '金昌'),
(131, 'JGD', '加格达奇'),
(132, 'TNA', '济南'),
(133, 'JMU', '佳木斯'),
(134, 'JIU', '九江'),
(135, 'JNG', '济宁'),
(136, 'JGS', '井冈山'),
(137, 'JGN', '嘉峪关'),
(138, 'JDZ', '景德镇'),
(139, 'JNZ', '锦州'),
(140, 'JJN', '晋江'),
(141, 'JXA', '鸡西'),
(142, 'HUN', '花莲'),
(143, 'HIA', '淮安'),
(144, 'HTN', '和田'),
(145, 'HZG', '汉中'),
(146, 'JZH', '黄龙'),
(147, 'HFE', '合肥'),
(148, 'HDG', '邯郸'),
(149, 'HGH', '杭州'),
(150, 'TXN', '黄山'),
(151, 'HAK', '海口'),
(152, 'HRB', '哈尔滨'),
(153, 'HLD', '海拉尔'),
(154, 'HEK', '黑河'),
(155, 'HET', '呼和浩特'),
(156, 'HMI', '哈密'),
(157, 'GNI', '格林岛'),
(158, 'KHH', '高雄'),
(159, 'GYU', '固原'),
(160, 'KOW', '赣州'),
(161, 'GOQ', '格尔木'),
(162, 'GYS', '广元'),
(163, 'CAN', '广州'),
(164, 'KWL', '桂林'),
(165, 'KWE', '贵阳'),
(166, 'FYJ', '抚远'),
(167, 'FUG', '阜阳'),
(168, 'FOC', '福州'),
(169, 'FUO', '佛山'),
(170, 'EJN', '额济纳旗'),
(171, 'ERL', '二连浩特'),
(172, 'DSN', '鄂尔多斯'),
(173, 'ENH', '恩施'),
(174, 'DCY', '稻城'),
(175, 'DAX', '达州'),
(176, 'DNH', '敦煌'),
(177, 'DLU', '大理'),
(178, 'DDG', '丹东'),
(179, 'DQA', '大庆'),
(180, 'DOY', '东营'),
(181, 'DLC', '大连'),
(182, 'DAT', '大同'),
(183, 'CIF', '赤峰'),
(184, 'CSX', '长沙'),
(185, 'CKG', '重庆'),
(186, 'CTU', '成都'),
(187, 'NBS', '长白山'),
(188, 'CGD', '常德'),
(189, 'CHG', '朝阳'),
(190, 'BPX', '昌都'),
(191, 'CZX', '常州'),
(192, 'CGQ', '长春'),
(193, 'JUH', '池州'),
(194, 'CSX', '长治'),
(195, 'RLK', '巴彦淖尔'),
(196, 'BFJ', '毕节'),
(197, 'BPL', '博乐'),
(198, 'BSD', '保山'),
(199, 'AEB', '百色'),
(200, 'BJS', '北京'),
(201, 'BHY', '北海'),
(202, 'BAV', '包头'),
(203, 'MFM', '中国澳门'),
(204, 'RHT', '阿拉善右旗'),
(205, 'AXF', '阿拉善左旗'),
(206, 'AKU', '阿克苏'),
(207, 'AVA', '安顺'),
(208, 'AOG', '鞍山'),
(209, 'AKA', '安康'),
(210, 'AAT', '阿勒泰'),
(211, 'AQG', '安庆'),
(212, 'YIE', '阿尔山'),
(213, 'NGQ', '阿里');

-- --------------------------------------------------------

--
-- 表的结构 `air_line_table`
--

CREATE TABLE `air_line_table` (
  `id` int(11) UNSIGNED NOT NULL,
  `air_line_code` varchar(24) NOT NULL,
  `air_line_text` varchar(30) NOT NULL,
  `flight` varchar(50) NOT NULL,
  `differ_days` varchar(10) NOT NULL,
  `month` varchar(7) NOT NULL,
  `manager` varchar(20) NOT NULL,
  `group_id` mediumint(8) NOT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `air_line_table`
--

INSERT INTO `air_line_table` (`id`, `air_line_code`, `air_line_text`, `flight`, `differ_days`, `month`, `manager`, `group_id`, `delete_time`) VALUES
(17, 'KMGLJGJHGKMG', '昆明-丽江-版纳-昆明', 'KY1596-KY8596-KY8595', '5-3', '2019-06', 'minef', 2, NULL),
(18, 'KMGTCZKMG', '昆明-腾冲-昆明', 'KY1596-KY1595', '4', '2019-06', '科目', 2, NULL),
(19, 'WUHJHGWUH', '武汉-版纳-武汉', 'MU5968-MU5964', '4', '2019-05', '李明', 1, 1561023611),
(20, 'KMGTCZ', '昆明-腾冲', 'KY8596', '', '2019-06', '科目', 1, NULL),
(24, 'PEKLJGPEK', '北京首都-丽江-北京首都', 'MU8789-MU7886', '5', '2019-07', '份额', 1, 1561023656),
(25, 'SHAKMGSHA', '上海虹桥-昆明-上海虹桥', 'HO8569-HO8599', '5', '2019-06', 'ds', 1, 1560822063),
(26, 'JHGKMGJHG', '版纳-昆明-版纳', 'HO8465-HO8455', '4', '2019-06', 'gtgt', 1, 1560763887),
(27, 'LJGTCZKMG', '丽江-腾冲-昆明', 'JD1596-JD8563', '5', '2019-06', 'dd', 1, NULL),
(28, 'HGHDLUHGH', '杭州-大理-杭州', 'GJ8569-GJ2236', '6', '2019-06', 'saf', 1, NULL),
(29, 'TAOKMGTAO', '青岛-昆明-青岛', 'CA8569-CA5693', '5', '2019-06', 'kui', 1, NULL),
(30, 'WUHJHGKMGWUH', '武汉-版纳-昆明-武汉', 'MU4586-MU5256-MU8486', '3-4', '2019-08', 'fgr', 1, NULL),
(31, 'KMGJHGKMG', '昆明-版纳-昆明', 'MU1536-MU1563', '5', '2019-06', 'fdgf', 1, NULL),
(32, 'SHAKMGSHA', '上海虹桥-昆明-上海虹桥', 'MU8456-MU8942', '5', '2019-07', 'dgf', 1, NULL),
(34, 'KMGCKGKMG', '昆明-重庆-昆明', 'MU8569-MU8547', '5', '2019-07', '度丢', 1, 1560485954),
(37, 'CKGLUMCKG', '重庆-芒市-重庆', 'MU8569-MU1536', '3', '2019-06', '', 1, 1560492741),
(38, 'CANLJGCAN', '广州-丽江-广州', 'CZ5968-CZ2156', '5', '2019-07', '', 1, 1561018560),
(39, 'KMGLJGKMG', '昆明-丽江-昆明', 'MU8594-MU8595', '6', '2019-06', '', 1, NULL),
(40, 'HGHJHGHGH', '杭州-版纳-杭州', 'MU8596-MU8594', '6', '2019-06', '', 1, NULL),
(41, 'KMGDLUKMG', '昆明-大理-昆明', '8L8569-8L4586', '3', '2019-07', '', 1, 1560933920),
(42, 'KMGLUM,TCZKMG', '昆明-芒市&腾冲-昆明', 'MU8768-MU8972', '6', '2019-07', '', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_group`
--

INSERT INTO `auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '团队1部', 1, '1,3,4'),
(2, '团队2部', 1, '1,3,4'),
(3, '团队3部', 1, '1,3,4'),
(4, '团队4部', 1, '1,3,4'),
(5, '团队5部', 1, '1,3,4'),
(6, '团队管理部', 1, '1,8');

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_access`
--

CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_group_access`
--

INSERT INTO `auth_group_access` (`uid`, `group_id`) VALUES
(2, 1),
(3, 2),
(4, 6),
(5, 2),
(7, 1),
(7, 2),
(10, 3),
(16, 3),
(17, 3),
(17, 4);

-- --------------------------------------------------------

--
-- 表的结构 `auth_rule`
--

CREATE TABLE `auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_rule`
--

INSERT INTO `auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `pid`) VALUES
(1, 'menu-0', '计划位管理', 1, 1, '', 0),
(2, 'menu-1', '用户角色管理', 1, 1, '', 0),
(3, 'menu-0-0', '计划位查看', 1, 1, '', 1),
(4, 'menu-0-1', '本部计划位管理', 1, 1, '', 1),
(5, 'menu-0-2', '基础数据设置', 1, 1, '', 1),
(6, 'menu-1-0', '用户管理', 1, 1, '', 2),
(7, 'menu-1-1', '角色管理', 1, 1, '', 2),
(8, 'menu-0-3', '计划位高级查看', 1, 1, '', 1),
(9, 'menu-0-4', '高级数据操作', 1, 1, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `definite_pass_table`
--

CREATE TABLE `definite_pass_table` (
  `id` int(11) UNSIGNED NOT NULL,
  `definite_record_id` int(11) UNSIGNED NOT NULL,
  `plan_position_id` int(11) UNSIGNED NOT NULL,
  `pass_name` varchar(20) NOT NULL,
  `pass_id` varchar(18) NOT NULL,
  `ticket_number` varchar(14) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `definite_pass_table`
--

INSERT INTO `definite_pass_table` (`id`, `definite_record_id`, `plan_position_id`, `pass_name`, `pass_id`, `ticket_number`, `delete_time`) VALUES
(93, 23, 650, '蔡红霞', '320925197312222829', NULL, NULL),
(94, 23, 650, '陈来军', '320925197508312850', NULL, NULL),
(95, 23, 650, '薛琴', '32062319701106782X', NULL, NULL),
(96, 23, 650, '叶飞', '320623197601200029', NULL, NULL),
(97, 23, 650, '秦治源', '320623197809127828', NULL, NULL),
(98, 23, 650, '秦秀云', '320623195903257822', NULL, NULL),
(99, 23, 650, '徐守平', '320623196707095103', NULL, NULL),
(100, 23, 650, '赵兴凤', '320623196403174224', NULL, NULL),
(101, 23, 650, '程林', '320623195808140052', NULL, NULL),
(102, 23, 650, '姚远', '320623195511270067', NULL, NULL),
(103, 25, 650, '曹永平', '320624196605092039', '456-4567890124', 1559573294),
(104, 25, 650, '李忠', '320625196403290519', '852-4567890124', NULL),
(105, 25, 650, '朱永泉', '32062419510510123X', '258-1234567890', NULL),
(106, 25, 650, '王兴香', '320624196801072422', '432-4567890789', NULL),
(107, 25, 650, '朱建辉', '320624196403082078', '987-6543210123', 1559545461),
(108, 25, 650, '丁羽熙', '320621201610170200', '321-6549870123', NULL),
(110, 25, 650, '丁雯雯', '320621198710233024', '123-4567898125', NULL),
(112, 28, 650, '王锦晔', '350981200503100235', NULL, NULL),
(113, 28, 650, '韦思美', '320121195602092120', NULL, NULL),
(114, 28, 650, '王韩章', '352202198012092013', NULL, NULL),
(115, 28, 650, '王文霞', '320121198507272127', NULL, NULL),
(118, 30, 1047, '欧阳欣怡', '431322201006160520', NULL, 1560485954),
(119, 30, 1047, '欧文东', '432524198712034038', NULL, 1560485954),
(120, 30, 1047, '曾小娟', '432524198804291445', NULL, 1560485954),
(121, 31, 1171, '蔡霄昱', '310115200107103210', NULL, 1560494097),
(122, 31, 1171, '杨海琼', '310229197208041425', NULL, 1560494097),
(123, 31, 1171, '齐逸鹏', '310112200503051513', NULL, 1560494097),
(124, 32, 1172, '殷广惠', '130684199008013026', '258-9656325120', 1560499053),
(125, 32, 1172, '郑凯', '360421199104205235', '458-5623587454', 1560499053),
(126, 33, 1172, '殷广惠', '130684199008013026', '258-9656325121', 1560765024),
(127, 33, 1172, '郑凯', '360421199104205235', '458-5623587454', 1560765024),
(128, 33, 1172, '杨巍强', '230103197806072813', '230-1031978065', 1560765024),
(129, 33, 1172, '杨译皓', '230103201211017311', '230-1032012110', 1560765024),
(130, 33, 1172, '段淋铭', '230107197809220425', '230-1071978092', 1560765024),
(131, 33, 1172, '测试的', '21535152325131', '1234567890456', 1560765024),
(132, 34, 1202, '黄建平', '432426195612270052', '456-1023589879', 1560765187),
(133, 36, 1204, '钟付萍', '360311198706254023', NULL, 1560822209),
(134, 36, 1204, '汪咪咪', '362322199808143020', NULL, 1560822226),
(135, 38, 1232, '李灵杰', '412702198811253622', NULL, 1560924891),
(136, 38, 1232, '任大玲', '412702196911267424', NULL, 1560933846),
(137, 38, 1232, '张连山', '412702196707207432', NULL, 1560933867),
(138, 39, 1294, '刘彬钰', '142731199704260326', '123-5875698785', 1560933920),
(139, 39, 1294, '赵雯', '140702199610087063', '154-6897541256', 1560933920),
(140, 39, 1294, '李嘉琪', '140202199612016528', '158-4698745213', 1560933920),
(141, 39, 1294, '旅的额', '586486522544', '1234567890789', 1560933920),
(142, 40, 1172, '刘慧敏', '320123199111032044', NULL, 1561018482),
(143, 40, 1172, '李梅', '341225198708086828', NULL, 1561018498),
(144, 41, 1233, '陈丽荣', '642101198106282528', '789-4561230124', 1561019035),
(145, 41, 1233, '李静', '64020319810527002X', '987-6543210123', 1561019035),
(146, 41, 1233, '控件', '3425352', '7896541230123', 1561019035),
(147, 42, 1296, '刘慧敏', '320123199111032044', '1230987654345', NULL),
(148, 42, 1296, '李梅', '341225198708086828', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `definite_record`
--

CREATE TABLE `definite_record` (
  `id` int(11) UNSIGNED NOT NULL,
  `plan_position_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  `submitter` varchar(20) NOT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `definite_record`
--

INSERT INTO `definite_record` (`id`, `plan_position_id`, `title`, `create_time`, `submitter`, `delete_time`) VALUES
(23, 650, 'fe', '2019-05-24 14:17:37', '张三', NULL),
(25, 650, 'kk', '2019-06-03 10:53:17', '张三', NULL),
(26, 923, '饿哦我', '2019-05-31 16:24:58', '张三', NULL),
(28, 650, 'rew', '2019-06-03 22:54:44', '张三', NULL),
(30, 1047, '333333', '2019-06-14 12:18:12', '张三', 1560485954),
(31, 1171, '333', '2019-06-14 14:33:27', '张三', 1560494097),
(32, 1172, 'gr', '2019-06-14 15:49:19', '张三', 1560499053),
(33, 1172, 'jy', '2019-06-15 11:14:02', '张三', 1560765024),
(34, 1202, '科陆峰侠', '2019-06-17 11:54:16', '张三', 1560822084),
(35, 1202, '厦门空灵', '2019-06-17 11:54:40', '张三', 1560822084),
(36, 1204, 'gfg', '2019-06-18 09:42:32', '张三', 1560822226),
(37, 1204, 'ghg', '2019-06-18 10:49:41', '张三', NULL),
(38, 1232, 'fefeg', '2019-06-19 14:02:44', '张三', 1560933867),
(39, 1294, 'dfdrrf344', '2019-06-19 14:38:43', '张三', 1560933920),
(40, 1172, 'fgfg', '2019-06-20 16:14:14', '张三', 1561018498),
(41, 1233, '看就看', '2019-06-20 16:20:06', '张三', 1561019035),
(42, 1296, 'hgj', '2019-06-20 17:47:21', '张三', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `plan_log`
--

CREATE TABLE `plan_log` (
  `id` int(11) NOT NULL,
  `air_line_id` int(11) NOT NULL,
  `plan_position_id` int(11) DEFAULT NULL,
  `reserve_record_id` int(11) DEFAULT NULL,
  `definite_record_id` int(11) DEFAULT NULL,
  `definite_pass_id` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL COMMENT 'air_line\\plan_position\\reserve_record\\definite_record\\definite_pass',
  `action` varchar(20) NOT NULL COMMENT 'add\\updata\\delete\\recovery',
  `action_field` varchar(20) DEFAULT NULL COMMENT '变更字段',
  `before_value` varchar(200) DEFAULT NULL,
  `after_value` varchar(200) DEFAULT NULL,
  `submiter` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `plan_log`
--

INSERT INTO `plan_log` (`id`, `air_line_id`, `plan_position_id`, `reserve_record_id`, `definite_record_id`, `definite_pass_id`, `type`, `action`, `action_field`, `before_value`, `after_value`, `submiter`, `create_time`) VALUES
(1, 36, NULL, NULL, NULL, NULL, 'air_line', 'updata', 'flight', 'MU8556-MU9878', 'MU8554-MU9878', '张三', '2019-06-13 08:56:20'),
(2, 36, 1140, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-13 09:32:33'),
(3, 36, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '张三', '2019-06-14 02:28:50'),
(9, 37, 1141, NULL, NULL, NULL, 'plan_position', 'updata', 'reserve_price', '900', '905', '张三', '2019-06-14 05:24:54'),
(10, 37, 1141, NULL, NULL, NULL, 'plan_position', 'updata', 'air_time', '14:10-15:15', '14:15-15:35', '张三', '2019-06-14 05:24:54'),
(11, 37, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '张三', '2019-06-14 06:12:21'),
(12, 32, 1016, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '张三', '2019-06-14 06:20:13'),
(13, 38, 1171, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '张三', '2019-06-14 06:34:57'),
(14, 38, 1172, 46, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-14 07:02:37'),
(15, 38, 1172, 46, NULL, NULL, 'reserve_record', 'updata', 'title', 'ccc', 'kkk', '张三', '2019-06-14 07:20:16'),
(16, 38, 1172, 46, NULL, NULL, 'reserve_record', 'updata', 'quantity', '4', '5', '张三', '2019-06-14 07:20:16'),
(17, 38, 1172, 46, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '张三', '2019-06-14 07:27:34'),
(18, 38, 1172, NULL, 32, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-14 07:35:18'),
(19, 38, 1172, NULL, 32, NULL, 'definite_record', 'updata', 'title', 'ff', 'gr', '张三', '2019-06-14 07:49:19'),
(20, 38, 1172, NULL, 32, NULL, 'definite_record', 'delete', NULL, NULL, NULL, '张三', '2019-06-14 07:57:33'),
(21, 38, 1172, NULL, 33, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-14 08:18:30'),
(22, 38, 1172, NULL, 33, 126, 'definite_pass', 'updata', 'ticket_number', NULL, '123-4567890123', '张三', '2019-06-14 08:19:16'),
(23, 38, 1172, NULL, 33, 127, 'definite_pass', 'updata', 'ticket_number', NULL, '123-4567890124', '张三', '2019-06-14 08:19:16'),
(24, 38, 1172, NULL, 33, 126, 'definite_pass', 'updata', 'ticket_number', '123-4567890123', '258-9656325120', '张三', '2019-06-14 08:21:12'),
(25, 38, 1172, NULL, 33, 127, 'definite_pass', 'updata', 'ticket_number', '123-4567890124', '458-5623587454', '张三', '2019-06-14 08:21:12'),
(26, 38, 1172, NULL, 33, 128, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-14 08:46:16'),
(27, 38, 1172, NULL, 33, 129, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-14 08:46:16'),
(28, 38, 1172, NULL, 33, 130, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-14 08:46:16'),
(29, 38, 1172, NULL, 33, 128, 'definite_pass', 'updata', 'ticket_number', NULL, '230-1031978060', '张三', '2019-06-14 08:49:08'),
(30, 38, 1172, NULL, 33, 129, 'definite_pass', 'updata', 'ticket_number', NULL, '230-1032012110', '张三', '2019-06-14 08:49:08'),
(31, 38, 1172, NULL, 33, 130, 'definite_pass', 'updata', 'ticket_number', NULL, '230-1071978092', '张三', '2019-06-14 08:49:08'),
(32, 38, 1172, NULL, 33, 131, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-14 08:58:10'),
(33, 38, 1172, NULL, 33, 126, 'definite_pass', 'updata', 'ticket_number', '258-9656325120', '258-9656325121', '张三', '2019-06-14 09:08:47'),
(34, 38, 1172, NULL, 33, 128, 'definite_pass', 'updata', 'pass_name', '杨巍', '杨巍强', '张三', '2019-06-14 09:09:20'),
(35, 38, 1172, NULL, 33, 128, 'definite_pass', 'updata', 'pass_id', '230103197806072812', '230103197806072813', '张三', '2019-06-14 09:09:20'),
(36, 38, 1172, NULL, 33, 128, 'definite_pass', 'updata', 'ticket_number', '230-1031978060', '230-1031978065', '张三', '2019-06-14 09:09:20'),
(37, 38, 1172, NULL, 33, 127, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-15 01:43:27'),
(38, 38, 1172, NULL, 33, 127, 'definite_pass', 'recovery', NULL, NULL, NULL, '张三', '2019-06-15 01:56:10'),
(41, 38, 1172, NULL, 33, 127, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-15 02:22:23'),
(42, 38, 1172, NULL, 33, 127, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-15 02:25:55'),
(43, 38, 1172, NULL, 33, 127, 'definite_pass', 'recovery', NULL, NULL, NULL, '张三', '2019-06-15 02:35:30'),
(44, 38, 1172, NULL, 33, 127, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-15 03:08:08'),
(45, 38, 1172, NULL, 33, 127, 'definite_pass', 'recovery', NULL, NULL, NULL, '张三', '2019-06-15 03:09:23'),
(46, 38, 1172, NULL, 33, NULL, 'definite_record', 'updata', 'title', 'gj', 'jy', '张三', '2019-06-15 03:14:02'),
(47, 39, NULL, NULL, NULL, NULL, 'air_line', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(48, 39, 1202, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(49, 39, 1203, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(50, 39, 1204, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(51, 39, 1205, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(52, 39, 1206, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(53, 39, 1207, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(54, 39, 1208, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(55, 39, 1209, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(56, 39, 1210, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(57, 39, 1211, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(58, 39, 1212, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(59, 39, 1213, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(60, 39, 1214, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(61, 39, 1215, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(62, 39, 1216, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(63, 39, 1217, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(64, 39, 1218, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(65, 39, 1219, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(66, 39, 1220, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(67, 39, 1221, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(68, 39, 1222, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(69, 39, 1223, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(70, 39, 1224, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(71, 39, 1225, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(72, 39, 1226, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(73, 39, 1227, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(74, 39, 1228, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(75, 39, 1229, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(76, 39, 1230, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(77, 39, 1231, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-15 03:50:21'),
(78, 39, NULL, NULL, NULL, NULL, 'air_line', 'updata', 'flight', 'MU8596-MU8595', 'MU8594-MU8595', '张三', '2019-06-15 08:40:28'),
(79, 39, 1202, NULL, NULL, NULL, 'plan_position', 'updata', 'air_time', '07:40-09:15', '07:55-09:15', '张三', '2019-06-15 09:02:37'),
(80, 39, 1202, NULL, NULL, NULL, 'plan_position', 'updata', 'policy_state', '', '已出票', '张三', '2019-06-15 09:07:54'),
(81, 39, 1202, NULL, NULL, NULL, 'plan_position', 'updata', 'policy_state', '已出票', '', '张三', '2019-06-15 09:38:59'),
(82, 39, 1202, 47, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-17 01:37:51'),
(83, 39, 1202, 47, NULL, NULL, 'reserve_record', 'updata', 'quantity', '3', '5', '张三', '2019-06-17 01:38:14'),
(84, 39, 1202, NULL, 34, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-17 02:14:28'),
(85, 39, 1202, NULL, 34, 132, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-17 02:23:53'),
(86, 39, 1202, NULL, 34, 132, 'definite_pass', 'updata', 'pass_id', '432426195612270053', '432426195612270052', '张三', '2019-06-17 02:33:05'),
(87, 39, 1202, NULL, 34, 132, 'definite_pass', 'updata', 'ticket_number', NULL, '456-1023589879', '张三', '2019-06-17 02:35:09'),
(88, 39, 1202, NULL, 34, NULL, 'definite_record', 'updata', 'title', 'gege', 'grww', '张三', '2019-06-17 02:51:32'),
(89, 39, 1202, 47, NULL, NULL, 'reserve_record', 'updata', 'title', 'ge', '光大留位，在隔壁村出票，要问问有没有带伞', '张三', '2019-06-17 02:56:14'),
(90, 39, 1202, 47, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '张三', '2019-06-17 03:17:59'),
(91, 39, 1202, 48, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-17 03:20:39'),
(92, 39, 1202, 48, NULL, NULL, 'reserve_record', 'updata', 'title', '阿里旅行', '阿里旅行非凡', '张三', '2019-06-17 03:48:31'),
(93, 39, 1202, 49, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-17 03:49:42'),
(94, 39, 1202, NULL, 34, NULL, 'definite_record', 'updata', 'title', 'grww', '科陆峰侠', '张三', '2019-06-17 03:54:16'),
(95, 39, 1202, NULL, 35, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-17 03:54:40'),
(96, 26, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-17 09:31:27'),
(97, 31, 986, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-17 09:36:00'),
(98, 38, 1173, 50, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-17 09:42:00'),
(99, 38, 1173, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-17 09:42:31'),
(100, 39, 1202, 49, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-17 09:46:27'),
(101, 38, 1172, NULL, 33, NULL, 'definite_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-17 09:50:24'),
(102, 39, 1202, NULL, 34, 132, 'definite_pass', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-17 09:53:07'),
(103, 39, 1203, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:37:00'),
(104, 25, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:41:03'),
(105, 39, 1205, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:41:12'),
(106, 39, 1202, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:41:24'),
(107, 39, 1204, 51, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-18 01:42:25'),
(108, 39, 1204, NULL, 36, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-18 01:42:32'),
(109, 39, 1204, NULL, 36, 133, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-18 01:42:52'),
(110, 39, 1204, NULL, 36, 134, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-18 01:42:52'),
(111, 39, 1204, 51, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:43:24'),
(112, 39, 1204, NULL, 36, 133, 'definite_pass', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:43:29'),
(113, 39, 1204, NULL, 36, NULL, 'definite_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-18 01:43:46'),
(114, 39, 1204, NULL, 37, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-18 02:49:41'),
(115, 40, NULL, NULL, NULL, NULL, 'air_line', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(116, 40, 1232, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(117, 40, 1233, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(118, 40, 1234, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(119, 40, 1235, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(120, 40, 1236, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(121, 40, 1237, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(122, 40, 1238, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(123, 40, 1239, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(124, 40, 1240, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(125, 40, 1241, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(126, 40, 1242, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(127, 40, 1243, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(128, 40, 1244, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(129, 40, 1245, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(130, 40, 1246, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(131, 40, 1247, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(132, 40, 1248, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(133, 40, 1249, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(134, 40, 1250, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(135, 40, 1251, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(136, 40, 1252, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(137, 40, 1253, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(138, 40, 1254, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(139, 40, 1255, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(140, 40, 1256, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(141, 40, 1257, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(142, 40, 1258, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(143, 40, 1259, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(144, 40, 1260, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(145, 40, 1261, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 07:25:50'),
(146, 40, NULL, NULL, NULL, NULL, 'air_line', 'updata', 'flight', 'MU8596-MU8595', 'MU8596-MU8594', '张三', '2019-06-18 07:46:35'),
(147, 40, 1262, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-18 08:26:30'),
(148, 40, 1232, NULL, NULL, NULL, 'plan_position', 'updata', 'air_time', '08:55-10:10', '08:01-10:10', '张三', '2019-06-18 09:13:07'),
(149, 40, 1232, NULL, NULL, NULL, 'plan_position', 'updata', 'air_time', '08:01-10:10', '08:01-10:06', '张三', '2019-06-18 10:18:37'),
(150, 40, 1232, 52, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-19 02:21:36'),
(151, 40, 1232, 53, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-19 02:44:14'),
(152, 40, 1232, 53, NULL, NULL, 'reserve_record', 'updata', 'title', 'httr', 'kki', '张三', '2019-06-19 02:50:37'),
(153, 40, 1232, NULL, 38, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-19 02:51:10'),
(154, 40, 1232, NULL, 38, NULL, 'definite_record', 'updata', 'title', 'dfgf', 'fefeg', '张三', '2019-06-19 06:02:44'),
(155, 40, 1232, NULL, 38, 135, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:05:14'),
(156, 40, 1232, NULL, 38, 136, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:05:14'),
(157, 40, 1232, NULL, 38, 137, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:05:14'),
(158, 40, 1232, NULL, 38, 135, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-19 06:05:28'),
(159, 40, 1232, NULL, 38, 135, 'definite_pass', 'recovery', NULL, NULL, NULL, '张三', '2019-06-19 06:06:44'),
(160, 40, 1232, NULL, 38, 135, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-19 06:14:51'),
(161, 40, 1232, NULL, NULL, NULL, 'plan_position', 'updata', 'policy_state', '', '已出票', '张三', '2019-06-19 06:29:00'),
(162, 41, NULL, NULL, NULL, NULL, 'air_line', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(163, 41, 1263, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(164, 41, 1264, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(165, 41, 1265, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(166, 41, 1266, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(167, 41, 1267, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(168, 41, 1268, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(169, 41, 1269, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(170, 41, 1270, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(171, 41, 1271, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(172, 41, 1272, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(173, 41, 1273, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(174, 41, 1274, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(175, 41, 1275, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(176, 41, 1276, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(177, 41, 1277, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(178, 41, 1278, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(179, 41, 1279, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(180, 41, 1280, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(181, 41, 1281, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(182, 41, 1282, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(183, 41, 1283, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(184, 41, 1284, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(185, 41, 1285, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(186, 41, 1286, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(187, 41, 1287, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(188, 41, 1288, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(189, 41, 1289, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(190, 41, 1290, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(191, 41, 1291, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(192, 41, 1292, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(193, 41, 1293, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:35:30'),
(194, 41, 1294, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:36:49'),
(195, 41, 1294, 54, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:37:22'),
(196, 41, 1294, 54, NULL, NULL, 'reserve_record', 'updata', 'title', 'fdgfd', 'fdgfd22', '张三', '2019-06-19 06:37:29'),
(197, 41, 1294, NULL, 39, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:37:47'),
(198, 41, 1294, 54, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '张三', '2019-06-19 06:38:05'),
(199, 41, 1294, NULL, 39, NULL, 'definite_record', 'updata', 'title', 'dfdrr', 'dfdrrf344', '张三', '2019-06-19 06:38:43'),
(200, 41, 1294, NULL, 39, 138, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:39:38'),
(201, 41, 1294, NULL, 39, 139, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:39:38'),
(202, 41, 1294, NULL, 39, 140, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:39:38'),
(203, 41, 1294, NULL, 39, 138, 'definite_pass', 'updata', 'ticket_number', NULL, '123-5875698785', '张三', '2019-06-19 06:40:32'),
(204, 41, 1294, NULL, 39, 139, 'definite_pass', 'updata', 'ticket_number', NULL, '154-6897541256', '张三', '2019-06-19 06:40:32'),
(205, 41, 1294, NULL, 39, 140, 'definite_pass', 'updata', 'ticket_number', NULL, '158-4698745213', '张三', '2019-06-19 06:40:32'),
(206, 41, 1294, NULL, 39, 141, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-19 06:41:19'),
(207, 41, 1294, NULL, 39, 141, 'definite_pass', 'updata', 'pass_id', '5864865225', '586486522544', '张三', '2019-06-19 06:42:18'),
(208, 41, 1294, NULL, 39, 141, 'definite_pass', 'updata', 'ticket_number', '1234567890456', '1234567890789', '张三', '2019-06-19 06:42:18'),
(209, 41, 1294, NULL, 39, 141, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-19 06:42:48'),
(210, 41, 1294, NULL, 39, 141, 'definite_pass', 'recovery', NULL, NULL, NULL, '张三', '2019-06-19 06:42:58'),
(211, 40, 1232, NULL, 38, 136, 'definite_pass', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-19 08:44:06'),
(212, 40, 1232, NULL, 38, NULL, 'definite_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-19 08:44:27'),
(213, 40, 1232, 53, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-19 08:44:38'),
(214, 40, 1232, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-19 08:44:51'),
(215, 41, 1263, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-19 08:45:11'),
(216, 41, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-19 08:45:20'),
(217, 40, 1233, 55, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-20 07:45:03'),
(218, 38, 1172, NULL, 40, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:14:14'),
(219, 38, 1172, NULL, 40, 142, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:14:18'),
(220, 38, 1172, NULL, 40, 143, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:14:18'),
(221, 38, 1172, NULL, 40, 142, 'definite_pass', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-20 08:14:42'),
(222, 38, 1172, NULL, 40, NULL, 'definite_record', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-20 08:14:58'),
(223, 38, 1172, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-20 08:15:21'),
(224, 38, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '缤纷冰雹', '2019-06-20 08:16:00'),
(225, 40, 1233, NULL, 41, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:17:16'),
(226, 40, 1233, NULL, 41, 144, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:17:42'),
(227, 40, 1233, NULL, 41, 145, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:17:42'),
(228, 40, 1233, NULL, 41, 144, 'definite_pass', 'updata', 'ticket_number', NULL, '789-4561230123', '张三', '2019-06-20 08:18:05'),
(229, 40, 1233, NULL, 41, 145, 'definite_pass', 'updata', 'ticket_number', NULL, '987-6543210123', '张三', '2019-06-20 08:18:05'),
(230, 40, 1233, NULL, 41, 144, 'definite_pass', 'updata', 'ticket_number', '789-4561230123', '789-4561230124', '张三', '2019-06-20 08:18:18'),
(231, 40, 1233, NULL, 41, 144, 'definite_pass', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 08:18:33'),
(232, 40, 1233, NULL, 41, 144, 'definite_pass', 'recovery', NULL, NULL, NULL, '张三', '2019-06-20 08:18:37'),
(233, 40, 1233, NULL, 41, 146, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:19:00'),
(234, 40, 1233, NULL, 41, NULL, 'definite_record', 'updata', 'title', 'gg', '看就看', '张三', '2019-06-20 08:20:06'),
(235, 40, 1233, NULL, NULL, NULL, 'plan_position', 'updata', 'selling_price', '1200', '1220', '张三', '2019-06-20 08:22:50'),
(236, 40, 1233, 55, NULL, NULL, 'reserve_record', 'updata', 'title', 'ew', '合格', '张三', '2019-06-20 08:23:34'),
(237, 40, 1233, 55, NULL, NULL, 'reserve_record', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 08:23:41'),
(238, 40, 1233, NULL, 41, NULL, 'definite_record', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 08:23:55'),
(239, 40, 1234, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 08:24:12'),
(240, 40, 1295, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 08:26:11'),
(241, 29, 924, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 08:27:47'),
(242, 29, 928, NULL, NULL, NULL, 'plan_position', 'updata', 'selling_price', '1100', '1101', '张三', '2019-06-20 08:28:35'),
(243, 29, 928, NULL, NULL, NULL, 'plan_position', 'updata', 'time_limit', '1970-01-01 08:00', '2019-06-20 16:28', '张三', '2019-06-20 08:28:35'),
(244, 29, 928, NULL, NULL, NULL, 'plan_position', 'updata', 'air_time', '', '08:10-08:03', '张三', '2019-06-20 08:28:35'),
(245, 19, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 09:40:11'),
(246, 24, NULL, NULL, NULL, NULL, 'air_line', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 09:40:56'),
(247, 32, NULL, NULL, NULL, NULL, 'air_line', 'updata', 'flight', 'MU8456-MU8962', 'MU8456-MU8942', '张三', '2019-06-20 09:43:15'),
(248, 42, NULL, NULL, NULL, NULL, 'air_line', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(249, 42, 1296, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(250, 42, 1297, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(251, 42, 1298, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(252, 42, 1299, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(253, 42, 1300, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(254, 42, 1301, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(255, 42, 1302, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(256, 42, 1303, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(257, 42, 1304, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(258, 42, 1305, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(259, 42, 1306, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(260, 42, 1307, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(261, 42, 1308, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(262, 42, 1309, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(263, 42, 1310, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(264, 42, 1311, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(265, 42, 1312, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(266, 42, 1313, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(267, 42, 1314, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(268, 42, 1315, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(269, 42, 1316, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(270, 42, 1317, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(271, 42, 1318, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(272, 42, 1319, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(273, 42, 1320, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(274, 42, 1321, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(275, 42, 1322, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(276, 42, 1323, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(277, 42, 1324, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(278, 42, 1325, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(279, 42, 1326, NULL, NULL, NULL, 'plan_position', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:45:58'),
(280, 42, NULL, NULL, NULL, NULL, 'air_line', 'updata', 'flight', 'MU8768-MU8978', 'MU8768-MU8972', '张三', '2019-06-20 09:46:15'),
(281, 42, 1301, NULL, NULL, NULL, 'plan_position', 'delete', NULL, NULL, NULL, '张三', '2019-06-20 09:46:57'),
(282, 42, 1296, 56, NULL, NULL, 'reserve_record', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:47:15'),
(283, 42, 1296, NULL, 42, NULL, 'definite_record', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:47:21'),
(284, 42, 1296, NULL, 42, 147, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:47:44'),
(285, 42, 1296, NULL, 42, 148, 'definite_pass', 'add', NULL, NULL, NULL, '张三', '2019-06-20 09:47:44'),
(286, 42, 1296, NULL, 42, 147, 'definite_pass', 'updata', 'ticket_number', NULL, '1230987654345', '张三', '2019-06-20 09:51:17');

-- --------------------------------------------------------

--
-- 表的结构 `plan_position`
--

CREATE TABLE `plan_position` (
  `id` int(11) NOT NULL,
  `air_line_id` int(11) NOT NULL,
  `policy_state` varchar(20) DEFAULT NULL,
  `departure_date_1` date NOT NULL,
  `departure_date_2` date DEFAULT NULL,
  `departure_date_3` date DEFAULT NULL,
  `departure_date_4` date DEFAULT NULL,
  `air_time` varchar(50) NOT NULL,
  `seat_number` tinyint(3) NOT NULL,
  `selling_price` double NOT NULL,
  `reserve_price` double NOT NULL,
  `time_limit` datetime NOT NULL,
  `group_id` mediumint(8) NOT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `plan_position`
--

INSERT INTO `plan_position` (`id`, `air_line_id`, `policy_state`, `departure_date_1`, `departure_date_2`, `departure_date_3`, `departure_date_4`, `air_time`, `seat_number`, `selling_price`, `reserve_price`, `time_limit`, `group_id`, `delete_time`) VALUES
(564, 17, NULL, '2019-06-06', '2019-06-11', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(565, 17, NULL, '2019-06-07', '2019-06-12', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(566, 17, NULL, '2019-06-08', '2019-06-13', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(567, 17, NULL, '2019-06-09', '2019-06-14', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(568, 17, NULL, '2019-06-10', '2019-06-15', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(569, 17, NULL, '2019-06-11', '2019-06-16', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(570, 17, NULL, '2019-06-12', '2019-06-17', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(571, 17, NULL, '2019-06-13', '2019-06-18', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(572, 17, NULL, '2019-06-14', '2019-06-19', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(573, 17, NULL, '2019-06-15', '2019-06-20', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(574, 17, NULL, '2019-06-16', '2019-06-21', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(575, 17, NULL, '2019-06-17', '2019-06-22', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(576, 17, NULL, '2019-06-18', '2019-06-23', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(577, 17, NULL, '2019-06-19', '2019-06-24', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(578, 17, NULL, '2019-06-20', '2019-06-25', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(579, 17, NULL, '2019-06-21', '2019-06-26', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(580, 17, NULL, '2019-06-22', '2019-06-27', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(581, 17, NULL, '2019-06-23', '2019-06-28', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(582, 17, NULL, '2019-06-24', '2019-06-29', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(583, 17, NULL, '2019-06-25', '2019-06-30', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(584, 17, NULL, '2019-06-26', '2019-07-01', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(585, 17, NULL, '2019-06-27', '2019-07-02', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(586, 17, NULL, '2019-06-28', '2019-07-03', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(587, 17, NULL, '2019-06-29', '2019-07-04', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(588, 17, NULL, '2019-06-30', '2019-07-05', NULL, NULL, '', 30, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(589, 18, NULL, '2019-06-01', '2019-06-05', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(590, 18, NULL, '2019-06-02', '2019-06-06', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(591, 18, NULL, '2019-06-03', '2019-06-07', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(592, 18, NULL, '2019-06-04', '2019-06-08', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(593, 18, NULL, '2019-06-05', '2019-06-09', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(594, 18, NULL, '2019-06-06', '2019-06-10', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(595, 18, NULL, '2019-06-07', '2019-06-11', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(596, 18, NULL, '2019-06-08', '2019-06-12', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(597, 18, NULL, '2019-06-09', '2019-06-13', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(598, 18, NULL, '2019-06-10', '2019-06-14', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(599, 18, NULL, '2019-06-11', '2019-06-15', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(600, 18, NULL, '2019-06-12', '2019-06-16', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(601, 18, NULL, '2019-06-13', '2019-06-17', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(602, 18, NULL, '2019-06-14', '2019-06-18', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(603, 18, NULL, '2019-06-15', '2019-06-19', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(604, 18, NULL, '2019-06-16', '2019-06-20', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(605, 18, NULL, '2019-06-17', '2019-06-21', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(606, 18, NULL, '2019-06-18', '2019-06-22', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(607, 18, NULL, '2019-06-19', '2019-06-23', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(608, 18, NULL, '2019-06-20', '2019-06-24', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(609, 18, NULL, '2019-06-21', '2019-06-25', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(610, 18, NULL, '2019-06-22', '2019-06-26', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(611, 18, NULL, '2019-06-23', '2019-06-27', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(612, 18, NULL, '2019-06-24', '2019-06-28', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(613, 18, NULL, '2019-06-25', '2019-06-29', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(614, 18, NULL, '2019-06-26', '2019-06-30', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(615, 18, NULL, '2019-06-27', '2019-07-01', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(616, 18, NULL, '2019-06-28', '2019-07-02', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(617, 18, NULL, '2019-06-29', '2019-07-03', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(618, 18, NULL, '2019-06-30', '2019-07-04', NULL, NULL, '', 35, 690, 660, '0000-00-00 00:00:00', 2, NULL),
(619, 19, NULL, '2019-05-01', '2019-05-05', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(620, 19, NULL, '2019-05-02', '2019-05-06', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(621, 19, NULL, '2019-05-03', '2019-05-07', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(622, 19, NULL, '2019-05-04', '2019-05-08', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(623, 19, NULL, '2019-05-05', '2019-05-09', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(624, 19, NULL, '2019-05-06', '2019-05-10', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(625, 19, NULL, '2019-05-07', '2019-05-11', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(626, 19, NULL, '2019-05-08', '2019-05-12', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(627, 19, NULL, '2019-05-09', '2019-05-13', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(628, 19, NULL, '2019-05-10', '2019-05-14', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(629, 19, NULL, '2019-05-11', '2019-05-15', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(630, 19, NULL, '2019-05-12', '2019-05-16', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(631, 19, NULL, '2019-05-13', '2019-05-17', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(632, 19, NULL, '2019-05-14', '2019-05-18', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(633, 19, NULL, '2019-05-15', '2019-05-19', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(634, 19, NULL, '2019-05-16', '2019-05-20', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(635, 19, NULL, '2019-05-17', '2019-05-21', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(636, 19, NULL, '2019-05-18', '2019-05-22', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(637, 19, NULL, '2019-05-19', '2019-05-23', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(638, 19, NULL, '2019-05-20', '2019-05-24', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(639, 19, NULL, '2019-05-21', '2019-05-25', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(640, 19, NULL, '2019-05-22', '2019-05-26', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(641, 19, NULL, '2019-05-23', '2019-05-27', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(642, 19, NULL, '2019-05-24', '2019-05-28', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(643, 19, NULL, '2019-05-25', '2019-05-29', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(644, 19, NULL, '2019-05-26', '2019-05-30', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(645, 19, NULL, '2019-05-27', '2019-05-31', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(646, 19, NULL, '2019-05-28', '2019-06-01', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(647, 19, NULL, '2019-05-29', '2019-06-02', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(648, 19, NULL, '2019-05-30', '2019-06-03', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(649, 19, NULL, '2019-05-31', '2019-06-04', NULL, NULL, '', 30, 668, 660, '0000-00-00 00:00:00', 1, 1561023611),
(650, 20, NULL, '2019-06-01', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(651, 20, NULL, '2019-06-02', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(652, 20, NULL, '2019-06-03', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(653, 20, NULL, '2019-06-04', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(654, 20, NULL, '2019-06-05', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(655, 20, NULL, '2019-06-06', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(656, 20, NULL, '2019-06-07', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(657, 20, NULL, '2019-06-08', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(658, 20, NULL, '2019-06-09', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(659, 20, NULL, '2019-06-10', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(660, 20, NULL, '2019-06-11', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(661, 20, NULL, '2019-06-12', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(662, 20, NULL, '2019-06-13', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(663, 20, NULL, '2019-06-14', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(664, 20, NULL, '2019-06-15', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(665, 20, NULL, '2019-06-16', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(666, 20, NULL, '2019-06-17', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(667, 20, NULL, '2019-06-18', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(668, 20, NULL, '2019-06-19', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(669, 20, NULL, '2019-06-20', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(670, 20, NULL, '2019-06-21', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(671, 20, NULL, '2019-06-22', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(672, 20, NULL, '2019-06-23', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(673, 20, NULL, '2019-06-24', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(674, 20, NULL, '2019-06-25', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(675, 20, NULL, '2019-06-26', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(676, 20, NULL, '2019-06-27', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(677, 20, NULL, '2019-06-28', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(678, 20, NULL, '2019-06-29', NULL, NULL, NULL, '', 30, 200, 190, '0000-00-00 00:00:00', 1, NULL),
(772, 24, NULL, '2019-07-01', '2019-07-06', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(773, 24, NULL, '2019-07-02', '2019-07-07', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(774, 24, NULL, '2019-07-03', '2019-07-08', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(775, 24, NULL, '2019-07-04', '2019-07-09', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(776, 24, NULL, '2019-07-05', '2019-07-10', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(777, 24, NULL, '2019-07-06', '2019-07-11', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(778, 24, NULL, '2019-07-07', '2019-07-12', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(779, 24, NULL, '2019-07-08', '2019-07-13', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(780, 24, NULL, '2019-07-09', '2019-07-14', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(781, 24, NULL, '2019-07-10', '2019-07-15', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(782, 24, NULL, '2019-07-11', '2019-07-16', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(783, 24, NULL, '2019-07-12', '2019-07-17', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(784, 24, NULL, '2019-07-13', '2019-07-18', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(785, 24, NULL, '2019-07-14', '2019-07-19', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(786, 24, NULL, '2019-07-15', '2019-07-20', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(787, 24, NULL, '2019-07-16', '2019-07-21', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(788, 24, NULL, '2019-07-17', '2019-07-22', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(789, 24, NULL, '2019-07-18', '2019-07-23', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(790, 24, NULL, '2019-07-19', '2019-07-24', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(791, 24, NULL, '2019-07-20', '2019-07-25', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(792, 24, NULL, '2019-07-21', '2019-07-26', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(793, 24, NULL, '2019-07-22', '2019-07-27', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(794, 24, NULL, '2019-07-23', '2019-07-28', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(795, 24, NULL, '2019-07-24', '2019-07-29', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(796, 24, NULL, '2019-07-25', '2019-07-30', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(797, 24, NULL, '2019-07-26', '2019-07-31', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(798, 24, NULL, '2019-07-27', '2019-08-01', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(799, 24, NULL, '2019-07-28', '2019-08-02', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(800, 24, NULL, '2019-07-29', '2019-08-03', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(801, 24, NULL, '2019-07-30', '2019-08-04', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(802, 24, NULL, '2019-07-31', '2019-08-05', NULL, NULL, '', 35, 1500, 1460, '0000-00-00 00:00:00', 1, 1561023656),
(803, 25, NULL, '2019-06-01', '2019-06-06', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(804, 25, NULL, '2019-06-02', '2019-06-07', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(805, 25, NULL, '2019-06-03', '2019-06-08', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(806, 25, NULL, '2019-06-04', '2019-06-09', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(807, 25, NULL, '2019-06-05', '2019-06-10', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(808, 25, NULL, '2019-06-06', '2019-06-11', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(809, 25, NULL, '2019-06-07', '2019-06-12', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(810, 25, NULL, '2019-06-08', '2019-06-13', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(811, 25, NULL, '2019-06-09', '2019-06-14', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(812, 25, NULL, '2019-06-10', '2019-06-15', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(813, 25, NULL, '2019-06-11', '2019-06-16', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(814, 25, NULL, '2019-06-12', '2019-06-17', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(815, 25, NULL, '2019-06-13', '2019-06-18', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(816, 25, NULL, '2019-06-14', '2019-06-19', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(817, 25, NULL, '2019-06-15', '2019-06-20', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(818, 25, NULL, '2019-06-16', '2019-06-21', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(819, 25, NULL, '2019-06-17', '2019-06-22', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(820, 25, NULL, '2019-06-18', '2019-06-23', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(821, 25, NULL, '2019-06-19', '2019-06-24', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(822, 25, NULL, '2019-06-20', '2019-06-25', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(823, 25, NULL, '2019-06-21', '2019-06-26', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(824, 25, NULL, '2019-06-22', '2019-06-27', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(825, 25, NULL, '2019-06-23', '2019-06-28', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(826, 25, NULL, '2019-06-24', '2019-06-29', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(827, 25, NULL, '2019-06-25', '2019-06-30', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(828, 25, NULL, '2019-06-26', '2019-07-01', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(829, 25, NULL, '2019-06-27', '2019-07-02', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(830, 25, NULL, '2019-06-28', '2019-07-03', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(831, 25, NULL, '2019-06-29', '2019-07-04', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(832, 25, NULL, '2019-06-30', '2019-07-05', NULL, NULL, '', 40, 1410, 1390, '0000-00-00 00:00:00', 1, 1560822063),
(833, 26, NULL, '2019-06-01', '2019-06-05', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(834, 26, NULL, '2019-06-02', '2019-06-06', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(835, 26, NULL, '2019-06-03', '2019-06-07', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(837, 26, NULL, '2019-06-05', '2019-06-09', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(838, 26, NULL, '2019-06-06', '2019-06-10', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(839, 26, NULL, '2019-06-07', '2019-06-11', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(840, 26, NULL, '2019-06-08', '2019-06-12', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(841, 26, NULL, '2019-06-09', '2019-06-13', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(842, 26, NULL, '2019-06-10', '2019-06-14', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(843, 26, NULL, '2019-06-11', '2019-06-15', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(844, 26, NULL, '2019-06-12', '2019-06-16', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(845, 26, NULL, '2019-06-13', '2019-06-17', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(846, 26, NULL, '2019-06-14', '2019-06-18', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(847, 26, NULL, '2019-06-15', '2019-06-19', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(848, 26, NULL, '2019-06-16', '2019-06-20', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(849, 26, NULL, '2019-06-17', '2019-06-21', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(850, 26, NULL, '2019-06-18', '2019-06-22', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(851, 26, NULL, '2019-06-19', '2019-06-23', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(852, 26, NULL, '2019-06-20', '2019-06-24', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(853, 26, NULL, '2019-06-21', '2019-06-25', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(854, 26, NULL, '2019-06-22', '2019-06-26', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(855, 26, NULL, '2019-06-23', '2019-06-27', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(856, 26, NULL, '2019-06-24', '2019-06-28', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(857, 26, NULL, '2019-06-25', '2019-06-29', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(858, 26, NULL, '2019-06-26', '2019-06-30', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(859, 26, NULL, '2019-06-27', '2019-07-01', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(860, 26, NULL, '2019-06-28', '2019-07-02', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(861, 26, NULL, '2019-06-29', '2019-07-03', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(862, 26, NULL, '2019-06-30', '2019-07-04', NULL, NULL, '', 30, 1100, 1000, '0000-00-00 00:00:00', 1, 1560763887),
(863, 27, NULL, '2019-06-01', '2019-06-06', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(864, 27, NULL, '2019-06-02', '2019-06-07', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(865, 27, NULL, '2019-06-03', '2019-06-08', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(866, 27, NULL, '2019-06-04', '2019-06-09', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(867, 27, NULL, '2019-06-05', '2019-06-10', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(868, 27, NULL, '2019-06-06', '2019-06-11', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(869, 27, NULL, '2019-06-07', '2019-06-12', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(870, 27, NULL, '2019-06-08', '2019-06-13', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(871, 27, NULL, '2019-06-09', '2019-06-14', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(872, 27, NULL, '2019-06-10', '2019-06-15', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(873, 27, NULL, '2019-06-11', '2019-06-16', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(874, 27, NULL, '2019-06-12', '2019-06-17', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(875, 27, NULL, '2019-06-13', '2019-06-18', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(876, 27, NULL, '2019-06-14', '2019-06-19', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(877, 27, NULL, '2019-06-15', '2019-06-20', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(878, 27, NULL, '2019-06-16', '2019-06-21', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(879, 27, NULL, '2019-06-17', '2019-06-22', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(880, 27, NULL, '2019-06-18', '2019-06-23', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(881, 27, NULL, '2019-06-19', '2019-06-24', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(882, 27, NULL, '2019-06-20', '2019-06-25', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(883, 27, NULL, '2019-06-21', '2019-06-26', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(884, 27, NULL, '2019-06-22', '2019-06-27', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(885, 27, NULL, '2019-06-23', '2019-06-28', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(886, 27, NULL, '2019-06-24', '2019-06-29', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(887, 27, NULL, '2019-06-25', '2019-06-30', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(888, 27, NULL, '2019-06-26', '2019-07-01', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(889, 27, NULL, '2019-06-27', '2019-07-02', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(890, 27, NULL, '2019-06-28', '2019-07-03', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(891, 27, NULL, '2019-06-29', '2019-07-04', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(892, 27, NULL, '2019-06-30', '2019-07-05', NULL, NULL, '', 35, 980, 950, '0000-00-00 00:00:00', 1, NULL),
(893, 28, NULL, '2019-06-01', '2019-06-07', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(894, 28, NULL, '2019-06-02', '2019-06-08', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(895, 28, NULL, '2019-06-03', '2019-06-09', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(896, 28, NULL, '2019-06-04', '2019-06-10', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(897, 28, NULL, '2019-06-05', '2019-06-11', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(898, 28, NULL, '2019-06-06', '2019-06-12', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(899, 28, NULL, '2019-06-07', '2019-06-13', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(900, 28, NULL, '2019-06-08', '2019-06-14', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(901, 28, NULL, '2019-06-09', '2019-06-15', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(902, 28, NULL, '2019-06-10', '2019-06-16', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(903, 28, NULL, '2019-06-11', '2019-06-17', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(904, 28, NULL, '2019-06-12', '2019-06-18', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(905, 28, NULL, '2019-06-13', '2019-06-19', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(906, 28, NULL, '2019-06-14', '2019-06-20', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(907, 28, NULL, '2019-06-15', '2019-06-21', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(908, 28, NULL, '2019-06-16', '2019-06-22', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(909, 28, NULL, '2019-06-17', '2019-06-23', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(910, 28, NULL, '2019-06-18', '2019-06-24', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(911, 28, NULL, '2019-06-19', '2019-06-25', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(912, 28, NULL, '2019-06-20', '2019-06-26', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(913, 28, NULL, '2019-06-21', '2019-06-27', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(914, 28, NULL, '2019-06-22', '2019-06-28', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(915, 28, NULL, '2019-06-23', '2019-06-29', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(916, 28, NULL, '2019-06-24', '2019-06-30', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(917, 28, NULL, '2019-06-25', '2019-07-01', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(918, 28, NULL, '2019-06-26', '2019-07-02', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(919, 28, NULL, '2019-06-27', '2019-07-03', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(920, 28, NULL, '2019-06-28', '2019-07-04', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(921, 28, NULL, '2019-06-29', '2019-07-05', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(922, 28, NULL, '2019-06-30', '2019-07-06', NULL, NULL, '', 36, 990, 970, '0000-00-00 00:00:00', 1, NULL),
(923, 29, '', '2019-06-01', '2019-06-06', NULL, NULL, '', 30, 1100, 1080, '0000-00-00 00:00:00', 1, NULL),
(924, 29, NULL, '2019-06-02', '2019-06-07', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, 1561019267),
(925, 29, NULL, '2019-06-03', '2019-06-08', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(926, 29, NULL, '2019-06-04', '2019-06-09', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(927, 29, NULL, '2019-06-05', '2019-06-10', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(928, 29, '', '2019-06-06', '2019-06-11', NULL, NULL, '08:10-08:03', 35, 1101, 9900, '2019-06-20 16:28:00', 1, NULL),
(929, 29, NULL, '2019-06-07', '2019-06-12', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(930, 29, NULL, '2019-06-08', '2019-06-13', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(931, 29, NULL, '2019-06-09', '2019-06-14', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(932, 29, NULL, '2019-06-10', '2019-06-15', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(933, 29, NULL, '2019-06-11', '2019-06-16', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(934, 29, NULL, '2019-06-12', '2019-06-17', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(935, 29, NULL, '2019-06-13', '2019-06-18', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(936, 29, NULL, '2019-06-14', '2019-06-19', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(937, 29, NULL, '2019-06-15', '2019-06-20', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(938, 29, NULL, '2019-06-16', '2019-06-21', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(939, 29, NULL, '2019-06-17', '2019-06-22', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(940, 29, NULL, '2019-06-18', '2019-06-23', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(941, 29, NULL, '2019-06-19', '2019-06-24', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(942, 29, NULL, '2019-06-20', '2019-06-25', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(943, 29, NULL, '2019-06-21', '2019-06-26', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(944, 29, NULL, '2019-06-22', '2019-06-27', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(945, 29, NULL, '2019-06-23', '2019-06-28', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(946, 29, NULL, '2019-06-24', '2019-06-29', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(947, 29, NULL, '2019-06-25', '2019-06-30', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(948, 29, NULL, '2019-06-26', '2019-07-01', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(949, 29, NULL, '2019-06-27', '2019-07-02', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(950, 29, NULL, '2019-06-28', '2019-07-03', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(951, 29, NULL, '2019-06-29', '2019-07-04', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(952, 29, NULL, '2019-06-30', '2019-07-05', NULL, NULL, '', 35, 1100, 9900, '0000-00-00 00:00:00', 1, NULL),
(953, 30, NULL, '2019-08-01', '2019-08-04', '2019-08-08', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(954, 30, NULL, '2019-08-02', '2019-08-05', '2019-08-09', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(955, 30, NULL, '2019-08-03', '2019-08-06', '2019-08-10', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(956, 30, NULL, '2019-08-04', '2019-08-07', '2019-08-11', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(957, 30, NULL, '2019-08-05', '2019-08-08', '2019-08-12', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(958, 30, NULL, '2019-08-06', '2019-08-09', '2019-08-13', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(959, 30, NULL, '2019-08-07', '2019-08-10', '2019-08-14', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(960, 30, NULL, '2019-08-08', '2019-08-11', '2019-08-15', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(961, 30, NULL, '2019-08-09', '2019-08-12', '2019-08-16', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(962, 30, NULL, '2019-08-10', '2019-08-13', '2019-08-17', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(963, 30, NULL, '2019-08-11', '2019-08-14', '2019-08-18', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(964, 30, NULL, '2019-08-12', '2019-08-15', '2019-08-19', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(965, 30, NULL, '2019-08-13', '2019-08-16', '2019-08-20', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(966, 30, NULL, '2019-08-14', '2019-08-17', '2019-08-21', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(967, 30, NULL, '2019-08-15', '2019-08-18', '2019-08-22', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(968, 30, NULL, '2019-08-16', '2019-08-19', '2019-08-23', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(969, 30, NULL, '2019-08-17', '2019-08-20', '2019-08-24', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(970, 30, NULL, '2019-08-18', '2019-08-21', '2019-08-25', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(971, 30, NULL, '2019-08-19', '2019-08-22', '2019-08-26', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(972, 30, NULL, '2019-08-20', '2019-08-23', '2019-08-27', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(973, 30, NULL, '2019-08-21', '2019-08-24', '2019-08-28', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(974, 30, NULL, '2019-08-22', '2019-08-25', '2019-08-29', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(975, 30, NULL, '2019-08-23', '2019-08-26', '2019-08-30', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(976, 30, NULL, '2019-08-24', '2019-08-27', '2019-08-31', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(977, 30, NULL, '2019-08-25', '2019-08-28', '2019-09-01', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(978, 30, NULL, '2019-08-26', '2019-08-29', '2019-09-02', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(979, 30, NULL, '2019-08-27', '2019-08-30', '2019-09-03', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(980, 30, NULL, '2019-08-28', '2019-08-31', '2019-09-04', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(981, 30, NULL, '2019-08-29', '2019-09-01', '2019-09-05', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(982, 30, NULL, '2019-08-30', '2019-09-02', '2019-09-06', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(983, 30, NULL, '2019-08-31', '2019-09-03', '2019-09-07', NULL, '', 30, 1500, 1480, '0000-00-00 00:00:00', 1, NULL),
(986, 31, NULL, '2019-06-01', '2019-06-05', NULL, NULL, '', 30, 1000, 1200, '0000-00-00 00:00:00', 1, 1560764160),
(987, 31, NULL, '2019-06-02', '2019-06-06', NULL, NULL, '', 30, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(988, 31, NULL, '2019-06-03', '2019-06-07', NULL, NULL, '', 30, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(989, 31, NULL, '2019-06-04', '2019-06-08', NULL, NULL, '', 30, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(990, 31, NULL, '2019-06-05', '2019-06-09', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(991, 31, NULL, '2019-06-06', '2019-06-10', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(992, 31, NULL, '2019-06-07', '2019-06-11', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(993, 31, NULL, '2019-06-08', '2019-06-12', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(994, 31, NULL, '2019-06-09', '2019-06-13', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(995, 31, NULL, '2019-06-10', '2019-06-14', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(996, 31, NULL, '2019-06-11', '2019-06-15', NULL, NULL, '', 35, 1000, 1200, '0000-00-00 00:00:00', 1, NULL),
(997, 31, NULL, '2019-06-12', '2019-06-16', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(998, 31, NULL, '2019-06-13', '2019-06-17', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(999, 31, NULL, '2019-06-14', '2019-06-18', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1000, 31, NULL, '2019-06-15', '2019-06-19', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1001, 31, NULL, '2019-06-16', '2019-06-20', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1002, 31, NULL, '2019-06-17', '2019-06-21', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1003, 31, NULL, '2019-06-18', '2019-06-22', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1004, 31, NULL, '2019-06-19', '2019-06-23', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1005, 31, NULL, '2019-06-20', '2019-06-24', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1006, 31, NULL, '2019-06-21', '2019-06-25', NULL, NULL, '', 35, 1100, 1200, '0000-00-00 00:00:00', 1, NULL),
(1007, 31, NULL, '2019-06-22', '2019-06-26', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1008, 31, NULL, '2019-06-23', '2019-06-27', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1009, 31, NULL, '2019-06-24', '2019-06-28', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1010, 31, NULL, '2019-06-25', '2019-06-29', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1011, 31, NULL, '2019-06-26', '2019-06-30', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1012, 31, NULL, '2019-06-27', '2019-07-01', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1013, 31, NULL, '2019-06-28', '2019-07-02', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1014, 31, NULL, '2019-06-29', '2019-07-03', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1015, 31, NULL, '2019-06-30', '2019-07-04', NULL, NULL, '', 35, 1100, 1100, '0000-00-00 00:00:00', 1, NULL),
(1016, 32, NULL, '2019-07-01', '2019-07-05', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, 1560493213),
(1017, 32, NULL, '2019-07-02', '2019-07-06', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1018, 32, NULL, '2019-07-03', '2019-07-07', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1019, 32, NULL, '2019-07-04', '2019-07-08', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1020, 32, NULL, '2019-07-05', '2019-07-09', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1021, 32, NULL, '2019-07-06', '2019-07-10', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1022, 32, NULL, '2019-07-07', '2019-07-11', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1023, 32, NULL, '2019-07-08', '2019-07-12', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1024, 32, NULL, '2019-07-09', '2019-07-13', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1025, 32, NULL, '2019-07-10', '2019-07-14', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1026, 32, NULL, '2019-07-11', '2019-07-15', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1027, 32, NULL, '2019-07-12', '2019-07-16', NULL, NULL, '', 40, 1020, 1100, '0000-00-00 00:00:00', 1, NULL),
(1028, 32, NULL, '2019-07-13', '2019-07-17', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1029, 32, NULL, '2019-07-14', '2019-07-18', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1030, 32, NULL, '2019-07-15', '2019-07-19', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1031, 32, NULL, '2019-07-16', '2019-07-20', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1032, 32, NULL, '2019-07-17', '2019-07-21', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1033, 32, NULL, '2019-07-18', '2019-07-22', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1034, 32, NULL, '2019-07-19', '2019-07-23', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1035, 32, NULL, '2019-07-20', '2019-07-24', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1036, 32, NULL, '2019-07-21', '2019-07-25', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1037, 32, NULL, '2019-07-22', '2019-07-26', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1038, 32, NULL, '2019-07-23', '2019-07-27', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1039, 32, NULL, '2019-07-24', '2019-07-28', NULL, NULL, '', 40, 1200, 980, '0000-00-00 00:00:00', 1, NULL),
(1040, 32, NULL, '2019-07-25', '2019-07-29', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1041, 32, NULL, '2019-07-26', '2019-07-30', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1042, 32, NULL, '2019-07-27', '2019-07-31', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1043, 32, NULL, '2019-07-28', '2019-08-01', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1044, 32, NULL, '2019-07-29', '2019-08-02', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1045, 32, NULL, '2019-07-30', '2019-08-03', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1046, 32, NULL, '2019-07-31', '2019-08-04', NULL, NULL, '', 40, 1300, 880, '0000-00-00 00:00:00', 1, NULL),
(1047, 34, NULL, '2019-07-01', '2019-07-05', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-06-28 08:10:00', 1, 1560485954),
(1048, 34, NULL, '2019-07-02', '2019-07-06', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-06-29 08:10:00', 1, 1560485954),
(1049, 34, NULL, '2019-07-03', '2019-07-07', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-06-30 08:10:00', 1, 1560485954),
(1050, 34, NULL, '2019-07-04', '2019-07-08', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-01 08:10:00', 1, 1560485954),
(1051, 34, NULL, '2019-07-05', '2019-07-09', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-02 08:10:00', 1, 1560485954),
(1052, 34, NULL, '2019-07-06', '2019-07-10', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-03 08:10:00', 1, 1560485954),
(1053, 34, NULL, '2019-07-07', '2019-07-11', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-04 08:10:00', 1, 1560485954),
(1054, 34, NULL, '2019-07-08', '2019-07-12', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-05 08:10:00', 1, 1560485954),
(1055, 34, NULL, '2019-07-09', '2019-07-13', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-06 08:10:00', 1, 1560485954),
(1056, 34, NULL, '2019-07-10', '2019-07-14', NULL, NULL, '09:50-10:11', 30, 650, 600, '2019-07-07 11:10:00', 1, 1560485954),
(1057, 34, NULL, '2019-07-11', '2019-07-15', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-08 08:10:00', 1, 1560485954),
(1058, 34, NULL, '2019-07-12', '2019-07-16', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-09 08:10:00', 1, 1560485954),
(1059, 34, NULL, '2019-07-13', '2019-07-17', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-10 08:10:00', 1, 1560485954),
(1060, 34, NULL, '2019-07-14', '2019-07-18', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-11 08:10:00', 1, 1560485954),
(1061, 34, NULL, '2019-07-15', '2019-07-19', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-12 08:10:00', 1, 1560485954),
(1062, 34, NULL, '2019-07-16', '2019-07-20', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-13 08:10:00', 1, 1560485954),
(1063, 34, NULL, '2019-07-17', '2019-07-21', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-14 08:10:00', 1, 1560485954),
(1064, 34, NULL, '2019-07-18', '2019-07-22', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-15 08:10:00', 1, 1560485954),
(1065, 34, NULL, '2019-07-19', '2019-07-23', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-16 08:10:00', 1, 1560485954),
(1066, 34, NULL, '2019-07-20', '2019-07-24', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-17 08:10:00', 1, 1560485954),
(1067, 34, NULL, '2019-07-21', '2019-07-25', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-18 08:10:00', 1, 1560485954),
(1068, 34, NULL, '2019-07-22', '2019-07-26', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-19 08:10:00', 1, 1560485954),
(1069, 34, NULL, '2019-07-23', '2019-07-27', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-20 08:10:00', 1, 1560485954),
(1070, 34, NULL, '2019-07-24', '2019-07-28', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-21 08:10:00', 1, 1560485954),
(1071, 34, NULL, '2019-07-25', '2019-07-29', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-22 08:10:00', 1, 1560485954),
(1072, 34, NULL, '2019-07-26', '2019-07-30', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-23 08:10:00', 1, 1560485954),
(1073, 34, NULL, '2019-07-27', '2019-07-31', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-24 08:10:00', 1, 1560485954),
(1074, 34, NULL, '2019-07-28', '2019-08-01', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-25 08:10:00', 1, 1560485954),
(1075, 34, NULL, '2019-07-29', '2019-08-02', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-26 08:10:00', 1, 1560485954),
(1076, 34, NULL, '2019-07-30', '2019-08-03', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-27 08:10:00', 1, 1560485954),
(1077, 34, NULL, '2019-07-31', '2019-08-04', NULL, NULL, '08:10-09:05', 30, 650, 600, '2019-07-28 08:10:00', 1, 1560485954),
(1141, 37, '', '2019-06-01', '2019-06-03', NULL, NULL, '14:15-15:35', 30, 990, 905, '2019-05-29 11:10:00', 1, 1560492741),
(1142, 37, NULL, '2019-06-02', '2019-06-04', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-05-30 11:10:00', 1, 1560492741),
(1143, 37, NULL, '2019-06-03', '2019-06-05', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-05-31 11:10:00', 1, 1560492741),
(1144, 37, NULL, '2019-06-04', '2019-06-06', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-01 11:10:00', 1, 1560492741),
(1145, 37, NULL, '2019-06-05', '2019-06-07', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-02 11:10:00', 1, 1560492741),
(1146, 37, NULL, '2019-06-06', '2019-06-08', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-03 11:10:00', 1, 1560492741),
(1147, 37, NULL, '2019-06-07', '2019-06-09', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-04 11:10:00', 1, 1560492741),
(1148, 37, NULL, '2019-06-08', '2019-06-10', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-05 11:10:00', 1, 1560492741),
(1149, 37, NULL, '2019-06-09', '2019-06-11', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-06 11:10:00', 1, 1560492741),
(1150, 37, NULL, '2019-06-10', '2019-06-12', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-07 11:10:00', 1, 1560492741),
(1151, 37, NULL, '2019-06-11', '2019-06-13', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-08 11:10:00', 1, 1560492741),
(1152, 37, NULL, '2019-06-12', '2019-06-14', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-09 11:10:00', 1, 1560492741),
(1153, 37, NULL, '2019-06-13', '2019-06-15', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-10 11:10:00', 1, 1560492741),
(1154, 37, NULL, '2019-06-14', '2019-06-16', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-11 11:10:00', 1, 1560492741),
(1155, 37, NULL, '2019-06-15', '2019-06-17', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-12 11:10:00', 1, 1560492741),
(1156, 37, NULL, '2019-06-16', '2019-06-18', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-13 11:10:00', 1, 1560492741),
(1157, 37, NULL, '2019-06-17', '2019-06-19', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-14 11:10:00', 1, 1560492741),
(1158, 37, NULL, '2019-06-18', '2019-06-20', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-15 11:10:00', 1, 1560492741),
(1159, 37, NULL, '2019-06-19', '2019-06-21', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-16 11:10:00', 1, 1560492741),
(1160, 37, NULL, '2019-06-20', '2019-06-22', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-17 11:10:00', 1, 1560492741),
(1161, 37, NULL, '2019-06-21', '2019-06-23', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-18 11:10:00', 1, 1560492741),
(1162, 37, NULL, '2019-06-22', '2019-06-24', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-19 11:10:00', 1, 1560492741),
(1163, 37, NULL, '2019-06-23', '2019-06-25', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-20 11:10:00', 1, 1560492741),
(1164, 37, NULL, '2019-06-24', '2019-06-26', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-21 11:10:00', 1, 1560492741),
(1165, 37, NULL, '2019-06-25', '2019-06-27', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-22 11:10:00', 1, 1560492741),
(1166, 37, NULL, '2019-06-26', '2019-06-28', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-23 11:10:00', 1, 1560492741),
(1167, 37, NULL, '2019-06-27', '2019-06-29', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-24 11:10:00', 1, 1560492741),
(1168, 37, NULL, '2019-06-28', '2019-06-30', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-25 11:10:00', 1, 1560492741),
(1169, 37, NULL, '2019-06-29', '2019-07-01', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-26 11:10:00', 1, 1560492741),
(1170, 37, NULL, '2019-06-30', '2019-07-02', NULL, NULL, '11:10-11:15', 30, 990, 900, '2019-06-27 11:10:00', 1, 1560492741),
(1171, 38, NULL, '2019-07-01', '2019-07-05', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-06-28 07:40:00', 1, 1560494097),
(1172, 38, NULL, '2019-07-02', '2019-07-06', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-06-29 07:40:00', 1, 1561018521),
(1173, 38, NULL, '2019-07-03', '2019-07-07', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-06-30 07:40:00', 1, 1560764551);
INSERT INTO `plan_position` (`id`, `air_line_id`, `policy_state`, `departure_date_1`, `departure_date_2`, `departure_date_3`, `departure_date_4`, `air_time`, `seat_number`, `selling_price`, `reserve_price`, `time_limit`, `group_id`, `delete_time`) VALUES
(1174, 38, NULL, '2019-07-04', '2019-07-08', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-01 07:40:00', 1, 1561018560),
(1175, 38, NULL, '2019-07-05', '2019-07-09', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-02 07:40:00', 1, 1561018560),
(1176, 38, NULL, '2019-07-06', '2019-07-10', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-03 07:40:00', 1, 1561018560),
(1177, 38, NULL, '2019-07-07', '2019-07-11', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-04 07:40:00', 1, 1561018560),
(1178, 38, NULL, '2019-07-08', '2019-07-12', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-05 07:40:00', 1, 1561018560),
(1179, 38, NULL, '2019-07-09', '2019-07-13', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-06 07:40:00', 1, 1561018560),
(1180, 38, NULL, '2019-07-10', '2019-07-14', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-07 07:40:00', 1, 1561018560),
(1181, 38, NULL, '2019-07-11', '2019-07-15', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-08 07:40:00', 1, 1561018560),
(1182, 38, NULL, '2019-07-12', '2019-07-16', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-09 07:40:00', 1, 1561018560),
(1183, 38, NULL, '2019-07-13', '2019-07-17', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-10 07:40:00', 1, 1561018560),
(1184, 38, NULL, '2019-07-14', '2019-07-18', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-11 07:40:00', 1, 1561018560),
(1185, 38, NULL, '2019-07-15', '2019-07-19', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-12 07:40:00', 1, 1561018560),
(1186, 38, NULL, '2019-07-16', '2019-07-20', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-13 07:40:00', 1, 1561018560),
(1187, 38, NULL, '2019-07-17', '2019-07-21', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-14 07:40:00', 1, 1561018560),
(1188, 38, NULL, '2019-07-18', '2019-07-22', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-15 07:40:00', 1, 1561018560),
(1189, 38, NULL, '2019-07-19', '2019-07-23', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-16 07:40:00', 1, 1561018560),
(1190, 38, NULL, '2019-07-20', '2019-07-24', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-17 07:40:00', 1, 1561018560),
(1191, 38, NULL, '2019-07-21', '2019-07-25', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-18 07:40:00', 1, 1561018560),
(1192, 38, NULL, '2019-07-22', '2019-07-26', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-19 07:40:00', 1, 1561018560),
(1193, 38, NULL, '2019-07-23', '2019-07-27', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-20 07:40:00', 1, 1561018560),
(1194, 38, NULL, '2019-07-24', '2019-07-28', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-21 07:40:00', 1, 1561018560),
(1195, 38, NULL, '2019-07-25', '2019-07-29', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-22 07:40:00', 1, 1561018560),
(1196, 38, NULL, '2019-07-26', '2019-07-30', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-23 07:40:00', 1, 1561018560),
(1197, 38, NULL, '2019-07-27', '2019-07-31', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-24 07:40:00', 1, 1561018560),
(1198, 38, NULL, '2019-07-28', '2019-08-01', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-25 07:40:00', 1, 1561018560),
(1199, 38, NULL, '2019-07-29', '2019-08-02', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-26 07:40:00', 1, 1561018560),
(1200, 38, NULL, '2019-07-30', '2019-08-03', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-27 07:40:00', 1, 1561018560),
(1201, 38, NULL, '2019-07-31', '2019-08-04', NULL, NULL, '07:40-08:10', 30, 1250, 1200, '2019-07-28 07:40:00', 1, 1561018560),
(1202, 39, '', '2019-06-01', '2019-06-06', NULL, NULL, '07:55-09:15', 35, 1050, 980, '2019-05-29 07:40:00', 1, 1560822084),
(1203, 39, NULL, '2019-06-02', '2019-06-07', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-05-30 07:40:00', 1, 1560821820),
(1204, 39, NULL, '2019-06-03', '2019-06-08', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-05-31 07:40:00', 1, NULL),
(1205, 39, NULL, '2019-06-04', '2019-06-09', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-01 07:40:00', 1, 1560822072),
(1206, 39, NULL, '2019-06-05', '2019-06-10', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-02 07:40:00', 1, NULL),
(1207, 39, NULL, '2019-06-06', '2019-06-11', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-03 07:40:00', 1, NULL),
(1208, 39, NULL, '2019-06-07', '2019-06-12', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-04 07:40:00', 1, NULL),
(1209, 39, NULL, '2019-06-08', '2019-06-13', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-05 07:40:00', 1, NULL),
(1210, 39, NULL, '2019-06-09', '2019-06-14', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-06 07:40:00', 1, NULL),
(1211, 39, NULL, '2019-06-10', '2019-06-15', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-07 07:40:00', 1, NULL),
(1212, 39, NULL, '2019-06-11', '2019-06-16', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-08 07:40:00', 1, NULL),
(1213, 39, NULL, '2019-06-12', '2019-06-17', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-09 07:40:00', 1, NULL),
(1214, 39, NULL, '2019-06-13', '2019-06-18', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-10 07:40:00', 1, NULL),
(1215, 39, NULL, '2019-06-14', '2019-06-19', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-11 07:40:00', 1, NULL),
(1216, 39, NULL, '2019-06-15', '2019-06-20', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-12 07:40:00', 1, NULL),
(1217, 39, NULL, '2019-06-16', '2019-06-21', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-13 07:40:00', 1, NULL),
(1218, 39, NULL, '2019-06-17', '2019-06-22', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-14 07:40:00', 1, NULL),
(1219, 39, NULL, '2019-06-18', '2019-06-23', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-15 07:40:00', 1, NULL),
(1220, 39, NULL, '2019-06-19', '2019-06-24', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-16 07:40:00', 1, NULL),
(1221, 39, NULL, '2019-06-20', '2019-06-25', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-17 07:40:00', 1, NULL),
(1222, 39, NULL, '2019-06-21', '2019-06-26', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-18 07:40:00', 1, NULL),
(1223, 39, NULL, '2019-06-22', '2019-06-27', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-19 07:40:00', 1, NULL),
(1224, 39, NULL, '2019-06-23', '2019-06-28', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-20 07:40:00', 1, NULL),
(1225, 39, NULL, '2019-06-24', '2019-06-29', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-21 07:40:00', 1, NULL),
(1226, 39, NULL, '2019-06-25', '2019-06-30', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-22 07:40:00', 1, NULL),
(1227, 39, NULL, '2019-06-26', '2019-07-01', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-23 07:40:00', 1, NULL),
(1228, 39, NULL, '2019-06-27', '2019-07-02', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-24 07:40:00', 1, NULL),
(1229, 39, NULL, '2019-06-28', '2019-07-03', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-25 07:40:00', 1, NULL),
(1230, 39, NULL, '2019-06-29', '2019-07-04', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-26 07:40:00', 1, NULL),
(1231, 39, NULL, '2019-06-30', '2019-07-05', NULL, NULL, '07:40-09:15', 35, 1050, 980, '2019-06-27 07:40:00', 1, NULL),
(1232, 40, '已出票', '2019-06-01', '2019-06-06', NULL, NULL, '08:01-10:06', 35, 1200, 1150, '2019-05-29 08:55:00', 1, 1560933891),
(1233, 40, '', '2019-06-02', '2019-06-07', NULL, NULL, '08:55-10:10', 35, 1220, 1150, '2019-05-30 08:55:00', 1, NULL),
(1234, 40, NULL, '2019-06-03', '2019-06-08', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-05-31 08:55:00', 1, 1561019052),
(1235, 40, NULL, '2019-06-04', '2019-06-09', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-01 08:55:00', 1, NULL),
(1236, 40, NULL, '2019-06-05', '2019-06-10', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-02 08:55:00', 1, NULL),
(1237, 40, NULL, '2019-06-06', '2019-06-11', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-03 08:55:00', 1, NULL),
(1238, 40, NULL, '2019-06-07', '2019-06-12', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-04 08:55:00', 1, NULL),
(1239, 40, NULL, '2019-06-08', '2019-06-13', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-05 08:55:00', 1, NULL),
(1240, 40, NULL, '2019-06-09', '2019-06-14', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-06 08:55:00', 1, NULL),
(1241, 40, NULL, '2019-06-10', '2019-06-15', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-07 08:55:00', 1, NULL),
(1242, 40, NULL, '2019-06-11', '2019-06-16', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-08 08:55:00', 1, NULL),
(1243, 40, NULL, '2019-06-12', '2019-06-17', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-09 08:55:00', 1, NULL),
(1244, 40, NULL, '2019-06-13', '2019-06-18', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-10 08:55:00', 1, NULL),
(1245, 40, NULL, '2019-06-14', '2019-06-19', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-11 08:55:00', 1, NULL),
(1246, 40, NULL, '2019-06-15', '2019-06-20', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-12 08:55:00', 1, NULL),
(1247, 40, NULL, '2019-06-16', '2019-06-21', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-13 08:55:00', 1, NULL),
(1248, 40, NULL, '2019-06-17', '2019-06-22', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-14 08:55:00', 1, NULL),
(1249, 40, NULL, '2019-06-18', '2019-06-23', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-15 08:55:00', 1, NULL),
(1250, 40, NULL, '2019-06-19', '2019-06-24', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-16 08:55:00', 1, NULL),
(1251, 40, NULL, '2019-06-20', '2019-06-25', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-17 08:55:00', 1, NULL),
(1252, 40, NULL, '2019-06-21', '2019-06-26', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-18 08:55:00', 1, NULL),
(1253, 40, NULL, '2019-06-22', '2019-06-27', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-19 08:55:00', 1, NULL),
(1254, 40, NULL, '2019-06-23', '2019-06-28', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-20 08:55:00', 1, NULL),
(1255, 40, NULL, '2019-06-24', '2019-06-29', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-21 08:55:00', 1, NULL),
(1256, 40, NULL, '2019-06-25', '2019-06-30', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-22 08:55:00', 1, NULL),
(1257, 40, NULL, '2019-06-26', '2019-07-01', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-23 08:55:00', 1, NULL),
(1258, 40, NULL, '2019-06-27', '2019-07-02', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-24 08:55:00', 1, NULL),
(1259, 40, NULL, '2019-06-28', '2019-07-03', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-25 08:55:00', 1, NULL),
(1260, 40, NULL, '2019-06-29', '2019-07-04', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-26 08:55:00', 1, NULL),
(1261, 40, NULL, '2019-06-30', '2019-07-05', NULL, NULL, '08:55-10:10', 35, 1200, 1150, '2019-06-27 08:55:00', 1, NULL),
(1262, 40, NULL, '2019-06-20', '2019-06-27', NULL, NULL, '16:30-11:26', 35, 1350, 1210, '2019-06-18 16:26:00', 1, NULL),
(1263, 41, NULL, '2019-07-01', '2019-07-03', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-06-28 08:10:00', 1, 1560933911),
(1264, 41, NULL, '2019-07-02', '2019-07-04', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-06-29 08:10:00', 1, 1560933920),
(1265, 41, NULL, '2019-07-03', '2019-07-05', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-06-30 08:10:00', 1, 1560933920),
(1266, 41, NULL, '2019-07-04', '2019-07-06', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-01 08:10:00', 1, 1560933920),
(1267, 41, NULL, '2019-07-05', '2019-07-07', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-02 08:10:00', 1, 1560933920),
(1268, 41, NULL, '2019-07-06', '2019-07-08', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-03 08:10:00', 1, 1560933920),
(1269, 41, NULL, '2019-07-07', '2019-07-09', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-04 08:10:00', 1, 1560933920),
(1270, 41, NULL, '2019-07-08', '2019-07-10', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-05 08:10:00', 1, 1560933920),
(1271, 41, NULL, '2019-07-09', '2019-07-11', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-06 08:10:00', 1, 1560933920),
(1272, 41, NULL, '2019-07-10', '2019-07-12', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-07 08:10:00', 1, 1560933920),
(1273, 41, NULL, '2019-07-11', '2019-07-13', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-08 08:10:00', 1, 1560933920),
(1274, 41, NULL, '2019-07-12', '2019-07-14', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-09 08:10:00', 1, 1560933920),
(1275, 41, NULL, '2019-07-13', '2019-07-15', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-10 08:10:00', 1, 1560933920),
(1276, 41, NULL, '2019-07-14', '2019-07-16', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-11 08:10:00', 1, 1560933920),
(1277, 41, NULL, '2019-07-15', '2019-07-17', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-12 08:10:00', 1, 1560933920),
(1278, 41, NULL, '2019-07-16', '2019-07-18', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-13 08:10:00', 1, 1560933920),
(1279, 41, NULL, '2019-07-17', '2019-07-19', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-14 08:10:00', 1, 1560933920),
(1280, 41, NULL, '2019-07-18', '2019-07-20', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-15 08:10:00', 1, 1560933920),
(1281, 41, NULL, '2019-07-19', '2019-07-21', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-16 08:10:00', 1, 1560933920),
(1282, 41, NULL, '2019-07-20', '2019-07-22', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-17 08:10:00', 1, 1560933920),
(1283, 41, NULL, '2019-07-21', '2019-07-23', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-18 08:10:00', 1, 1560933920),
(1284, 41, NULL, '2019-07-22', '2019-07-24', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-19 08:10:00', 1, 1560933920),
(1285, 41, NULL, '2019-07-23', '2019-07-25', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-20 08:10:00', 1, 1560933920),
(1286, 41, NULL, '2019-07-24', '2019-07-26', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-21 08:10:00', 1, 1560933920),
(1287, 41, NULL, '2019-07-25', '2019-07-27', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-22 08:10:00', 1, 1560933920),
(1288, 41, NULL, '2019-07-26', '2019-07-28', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-23 08:10:00', 1, 1560933920),
(1289, 41, NULL, '2019-07-27', '2019-07-29', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-24 08:10:00', 1, 1560933920),
(1290, 41, NULL, '2019-07-28', '2019-07-30', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-25 08:10:00', 1, 1560933920),
(1291, 41, NULL, '2019-07-29', '2019-07-31', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-26 08:10:00', 1, 1560933920),
(1292, 41, NULL, '2019-07-30', '2019-08-01', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-27 08:10:00', 1, 1560933920),
(1293, 41, NULL, '2019-07-31', '2019-08-02', NULL, NULL, '08:10-11:05', 35, 1050, 1000, '2019-07-28 08:10:00', 1, 1560933920),
(1294, 41, NULL, '2019-07-01', '2019-07-19', NULL, NULL, '14:00-11:21', 20, 1085, 1000, '2019-06-30 16:30:00', 1, 1560933920),
(1295, 40, NULL, '2019-06-01', '2019-06-05', NULL, NULL, '07:20-08:11', 20, 1270, 1100, '2019-05-30 00:00:00', 1, NULL),
(1296, 42, NULL, '2019-07-01', '2019-07-06', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-06-28 09:12:00', 1, NULL),
(1297, 42, NULL, '2019-07-02', '2019-07-07', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-06-29 09:12:00', 1, NULL),
(1298, 42, NULL, '2019-07-03', '2019-07-08', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-06-30 09:12:00', 1, NULL),
(1299, 42, NULL, '2019-07-04', '2019-07-09', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-01 09:12:00', 1, NULL),
(1300, 42, NULL, '2019-07-05', '2019-07-10', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-02 09:12:00', 1, NULL),
(1301, 42, NULL, '2019-07-06', '2019-07-11', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-03 09:12:00', 1, 1561024017),
(1302, 42, NULL, '2019-07-07', '2019-07-12', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-04 09:12:00', 1, NULL),
(1303, 42, NULL, '2019-07-08', '2019-07-13', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-05 09:12:00', 1, NULL),
(1304, 42, NULL, '2019-07-09', '2019-07-14', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-06 09:12:00', 1, NULL),
(1305, 42, NULL, '2019-07-10', '2019-07-15', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-07 09:12:00', 1, NULL),
(1306, 42, NULL, '2019-07-11', '2019-07-16', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-08 09:12:00', 1, NULL),
(1307, 42, NULL, '2019-07-12', '2019-07-17', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-09 09:12:00', 1, NULL),
(1308, 42, NULL, '2019-07-13', '2019-07-18', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-10 09:12:00', 1, NULL),
(1309, 42, NULL, '2019-07-14', '2019-07-19', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-11 09:12:00', 1, NULL),
(1310, 42, NULL, '2019-07-15', '2019-07-20', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-12 09:12:00', 1, NULL),
(1311, 42, NULL, '2019-07-16', '2019-07-21', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-13 09:12:00', 1, NULL),
(1312, 42, NULL, '2019-07-17', '2019-07-22', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-14 09:12:00', 1, NULL),
(1313, 42, NULL, '2019-07-18', '2019-07-23', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-15 09:12:00', 1, NULL),
(1314, 42, NULL, '2019-07-19', '2019-07-24', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-16 09:12:00', 1, NULL),
(1315, 42, NULL, '2019-07-20', '2019-07-25', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-17 09:12:00', 1, NULL),
(1316, 42, NULL, '2019-07-21', '2019-07-26', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-18 09:12:00', 1, NULL),
(1317, 42, NULL, '2019-07-22', '2019-07-27', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-19 09:12:00', 1, NULL),
(1318, 42, NULL, '2019-07-23', '2019-07-28', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-20 09:12:00', 1, NULL),
(1319, 42, NULL, '2019-07-24', '2019-07-29', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-21 09:12:00', 1, NULL),
(1320, 42, NULL, '2019-07-25', '2019-07-30', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-22 09:12:00', 1, NULL),
(1321, 42, NULL, '2019-07-26', '2019-07-31', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-23 09:12:00', 1, NULL),
(1322, 42, NULL, '2019-07-27', '2019-08-01', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-24 09:12:00', 1, NULL),
(1323, 42, NULL, '2019-07-28', '2019-08-02', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-25 09:12:00', 1, NULL),
(1324, 42, NULL, '2019-07-29', '2019-08-03', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-26 09:12:00', 1, NULL),
(1325, 42, NULL, '2019-07-30', '2019-08-04', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-27 09:12:00', 1, NULL),
(1326, 42, NULL, '2019-07-31', '2019-08-05', NULL, NULL, '09:12-10:20', 35, 1200, 1150, '2019-07-28 09:12:00', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `reserve_record`
--

CREATE TABLE `reserve_record` (
  `id` int(11) UNSIGNED NOT NULL,
  `plan_position_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL,
  `create_time` datetime NOT NULL,
  `submitter` varchar(20) NOT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reserve_record`
--

INSERT INTO `reserve_record` (`id`, `plan_position_id`, `title`, `quantity`, `create_time`, `submitter`, `delete_time`) VALUES
(38, 923, '旅行', 10, '2019-05-31 14:25:30', '张三', NULL),
(40, 650, 'ge', 6, '2019-06-01 11:54:28', '张三', NULL),
(41, 650, 'fe', 3, '2019-06-03 22:54:29', '张三', NULL),
(44, 1047, '3333333', 10, '2019-06-14 12:18:06', '张三', 1560485954),
(45, 1171, '333', 3, '2019-06-14 14:33:23', '张三', 1560494097),
(46, 1172, 'kkk', 5, '2019-06-14 15:20:16', '张三', 1560497254),
(47, 1202, '光大留位，在隔壁村出票，要问问有没有带伞', 5, '2019-06-17 10:56:14', '张三', 1560741479),
(48, 1202, '阿里旅行非凡', 5, '2019-06-17 11:48:31', '张三', 1560822084),
(49, 1202, '民生洪武', 5, '2019-06-17 11:49:42', '张三', 1560764787),
(50, 1173, 'gegeg', 11, '2019-06-17 17:42:00', '张三', 1560764551),
(51, 1204, 'gege', 3, '2019-06-18 09:42:25', '张三', 1560822204),
(52, 1232, 'frrff', 4, '2019-06-19 10:21:36', '张三', 1560933891),
(53, 1232, 'kki', 3, '2019-06-19 10:50:37', '张三', 1560933878),
(54, 1294, 'fdgfd22', 11, '2019-06-19 14:37:29', '张三', 1560926285),
(55, 1233, '合格', 11, '2019-06-20 16:23:34', '张三', 1561019021),
(56, 1296, 'hghj', 5, '2019-06-20 17:47:15', '张三', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` char(11) NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `account`, `password`, `phone`, `status`) VALUES
(1, '缤纷冰雹', 'admin', '21232f297a57a5a743894a0e4a801fc3', '13123454363', 1),
(2, '张三', 'kim', 'e10adc3949ba59abbe56e057f20f883e', '15486987545', 1),
(3, '里四', 'lucy', 'e10adc3949ba59abbe56e057f20f883e', '11111111111', 1),
(4, '王九', 'dany', 'e10adc3949ba59abbe56e057f20f883e', '22222222222', 1),
(5, '点方', 'sdgf', 'e10adc3949ba59abbe56e057f20f883e', '11111111111', 1),
(7, '官方对司', 'fdsfg', 'e10adc3949ba59abbe56e057f20f883e', '76656789655', 1),
(8, '官方大会', 'gjgy', 'e10adc3949ba59abbe56e057f20f883e', '76656789655', 1),
(9, '非国大', 'nbvngg', 'e10adc3949ba59abbe56e057f20f883e', '15486987545', 1),
(10, '洪峰过后', 'jhgfy', 'e10adc3949ba59abbe56e057f20f883e', '15486987545', 1),
(11, '梵蒂冈', 'hytt', 'e10adc3949ba59abbe56e057f20f883e', '43365345321', 1),
(12, '五上上', 'lyutdeo', 'e10adc3949ba59abbe56e057f20f883e', '11111111111', 1),
(13, '在实施', 'hjyhgf', 'e10adc3949ba59abbe56e057f20f883e', '11111111111', 1),
(14, '李小高', 'gdfdgrr', 'e10adc3949ba59abbe56e057f20f883e', '12345678901', 1),
(15, '亚洪涛', 'mkider', 'e10adc3949ba59abbe56e057f20f883e', '11111111111', 1),
(17, '宏斌非', 'fdaxazs', 'e10adc3949ba59abbe56e057f20f883e', '13212576545', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport_code`
--
ALTER TABLE `airport_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `air_line_table`
--
ALTER TABLE `air_line_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group_access`
--
ALTER TABLE `auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `definite_pass_table`
--
ALTER TABLE `definite_pass_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `definite_record`
--
ALTER TABLE `definite_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_log`
--
ALTER TABLE `plan_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_position`
--
ALTER TABLE `plan_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserve_record`
--
ALTER TABLE `reserve_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `airport_code`
--
ALTER TABLE `airport_code`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;
--
-- 使用表AUTO_INCREMENT `air_line_table`
--
ALTER TABLE `air_line_table`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `auth_rule`
--
ALTER TABLE `auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `definite_pass_table`
--
ALTER TABLE `definite_pass_table`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- 使用表AUTO_INCREMENT `definite_record`
--
ALTER TABLE `definite_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 使用表AUTO_INCREMENT `plan_log`
--
ALTER TABLE `plan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
--
-- 使用表AUTO_INCREMENT `plan_position`
--
ALTER TABLE `plan_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1327;
--
-- 使用表AUTO_INCREMENT `reserve_record`
--
ALTER TABLE `reserve_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
