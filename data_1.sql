CREATE TABLE `ba`.`interview_user` (
  `id` int unsigned auto_increment,
  `email` varchar(128) not null,
  `status` enum('active','sleep','quit') not null,
  `signup` timestamp not null,
  primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('a@naver.com', 'quit', '2017-01-01 11:02:00');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('b@nate.com', 'sleep', '2017-01-02 01:01:11');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('c@daum.net', 'active', '2017-01-12 02:10:32');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('d@naver.com', 'sleep', '2017-01-13 10:20:20');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('e@gmail.com', 'active', '2017-01-14 20:10:02');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('f@gmail.com', 'active', '2017-01-14 22:50:30');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('g@gmail.com', 'active', '2017-01-15 21:40:10');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('h@gmail.com', 'quit', '2017-02-01 10:30:00');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('i@gmail.com', 'active', '2017-02-12 20:03:22');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('j@gmail.com', 'active', '2017-02-14 10:02:03');
insert into `ba`.`interview_user` (`email`, `status`, `signup`) 
values ('a@naver.com', 'active', '2017-03-01 12:10:01');


CREATE TABLE `ba`.`interview_tester` (
  `user_id` int unsigned not null,
  `from` timestamp not null,
  `to` timestamp not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `ba`.`interview_tester` (`user_id`, `from`, `to`) 
values (3, '2017-01-12 02:30:00', '2017-01-12 23:59:59');
insert into `ba`.`interview_tester` (`user_id`, `from`, `to`) 
values (3, '2017-01-15 01:30:00', '2018-01-15 23:59:59');


CREATE TABLE `ba`.`interview_book` (
  `id` int unsigned auto_increment,
  `title` varchar(256) not null,
  `series_id` int unsigned,
  `series_title` varchar(256), 
  primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('보노보노의 인생상담', null, null);
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('스칼렛 Scarlet', null, null);
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('지방을 태우는 몸', null, null);
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('오리지널스', null, null);
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('드래곤볼 1', 2, '드래곤볼');
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('드래곤볼 2', 2, '드래곤볼');
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('드래곤볼 3', 2, '드래곤볼');
insert into `ba`.`interview_book` (`title`, `series_id`, `series_title`) 
values ('교양서 세트', null, null);


CREATE TABLE `ba`.`interview_set_book_sell` (
  `payment_id` bigint unsigned not null,
  `user_id` int not null,
  `set_book_id` int not null,
  `book_id` int not null,
  `set_price` int not null,
  `price` int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `ba`.`interview_set_book_sell` (`payment_id`, `user_id`, `set_book_id`, `book_id`, `set_price`, `price`) 
values (2, 6, 8, 3, 12000, 8000);
insert into `ba`.`interview_set_book_sell` (`payment_id`, `user_id`, `set_book_id`, `book_id`, `set_price`, `price`) 
values (2, 6, 8, 4, 12000, 4000);


CREATE TABLE `ba`.`interview_payment` (
  `id` bigint unsigned auto_increment,
  `user_id` int not null,
  `pay_for` enum('book','ridicash','device') not null,
  `pay_date` timestamp not null,
  `price` int not null,
  primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (1, 'book', '2017-01-02 01:01:11', 10000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (2, 'book', '2017-01-11 11:14:00', 12000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (3, 'book', '2017-01-12 12:03:20', 11200);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (3, 'ridicash', '2017-01-12 12:04:10', 100000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (3, 'device', '2017-01-12 12:04:11', 70000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (4, 'ridicash', '2017-01-13 10:21:01', 30000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (4, 'book', '2017-01-13 10:22:00', 1000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (8, 'book', '2017-02-03 11:00:01', 10000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (8, 'ridicash', '2017-02-03 12:00:10', 3000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (9, 'book', '2017-02-13 12:00:10', 400);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (10, 'book', '2017-02-15 21:16:13', 17000);
insert into `ba`.`interview_payment` (`user_id`, `pay_for`, `pay_date`, `price`) 
values (11, 'book', '2017-03-02 10:12:03', 32000);


CREATE TABLE `ba`.`interview_user_book` (
  `id` bigint unsigned auto_increment,
  `payment_id` bigint unsigned not null,
  `user_id` int not null,
  `book_id` int not null,
  `service_type` enum('permanent','rent','flatrate') not null,
  `price` int not null,
  primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (1, 1, 1, 'permanent', 10000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (2, 2, 3, 'permanent', 8000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (2, 2, 4, 'permanent', 4000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (3, 3, 5, 'rent', 400);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (3, 3, 6, 'rent', 400);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (3, 3, 7, 'rent', 400);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (3, 3, 1, 'permanent', 10000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (7, 4, 5, 'permanent', 500);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (7, 4, 6, 'permanent', 500);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (8, 8, 1, 'permanent', 10000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (10, 9, 5, 'rent', 400);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (11, 10, 1, 'permanent', 10000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (11, 10, 2, 'permanent', 7000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (12, 11, 1, 'permanent', 10000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (12, 11, 2, 'permanent', 7000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (12, 11, 3, 'permanent', 10000);
insert into `ba`.`interview_user_book` (`payment_id`, `user_id`, `book_id`, `service_type`, `price`) 
values (12, 11, 4, 'permanent', 5000);
