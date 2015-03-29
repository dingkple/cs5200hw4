


CREATE TABLE if not exists `user` (
  `username` varchar(45) not null,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dateofbirth` timestamp default null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `movie` (
  `id` varchar(45) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `posterimage` varchar(256) DEFAULT NULL,
  `releasedata` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


CREATE TABLE `actor` (
  `id` varchar(45) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `dateofbirth` timestamp default null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `cast` (
  `castid` varchar(45) NOT NULL,
  `charactorname` varchar(45) DEFAULT NULL,
  `actorid` varchar(45) DEFAULT NULL,
  `movieid` varchar(45) default null,
  PRIMARY KEY (`castid`),
  FOREIGN KEY (`actorid`) REFERENCES `actorid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`movieId`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `comment` (
  `commentid` varchar(45) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `actorid` varchar(45) DEFAULT NULL,
  `date` timestamp default null,
  `username` varchar(45) default null,
  `movidId` varchar(45) default null,  
  PRIMARY KEY (`commentid`)
  FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`movieId`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- CREATE TABLE `likes` (
--   `userId` int(11) DEFAULT NULL,
--   `movieId` int(11) DEFAULT NULL,
--   KEY `likes2user_idx` (`userId`),
--   KEY `likes2movie_idx` (`movieId`),
--   CONSTRAINT `likes2movie` FOREIGN KEY (`movieId`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `likes2user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CREATE TABLE `review` (
--   `userId` int(11) DEFAULT NULL,
--   `movieId` int(11) DEFAULT NULL,
--   `title` varchar(45) DEFAULT NULL,
--   `content` varchar(140) DEFAULT NULL,
--   KEY `review2user_idx` (`userId`),
--   KEY `review2movie_idx` (`movieId`),
--   CONSTRAINT `review2movie` FOREIGN KEY (`movieId`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `review2user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
