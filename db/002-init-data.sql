USE tpac_db;

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 1, 'Pastor Chu', '朱銘華牧師', 'M', '+852', '22223333', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_1.png');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 2, 'Pastor Kwong', '江兆仁牧師', 'M', '+852', '33334444', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_2.png');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 3, 'SzeTo Mei Ching', '司徒美清姑娘', 'F', '+852', '44445555', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_3.png');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 4, 'Chan Shu Yuk', '陳秀玉姑娘', 'F', '+852', '44445555', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_4.png');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 5, 'Lee Yin Chun', '李英聰傳道', 'M', '+852', '44445555', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_5.png');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 6, 'Ng Yuk Ling', '吳玉玲傳道', 'F', '+852', '44445555', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_6.png');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 7, 'Ng Mei Hai', '吳美霞姊妹', 'F', '+852', '44445555', NOW(),
'http://www.tpaccma.org/wp-content/uploads/2018/06/profile_7.png');



insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 1, '同工', '', '同工', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 2, '團契', '', '雅各團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 3, '團契', '', '安得烈團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 4, '團契', '', '所羅門團', NOW() );


insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 1, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 2, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 3, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 4, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 5, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 6, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 7, NOW() );


insert into Worship ( worship_id, date, type, remark, created_date ) values ( 1, '2018-12-02', '早堂', '', NOW() );
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 2, '2018-12-02', '午堂', '', NOW() );
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 3, '2018-12-09', '早堂', '', NOW() );
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 4, '2018-12-09', '午堂', '', NOW() );


