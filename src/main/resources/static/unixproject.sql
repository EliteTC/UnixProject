-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
<<<<<<< HEAD
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2017 at 09:05 PM
=======
<<<<<<< HEAD
=======
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2017 at 09:05 PM
>>>>>>> a34ce7969580f60617d96a71efe2a0b3af49ed37
>>>>>>> 41af8d760493e05a741dfbf8d0c329cad6466f62
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unixproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `post_id` int(11) NOT NULL,
  `url` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`post_id`, `url`) VALUES
<<<<<<< HEAD
(2, 'http://ofkiev.com/uploads/posts/2015-05/1433080584_1fd979e9cc81059c2e9bc5ee37665614.jpg');
=======
<<<<<<< HEAD
(4, 'http://ofkiev.com/uploads/posts/2015-05/1433080584_1fd979e9cc81059c2e9bc5ee37665614.jpg'),
(2, 'http://terrikon.com/i/stadio/dynamo_fantasy.jpg');
=======
(2, 'http://ofkiev.com/uploads/posts/2015-05/1433080584_1fd979e9cc81059c2e9bc5ee37665614.jpg');
>>>>>>> a34ce7969580f60617d96a71efe2a0b3af49ed37
>>>>>>> 41af8d760493e05a741dfbf8d0c329cad6466f62

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE `map` (
  `post_id` int(11) NOT NULL,
<<<<<<< HEAD
=======
<<<<<<< HEAD
  `placeName` varchar(100) NOT NULL,
=======
>>>>>>> a34ce7969580f60617d96a71efe2a0b3af49ed37
>>>>>>> 41af8d760493e05a741dfbf8d0c329cad6466f62
  `x_coordinate` double NOT NULL,
  `y_coordinate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map`
--

<<<<<<< HEAD
INSERT INTO `map` (`post_id`, `x_coordinate`, `y_coordinate`) VALUES
(2, 23, 34);
=======
INSERT INTO `map` (`post_id`, `placeName`,`x_coordinate`, `y_coordinate`) VALUES
(2, 'Lobanovsky Stadium', 50.450252, 30.535111),
(6, 'Main campus KMA', 50.464370, 30.519123),
(4, 'Garden of Stones', 50.490956, 30.528926),
(5, 'Place fo reading. Botan', 50.461049, 30.510160);

>>>>>>> 41af8d760493e05a741dfbf8d0c329cad6466f62

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `date`, `title`, `description`, `author`) VALUES
<<<<<<< HEAD
(2, '2017-06-24 12:28:28', 'title', 'description', 1),
(4, '2017-06-24 21:02:23', 'newplace', 'descr', 1);
=======
<<<<<<< HEAD
(2, '2017-06-24 12:28:28', 'Lobanovsky Stadium', 'Named after the most outstanding trainer Dynamo Kyiv', 1),
(4, '2017-06-24 21:02:23', 'Stones Garden', 'A nice place near the waterfront Obolonska', 1),
(5, '2017-06-24 23:02:23', 'Library-club', 'You can read books and studing there. The best atmosphere is inspired', 1),
(6, '2017-07-24 8:30:23', 'NaUKMA', 'Visiting lectures:)', 2);
=======
(2, '2017-06-24 12:28:28', 'title', 'description', 1),
(4, '2017-06-24 21:02:23', 'newplace', 'descr', 1);
>>>>>>> a34ce7969580f60617d96a71efe2a0b3af49ed37
>>>>>>> 41af8d760493e05a741dfbf8d0c329cad6466f62

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'ROLE_USER',
  `username` varchar(30) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `username`, `login`, `password`) VALUES
<<<<<<< HEAD
(1, 'ROLE_USER', 'username', 'login', 'pass');
=======
<<<<<<< HEAD
(1, 'ROLE_USER', 'username', 'login', 'pass'),
(2, 'ROLE_USER', 'philya', 'philimon', '1111');
=======
(1, 'ROLE_USER', 'username', 'login', 'pass');
>>>>>>> a34ce7969580f60617d96a71efe2a0b3af49ed37
>>>>>>> 41af8d760493e05a741dfbf8d0c329cad6466f62

--
-- Indexes for dumped tables
--

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`post_id`,`url`);

--
-- Indexes for table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `map`
--
ALTER TABLE `map`
  ADD CONSTRAINT `map_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `user_post` FOREIGN KEY (`author`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
