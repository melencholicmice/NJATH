-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 17, 2020 at 11:55 AM
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

--
-- Dumping data for table `Contestants`
--

INSERT INTO `Contestants` (`sr_no`, `username`, `pId`, `password`, `csrfToken`, `lastLogin`, `totalLogin`, `privateKey`, `Disqualified`) VALUES
(1, 'Anam0204', 'ANW2000', '8eac340467fbb0cab67b26560a81ef353c13b9c8', NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ContestantsData`
--

CREATE TABLE `ContestantsData` (
  `Username` varchar(15) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '1',
  `Level Score` int(11) NOT NULL DEFAULT '40',
  `Total Score` int(11) NOT NULL DEFAULT '40',
  `level loan` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ContestantsData`
--

INSERT INTO `ContestantsData` (`Username`, `Level`, `Level Score`, `Total Score`, `level loan`) VALUES
('Anam0204', 1, 50, 30, 20);

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
  `Question Picture` varchar(20) DEFAULT NULL,
  `Hint` text,
  `Answer Regular` varchar(30) NOT NULL,
  `reduction` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Questions`
--

-- INSERT INTO `Questions` (`Question ID`, `Type`, `Question Text`, `Hint`, `Question Picture`, `Answer Regular`, `reduction`) VALUES
-- ('111', 2, '', 'What’s stopping you from answering?', '30.jpg', 'resistor', 0),
-- ('121', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'kingscrossstation', 0),
-- ('131', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'mountrushmore', 0),
-- ('141', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peacelogo', 0),
-- ('151', 2, '', 'don\'t miss the blur it might tell you something', '16.jpeg', 'wingdings', 0),
-- ('161', 1, 'Planning to see statue of liberty you stopped at Red Hook Lobster Point to have a meal. You asked the waiter for Prawn Sesame Toast but he shook is head and told you this no.. How this number is related to the person obsessed with ... --', 'go check the menu of Red Hook Lobster Point, they don\'t have this dish in menu… and you are going to see statue of liberty i.e. you are in US', '', 'ageatthetimeofdeath', 0),
-- ('171', 1, 'made in the memories of Green Mountain Boys, buried right now with his 33 brothers in waterbury , he was the youngest resident which came in 1988 and left us in 1988.', 'if you are thinking about any living creature… sorry I am not that…me and my brothers are the cure of your sugar craving….and waterwaterbury is famous for me', '', 'ethanalmond', 0),
-- ('181', 1, '74um474wh4k474n61h4n64k04u4u074m47347ur1pl1k4k4p1k1m4un64h0r0nl1kup0k41wh3nu4k174n473ru\n\nIf you get this \n-. .- -- .  - .... .  .. ... .-.. .- -. -..\n', 'search for secret code language', '', 'porangahau', 0),
-- ('152', 2, '', 'What’s stopping you from answering?', '30.jpg', 'resistor', 0),
-- ('182', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'kingscrossstation', 0),
-- ('112', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'mountrushmore', 0),
-- ('132', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peacelogo', 0),
-- ('172', 2, '', 'don\'t miss the blur it might tell you something', '16.jpeg', 'wingdings', 0),
-- ('142', 1, 'Planning to see statue of liberty you stopped at Red Hook Lobster Point to have a meal. You asked the waiter for Prawn Sesame Toast but he shook is head and told you this no.. How this number is related to the person obsessed with ... --', 'go check the menu of Red Hook Lobster Point, they don\'t have this dish in menu… and you are going to see statue of liberty i.e. you are in US', '', 'ageatthetimeofdeath', 0),
-- ('162', 1, 'made in the memories of Green Mountain Boys, buried right now with his 33 brothers in waterbury , he was the youngest resident which came in 1988 and left us in 1988.', 'if you are thinking about any living creature… sorry I am not that…me and my brothers are the cure of your sugar craving….and waterwaterbury is famous for me', '', 'ethanalmond', 0),
-- ('122', 1, '74um474wh4k474n61h4n64k04u4u074m47347ur1pl1k4k4p1k1m4un64h0r0nl1kup0k41wh3nu4k174n473ru\n\nIf you get this \n-. .- -- .  - .... .  .. ... .-.. .- -. -..\n', 'search for secret code language', '', 'porangahau', 0),
-- ('163', 2, '', 'What’s stopping you from answering?', '30.jpg', 'resistor', 0),
-- ('173', 1, 'Two IIT professors Dr.X and Dr.Y bump into each other in Anwesha’20 after a very long time.\n\nX hey! How have you been?\nY great! I got married and had three daughters now\n\nX really? How old are they?\nY well, the product of their age is 72, and the sum of their age is the same as the number on that building over there \n\nX right, ok … wait … hmmm, I still don’t know\nY  oh sorry, the oldest one just started to play the piano.\n\nX wonderful! My oldest is of the same age too!\n\nSo, Dr.Y \nLet the youngest one of yours be A,Middle one be B,Oldest one be C\n\nCalculate the value of A(C+2B-1)/(A-1)(C-A-B)and tell what i am talking about ?\n', 'It\'s Magic', '', 'kingscrossstation', 0),
-- ('123', 1, 'SREH TAFDNA RGXI SEHTWONKEW ODWO HSECAFWE NR UOFTOGS REHT AFD NAR GXISEHTECIDG NIY ALPN ITS ERETN IS’D OG GN ISSU CSI DER EWELPOEPNEHW?', 'Nothing’s straightforward here.', '', 'mountrushmore', 0),
-- ('113', 1, 'Cutting the generous pizza in 4 pieces with 2 having 12.5% of cheese and others having 37.5% of tomatoes on them. You made me what am I..?', 'just follow the instructions and symmetry might help you', '', 'peacelogo', 0),
-- ('153', 2, '', 'don\'t miss the blur it might tell you something', '16.jpeg', 'wingdings', 0),
-- ('143', 1, 'Planning to see statue of liberty you stopped at Red Hook Lobster Point to have a meal. You asked the waiter for Prawn Sesame Toast but he shook is head and told you this no.. How this number is related to the person obsessed with ... --', 'go check the menu of Red Hook Lobster Point, they don\'t have this dish in menu… and you are going to see statue of liberty i.e. you are in US', '', 'ageatthetimeofdeath', 0),
-- ('183', 1, 'made in the memories of Green Mountain Boys, buried right now with his 33 brothers in waterbury , he was the youngest resident which came in 1988 and left us in 1988.', 'if you are thinking about any living creature… sorry I am not that…me and my brothers are the cure of your sugar craving….and waterwaterbury is famous for me', '', 'ethanalmond', 0),
-- ('133', 1, '74um474wh4k474n61h4n64k04u4u074m47347ur1pl1k4k4p1k1m4un64h0r0nl1kup0k41wh3nu4k174n473ru\n\nIf you get this \n-. .- -- .  - .... .  .. ... .-.. .- -. -..\n', 'search for secret code language', '', 'porangahau', 0),
-- ('211', 3, 'Escape the 5 illusions to arrive at these place', 'https://i.imgur.com/RTeI1xK.jpg', '5.jpg', 'pokhran', 0),
-- ('221', 2, '', 'A physician’s creation', '6.png', 'sherlock holmes', 0),
-- ('231', 3, 'What do they refer to', 'Take a shot!', '13.jpg', 'therimeoftheancientmariner', 0),
-- ('241', 1, 'Amongst the heavy rise and fall of the breaths,the heartbeats and the voice of rushing blood in your veins...everything else being exceptionally still......and here your footsteps are no longer audible.....Where the only sound exist is you..... you\'ll find it in the world records and it\'s location have a relation with no. 87', 'when you get so close to the brownian motion', '', 'theanechoicchamberofmicrosoft', 0),
-- ('251', 1, 'His name weight more than many of you and also his temp is nearly equal to ice. He hates going library and doesn\'t like librarians at all. This is because he faces most violent year of his life in library . Whats his name ?', 'magic will lead you to answer.', '', 'quentincoldwater', 0),
-- ('261', 3, 'What’s in the veg starters ?', 'related to anime..', '47.jpg', 'grookey', 0),
-- ('271', 1, 'ThE FauLT dEAr bRUtus IS noT in our StaRS bUt in OUrsELves tRy tO dECodE me. \n(A=  b=a) \n', 'groups of 5 ….. Where all the capitals are getting b', '', 'youdecodedme', 0),
-- ('281', 2, '', 'the answer is a single line.', '48.jpg', 'vinculum', 0),
-- ('222', 3, 'Escape the 5 illusions to arrive at these place', 'https://i.imgur.com/RTeI1xK.jpg', '5.jpg', 'pokhran', 0),
-- ('242', 2, '', 'A physician’s creation', '6.png', 'sherlock holmes', 0),
-- ('282', 3, 'What do they refer to', 'Take a shot!', '13.jpg', 'therimeoftheancientmariner', 0),
-- ('212', 1, 'Amongst the heavy rise and fall of the breaths,the heartbeats and the voice of rushing blood in your veins...everything else being exceptionally still......and here your footsteps are no longer audible.....Where the only sound exist is you..... you\'ll find it in the world records and it\'s location have a relation with no. 87', 'when you get so close to the brownian motion', '', 'theanechoicchamberofmicrosoft', 0),
-- ('272', 1, 'His name weight more than many of you and also his temp is nearly equal to ice. He hates going library and doesn\'t like librarians at all. This is because he faces most violent year of his life in library . Whats his name ?', 'magic will lead you to answer.', '', 'quentincoldwater', 0),
-- ('232', 3, 'What’s in the veg starters ?', 'related to anime..', '47.jpg', 'grookey', 0),
-- ('252', 1, 'ThE FauLT dEAr bRUtus IS noT in our StaRS bUt in OUrsELves tRy tO dECodE me. \n(A=  b=a) \n', 'groups of 5 ….. Where all the capitals are getting b', '', 'youdecodedme', 0),
-- ('262', 2, '', 'the answer is a single line.', '48.jpg', 'vinculum', 0),
-- ('273', 3, 'Escape the 5 illusions to arrive at these place', 'https://i.imgur.com/RTeI1xK.jpg', '5.jpg', 'pokhran', 0),
-- ('243', 2, '', 'A physician’s creation', '6.png', 'sherlock holmes', 0),
-- ('263', 3, 'What do they refer to', 'Take a shot!', '13.jpg', 'therimeoftheancientmariner', 0),
-- ('283', 1, 'Amongst the heavy rise and fall of the breaths,the heartbeats and the voice of rushing blood in your veins...everything else being exceptionally still......and here your footsteps are no longer audible.....Where the only sound exist is you..... you\'ll find it in the world records and it\'s location have a relation with no. 87', 'when you get so close to the brownian motion', '', 'theanechoicchamberofmicrosoft', 0),
-- ('213', 1, 'His name weight more than many of you and also his temp is nearly equal to ice. He hates going library and doesn\'t like librarians at all. This is because he faces most violent year of his life in library . Whats his name ?', 'magic will lead you to answer.', '', 'quentincoldwater', 0),
-- ('223', 3, 'What’s in the veg starters ?', 'related to anime..', '47.jpg', 'grookey', 0),
-- ('233', 1, 'ThE FauLT dEAr bRUtus IS noT in our StaRS bUt in OUrsELves tRy tO dECodE me. \n(A=  b=a) \n', 'groups of 5 ….. Where all the capitals are getting b', '', 'youdecodedme', 0),
-- ('253', 2, '', 'the answer is a single line.', '48.jpg', 'vinculum', 0),
-- ('311', 1, 'If Jupiter, Saturn, Apollo and Mercury are in this specific order ……... Venus and Moon on the other side …... Mars in between all of this. Name this ….airless place.', 'https://i.imgur.com/CcEOPs9.jpg', '', 'palm', 0),
-- ('321', 1, 'Philosophize in the shower\nAsh your cigarette in the flowers\nAnd I almost lost it \nAnd yet somehow I didn’t\nAll I tried with Grieve \nWas to straighten some teeth\nForty-five I took from a blunt \nSo here my friend \nWas my tale of woe \nNow tell me you remember me ?\n', 'I wish my head was as complete as my name', '', 'sirnicholasdemimsyporpingtonkg', 0),
-- ('331', 3, 'Who\'s playing the screen ?', 'Brace My Leg', '14.jpg', 'ericroth', 0),
-- ('341', 3, 'What is the missing link which will open this secret?', 'sudo rm -rf /', '23.jpg', 'enolagay', 0),
-- ('351', 3, 'Decode', 'Narrow down the gap to widen it again, and it will point out the answer.', '24.jpg', 'iitpatna', 0),
-- ('361', 1, 'On the first day is a press meeting. On the second and third days, you attend press conferences. Later on the third day, lectures are held, which are continued till the fourth day. The fourth day ends with a concert in the evening. You then engage in a dialogue on the fifth day. After which you get your diploma on the sixth day at the concert hall, and if you proceed South West from here, you will enjoy an exquisite dinner at the city hall. And at the final day, you finally reach the palace. Where is this palace located?', 'not necessarily a person getting the diploma', '', 'stockholm', 0),
-- ('371', 1, 'Here I was all up in my space \nDidn\'t think anyone could take my place \nThey\'re from the middle,they\'re from the east\nIt was smith who drew out the beast \nWho build me up and then stepped aside ?\n', '828-830', '', 'cyleeandpartners', 0),
-- ('381', 1, 'Her inspiration was a comic while vacationing in Switzerland. She initially had a ponytail and \nlater colored her hair red. She met her boyfriend after which within a year they moved into their dream home. She had published a book, “How to lose weight” which advised people not to eat. Controversy erupted over this but this wasn’t enough for her to take back her words. After which she also started surfing. In the 1970s, she won gold at the Winter Olympics in swimming, skating and skiing categories, a remarkable feat.  Although, she also had to face embarrassment in public due to her sister during this period. She switched her job to doctor as well, and also started going to parties. In the 1990s she even contested the election of the President, but her words were always a source of controversy. With the start of the century, she broke up with her boyfriend but was later found out with a tattoo of her boyfriend’s name on her body. \nWho am I talking about?\n', 'She inspired a 19 year old American girl who believes that average is beautiful and a girl', '', 'barbie', 0),
-- ('352', 1, 'If Jupiter, Saturn, Apollo and Mercury are in this specific order ……... Venus and Moon on the other side …... Mars in between all of this. Name this ….airless place.', 'https://i.imgur.com/CcEOPs9.jpg', '', 'palm', 0),
-- ('362', 1, 'Philosophize in the shower\nAsh your cigarette in the flowers\nAnd I almost lost it \nAnd yet somehow I didn’t\nAll I tried with Grieve \nWas to straighten some teeth\nForty-five I took from a blunt \nSo here my friend \nWas my tale of woe \nNow tell me you remember me ?\n', 'I wish my head was as complete as my name', '', 'sirnicholasdemimsyporpingtonkg', 0),
-- ('342', 3, 'Who\'s playing the screen ?', 'Brace My Leg', '14.jpg', 'ericroth', 0),
-- ('382', 3, 'What is the missing link which will open this secret?', 'sudo rm -rf /', '23.jpg', 'enolagay', 0),
-- ('312', 3, 'Decode', 'Narrow down the gap to widen it again, and it will point out the answer.', '24.jpg', 'iitpatna', 0),
-- ('372', 1, 'On the first day is a press meeting. On the second and third days, you attend press conferences. Later on the third day, lectures are held, which are continued till the fourth day. The fourth day ends with a concert in the evening. You then engage in a dialogue on the fifth day. After which you get your diploma on the sixth day at the concert hall, and if you proceed South West from here, you will enjoy an exquisite dinner at the city hall. And at the final day, you finally reach the palace. Where is this palace located?', 'not necessarily a person getting the diploma', '', 'stockholm', 0),
-- ('322', 1, 'Here I was all up in my space \nDidn\'t think anyone could take my place \nThey\'re from the middle,they\'re from the east\nIt was smith who drew out the beast \nWho build me up and then stepped aside ?\n', '828-830', '', 'cyleeandpartners', 0),
-- ('332', 1, 'Her inspiration was a comic while vacationing in Switzerland. She initially had a ponytail and \nlater colored her hair red. She met her boyfriend after which within a year they moved into their dream home. She had published a book, “How to lose weight” which advised people not to eat. Controversy erupted over this but this wasn’t enough for her to take back her words. After which she also started surfing. In the 1970s, she won gold at the Winter Olympics in swimming, skating and skiing categories, a remarkable feat.  Although, she also had to face embarrassment in public due to her sister during this period. She switched her job to doctor as well, and also started going to parties. In the 1990s she even contested the election of the President, but her words were always a source of controversy. With the start of the century, she broke up with her boyfriend but was later found out with a tattoo of her boyfriend’s name on her body. \nWho am I talking about?\n', 'She inspired a 19 year old American girl who believes that average is beautiful and a girl', '', 'barbie', 0),
-- ('353', 1, 'If Jupiter, Saturn, Apollo and Mercury are in this specific order ……... Venus and Moon on the other side …... Mars in between all of this. Name this ….airless place.', 'https://i.imgur.com/CcEOPs9.jpg', '', 'palm', 0),
-- ('363', 1, 'Philosophize in the shower\nAsh your cigarette in the flowers\nAnd I almost lost it \nAnd yet somehow I didn’t\nAll I tried with Grieve \nWas to straighten some teeth\nForty-five I took from a blunt \nSo here my friend \nWas my tale of woe \nNow tell me you remember me ?\n', 'I wish my head was as complete as my name', '', 'sirnicholasdemimsyporpingtonkg', 0),
-- ('333', 3, 'Who\'s playing the screen ?', 'Brace My Leg', '14.jpg', 'ericroth', 0),
-- ('383', 3, 'What is the missing link which will open this secret?', 'sudo rm -rf /', '23.jpg', 'enolagay', 0),
-- ('313', 3, 'Decode', 'Narrow down the gap to widen it again, and it will point out the answer.', '24.jpg', 'iitpatna', 0),
-- ('323', 1, 'On the first day is a press meeting. On the second and third days, you attend press conferences. Later on the third day, lectures are held, which are continued till the fourth day. The fourth day ends with a concert in the evening. You then engage in a dialogue on the fifth day. After which you get your diploma on the sixth day at the concert hall, and if you proceed South West from here, you will enjoy an exquisite dinner at the city hall. And at the final day, you finally reach the palace. Where is this palace located?', 'not necessarily a person getting the diploma', '', 'stockholm', 0),
-- ('373', 1, 'Here I was all up in my space \nDidn\'t think anyone could take my place \nThey\'re from the middle,they\'re from the east\nIt was smith who drew out the beast \nWho build me up and then stepped aside ?\n', '828-830', '', 'cyleeandpartners', 0),
-- ('343', 1, 'Her inspiration was a comic while vacationing in Switzerland. She initially had a ponytail and \nlater colored her hair red. She met her boyfriend after which within a year they moved into their dream home. She had published a book, “How to lose weight” which advised people not to eat. Controversy erupted over this but this wasn’t enough for her to take back her words. After which she also started surfing. In the 1970s, she won gold at the Winter Olympics in swimming, skating and skiing categories, a remarkable feat.  Although, she also had to face embarrassment in public due to her sister during this period. She switched her job to doctor as well, and also started going to parties. In the 1990s she even contested the election of the President, but her words were always a source of controversy. With the start of the century, she broke up with her boyfriend but was later found out with a tattoo of her boyfriend’s name on her body. \nWho am I talking about?\n', 'She inspired a 19 year old American girl who believes that average is beautiful and a girl', '', 'barbie', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Questions-Anam0204`
--

CREATE TABLE `Questions-Anam0204` (
  `Question Number` varchar(2) NOT NULL,
  `Question ID` varchar(3) NOT NULL,
  `Hinted` int(11) DEFAULT '0',
  `Time Opened` int(11) DEFAULT '-1',
  `Time Answered` int(11) DEFAULT '-1',
  `Obtained Score` int(11) NOT NULL DEFAULT '0',
  `Attempts` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Questions-Anam0204`
--

INSERT INTO `Questions-Anam0204` (`Question Number`, `Question ID`, `Hinted`, `Time Opened`, `Time Answered`, `Obtained Score`, `Attempts`) VALUES
('11', '113', 0, -1, -1, 0, 0),
('12', '123', 0, 26803411, 26803413, 30, 1),
('13', '133', 0, -1, -1, 0, 0),
('14', '143', 0, -1, -1, 0, 0),
('15', '153', 0, -1, -1, 0, 0),
('16', '163', 0, 26803411, -1, 0, 0),
('17', '173', 0, -1, -1, 0, 0),
('18', '183', 0, -1, -1, 0, 0),
('21', '213', 0, -1, -1, 0, 0),
('22', '223', 0, -1, -1, 0, 0),
('23', '233', 0, -1, -1, 0, 0),
('24', '243', 0, -1, -1, 0, 0),
('25', '253', 0, -1, -1, 0, 0),
('26', '263', 0, -1, -1, 0, 0),
('27', '273', 0, -1, -1, 0, 0),
('28', '283', 0, -1, -1, 0, 0),
('31', '313', 0, -1, -1, 0, 0),
('32', '323', 0, -1, -1, 0, 0),
('33', '333', 0, -1, -1, 0, 0),
('34', '343', 0, -1, -1, 0, 0),
('35', '353', 0, -1, -1, 0, 0),
('36', '363', 0, -1, -1, 0, 0),
('37', '373', 0, -1, -1, 0, 0),
('38', '383', 0, -1, -1, 0, 0);

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
-- Indexes for table `Questions-Anam0204`
--
ALTER TABLE `Questions-Anam0204`
  ADD PRIMARY KEY (`Question Number`),
  ADD UNIQUE KEY `Question Number` (`Question Number`),
  ADD UNIQUE KEY `Question ID` (`Question ID`);

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
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;