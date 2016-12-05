SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE 'users' (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'firstName' varchar(32) NOT NULL,
  'lastName' varchar(32) NOT NULL,
  'userName' varchar(32) NOT NULL,
  'password' varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE 'message' (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'recipient_ids' varchar(32) NOT NULL,
  'user_id' varchar(32) NOT NULL,
  'subject' varchar(32) NOT NULL,
  'body' varchar(32) NOT NULL,
  'date_Sent' varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE 'message_read' (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'message_id' varchar(32) NOT NULL,
  'reader_id' varchar(32) NOT NULL,
  'date' date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
