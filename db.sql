-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 01, 2020 at 02:28 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `njath`
--

-- --------------------------------------------------------

--
-- Table structure for table `Contestants`
--

CREATE TABLE `Contestants` (
  `sr_no` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `pId` varchar(40) NOT NULL,
  `password` char(40) NOT NULL,
  `csrfToken` char(40) DEFAULT NULL,
  `lastLogin` date DEFAULT NULL,
  `totalLogin` int(11) NOT NULL DEFAULT '0',
  `privateKey` varchar(26) DEFAULT NULL,
  `Disqualified` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ContestantsData`
--

CREATE TABLE `ContestantsData` (
  `Username` varchar(15) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '1',
  `Level Score` int(11) NOT NULL DEFAULT '40',
  `Total Score` int(11) NOT NULL DEFAULT '40'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `People`
--

CREATE TABLE `People` (
  `name` varchar(50) DEFAULT NULL,
  `pId` int(4) NOT NULL DEFAULT '0',
  `college` varchar(50) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `feePaid` int(4) DEFAULT NULL,
  `confirm` int(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `Question ID` varchar(3) NOT NULL,
  `Type` smallint(6) NOT NULL DEFAULT '3',
  `Question Text` text,
  `Hint` text,
  `Question Picture` varchar(20) DEFAULT NULL,
  `Answer Regular` varchar(30) NOT NULL,
  `reduction` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Questions`
--

INSERT INTO `Questions` (`Question ID`, `Type`, `Question Text`, `Hint`, `Question Picture`, `Answer Regular`, `reduction`) VALUES
('111', 2, '', 'What’s stopping you from answering?', '30.jpg', 'Resistor', 0),
('223', 3, 'What’s in the veg starters ?', '47.jpg', 'related to anime..', 'Grookey', 0),
('232', 3, 'What’s in the veg starters ?', '47.jpg', 'related to anime..', 'Grookey', 0),
('261', 3, 'What’s in the veg starters ?', '47.jpg', 'related to anime..', 'Grookey', 0),
('322', 1, 'Here I was all up in my space \nDidn\'t think anyone could take my place \nThey\'re from the middle,they\'re from the east\nIt was smith who drew out the beast \nWho build me up and then stepped aside ?\n', '', '828-830', 'C Y Lee and Partners', 0),
('331', 3, 'Who\'s playing the screen ?', '14.jpg', 'Brace My Leg', 'Eric Roth', 0),
('333', 3, 'Who\'s playing the screen ?', '14.jpg', 'Brace My Leg', 'Eric Roth', 0),
('341', 3, 'What is the missing link which will open this secret?', '23.jpg', 'sudo rm -rf /', 'Enola Gay', 0),
('342', 3, 'Who\'s playing the screen ?', '14.jpg', 'Brace My Leg', 'Eric Roth', 0),
('371', 1, 'Here I was all up in my space \nDidn\'t think anyone could take my place \nThey\'re from the middle,they\'re from the east\nIt was smith who drew out the beast \nWho build me up and then stepped aside ?\n', '', '828-830', 'C Y Lee and Partners', 0),
('373', 1, 'Here I was all up in my space \nDidn\'t think anyone could take my place \nThey\'re from the middle,they\'re from the east\nIt was smith who drew out the beast \nWho build me up and then stepped aside ?\n', '', '828-830', 'C Y Lee and Partners', 0),
('382', 3, 'What is the missing link which will open this secret?', '23.jpg', 'sudo rm -rf /', 'Enola Gay', 0),
('383', 3, 'What is the missing link which will open this secret?', '23.jpg', 'sudo rm -rf /', 'Enola Gay', 0),
('421', 3, '', '49.jpg', 'aim at the octagon', 'Octavian', 0),
('111', 2, '', 'What’s stopping you from answering?', '30.jpg', 'Resistor', 0),
('121', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'King\'s Cross Train Station', 0),
('131', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'Mt Rushmore', 0),
('141', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peace logo', 0),
('111', 2, '', 'What’s stopping you from answering?', '30.jpg', 'Resistor', 0),
('121', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'King\'s Cross Train Station', 0),
('131', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'Mt Rushmore', 0),
('141', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peace logo', 0),
('111', 2, '', 'What’s stopping you from answering?', '30.jpg', 'Resistor', 0),
('121', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'King\'s Cross Train Station', 0),
('131', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'Mt Rushmore', 0),
('141', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peace logo', 0),
('151', 2, '', 'don\'t miss the blur it might tell you something', '16.jpeg', 'wingdings', 0),
('161', 1, 'Planning to see statue of liberty you stopped at Red Hook Lobster Point to have a meal. You asked the waiter for Prawn Sesame Toast but he shook is head and told you this no.. How this number is related to the person obsessed with ... --', 'go check the menu of Red Hook Lobster Point, they don\'t have this dish in menu… and you are going to see statue of liberty i.e. you are in US', '', 'age at the time of death', 0),
('171', 1, 'made in the memories of Green Mountain Boys, buried right now with his 33 brothers in waterbury , he was the youngest resident which came in 1988 and left us in 1988.', 'if you are thinking about any living creature… sorry I am not that…me and my brothers are the cure of your sugar craving….and waterwaterbury is famous for me', '', 'ETHAN ALMOND', 0),
('181', 1, '74um474wh4k474n61h4n64k04u4u074m47347ur1pl1k4k4p1k1m4un64h0r0nl1kup0k41wh3nu4k174n473ru\n\nIf you get this \n-. .- -- .  - .... .  .. ... .-.. .- -. -..\n', 'search for secret code language', '', 'Porangahau', 0),
('152', 2, '', 'What’s stopping you from answering?', '30.jpg', 'Resistor', 0),
('182', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'King\'s Cross Train Station', 0),
('112', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'Mt Rushmore', 0),
('132', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peace logo', 0),
('172', 2, '', 'don\'t miss the blur it might tell you something', '16.jpeg', 'wingdings', 0),
('142', 1, 'Planning to see statue of liberty you stopped at Red Hook Lobster Point to have a meal. You asked the waiter for Prawn Sesame Toast but he shook is head and told you this no.. How this number is related to the person obsessed with ... --', 'go check the menu of Red Hook Lobster Point, they don\'t have this dish in menu… and you are going to see statue of liberty i.e. you are in US', '', 'age at the time of death', 0),
('162', 1, 'made in the memories of Green Mountain Boys, buried right now with his 33 brothers in waterbury , he was the youngest resident which came in 1988 and left us in 1988.', 'if you are thinking about any living creature… sorry I am not that…me and my brothers are the cure of your sugar craving….and waterwaterbury is famous for me', '', 'ETHAN ALMOND', 0),
('122', 1, '74um474wh4k474n61h4n64k04u4u074m47347ur1pl1k4k4p1k1m4un64h0r0nl1kup0k41wh3nu4k174n473ru\n\nIf you get this \n-. .- -- .  - .... .  .. ... .-.. .- -. -..\n', 'search for secret code language', '', 'Porangahau', 0),
('163', 2, '', 'What’s stopping you from answering?', '30.jpg', 'Resistor', 0),
('173', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'King\'s Cross Train Station', 0),
('123', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'Mt Rushmore', 0),
('113', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peace logo', 0),
('153', 2, '', 'don\'t miss the blur it might tell you something', '16.jpeg', 'wingdings', 0),
('143', 1, 'Planning to see statue of liberty you stopped at Red Hook Lobster Point to have a meal. You asked the waiter for Prawn Sesame Toast but he shook is head and told you this no.. How this number is related to the person obsessed with ... --', 'go check the menu of Red Hook Lobster Point, they don\'t have this dish in menu… and you are going to see statue of liberty i.e. you are in US', '', 'age at the time of death', 0),
('183', 1, 'made in the memories of Green Mountain Boys, buried right now with his 33 brothers in waterbury , he was the youngest resident which came in 1988 and left us in 1988.', 'if you are thinking about any living creature… sorry I am not that…me and my brothers are the cure of your sugar craving….and waterwaterbury is famous for me', '', 'ETHAN ALMOND', 0),
('133', 1, '74um474wh4k474n61h4n64k04u4u074m47347ur1pl1k4k4p1k1m4un64h0r0nl1kup0k41wh3nu4k174n473ru\n\nIf you get this \n-. .- -- .  - .... .  .. ... .-.. .- -. -..\n', 'search for secret code language', '', 'Porangahau', 0);

-- --------------------------------------------------------

--
-- Table structure for table `QuestionSolves`
--

CREATE TABLE `QuestionSolves` (
  `Question ID` varchar(3) NOT NULL,
  `First Solve` int(11) NOT NULL DEFAULT '-1',
  `Solves` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Contestants`
--
ALTER TABLE `Contestants`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ContestantsData`
--
ALTER TABLE `ContestantsData`
  ADD PRIMARY KEY (`Username`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `People`
--
ALTER TABLE `People`
  ADD PRIMARY KEY (`pId`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `QuestionSolves`
--
ALTER TABLE `QuestionSolves`
  ADD PRIMARY KEY (`Question ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Contestants`
--
ALTER TABLE `Contestants`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=719;
