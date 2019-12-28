USE tpac_db;


insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 1, '同工', '', '同工', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 2, '團契', '', '以諾團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 3, '團契', '', '保羅團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 4, '團契', '', '馬利亞團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 5, '團契', '', '彼得團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 6, '團契', '', '哈拿團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 7, '團契', '', '約書亞團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 8, '團契', '', '挪亞團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 9, '團契', '', '提摩太團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 10, '團契', '', '以利亞團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 11, '團契', '', '但以理團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 12, '團契', '', '安得烈團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 13, '團契', '', '基甸團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 14, '團契', '', '雅各團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 15, '團契', '', '雅各團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 16, '團契', '', '迦勒團', NOW() );
insert into `Group` ( group_id, type, name_en, `name_zh-hk`, created_date ) values ( 17, '團契', '', '所羅門團', NOW() );


insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 1, 'Pastor Chu', '朱銘華牧師', 'M', '+852', '22223333', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 2, 'Pastor Kwong', '江兆仁牧師', 'M', '+852', '33334444', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 3, 'SzeTo Mei Ching', '司徒美清姑娘', 'F', '+852', '44445555', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 4, 'Chan Shu Yuk', '陳秀玉姑娘', 'F', '+852', '44445555', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 5, 'Wong Pik Tan', '黃碧丹', 'F', '+852', '44445555', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 6, 'Fung Jackie', '馮俊鍵傳道', 'M', '+852', '44445555', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 7, '', '金細', 'M', '+852', '44445555', NOW(), '');

insert into User ( user_id, name_en, `name_zh-hk`, gender, phone_country, phone, created_date, avator ) 
values ( 8, 'Ng Mei Hai', '吳美霞姊妹', 'F', '+852', '44445555', NOW(), '');


insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 1, 1, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 2, 2, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 3, 3, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 4, 4, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 5, 5, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 6, 6, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 7, 7, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 1, 8, 8, NOW() );

/*
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 1, '2018-12-02', '早堂', '', NOW() ); 
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 2, '2018-12-02', '午堂', '', NOW() );
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 3, '2018-12-09', '早堂', '', NOW() );
insert into Worship ( worship_id, date, type, remark, created_date ) values ( 4, '2018-12-09', '午堂', '', NOW() );
*/


insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 9, 'A', '區繼江', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 10, 'C', '陳永傑', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 11, 'C', '趙蘭芬', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 12, 'C', '陳寶蓮', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 13, 'C', '陳燕芳', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 14, 'C', '鄭錦華', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 15, 'F', '樊靜儀', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 16, 'H', '何君慧', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 17, 'H', '何明禮', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 18, 'I', '葉惠芬', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 19, 'L', '李凱名', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 20, 'L', '林少華', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 21, 'L', '梁汝鴻', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 22, 'L', '梁世文', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 23, 'L', '梁詠梅', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 24, 'L', '賴寶伶', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 25, 'L', '梁佩詩', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 26, 'L', '李美娟', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 27, 'L', '李定威', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 28, 'L', '麥光源', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 29, 'N', '吳美玲', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 30, 'N', '伍翠娟', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 31, 'S', '石貴福', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 32, 'S', '施永安', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 33, 'S', '蕭廣鑫', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 34, 'S', '曾敏瑛', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 35, 'T', '謝永南', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 36, 'T', '戴可宜', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 37, 'W', '黃文光', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 38, 'W', '黃麗芬', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 39, 'W', '黃見笑', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 40, 'W', '黃麗霞', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 41, 'W', '黃志雄', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 42, 'W', '黃志勇', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 43, 'Y', '殷寶康', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 44, 'S', '岑靜莊', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 45, 'C', '張蘭盛', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 46, 'L', '李綺年', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 47, 'C', '張裕發', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 48, 'C', '陳明華', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 49, 'C', '張志安', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 50, 'Y', '任亮斌', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 51, 'A', '歐綺蓮', NOW() );


insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 9, 1, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 10, 2, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 11, 3, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 12, 4, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 13, 5, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 14, 6, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 15, 7, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 16, 8, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 17, 9, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 18, 10, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 19, 11, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 20, 12, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 21, 13, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 22, 14, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 23, 15, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 24, 16, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 25, 17, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 26, 18, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 27, 19, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 28, 20, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 29, 21, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 30, 22, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 31, 23, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 32, 24, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 33, 25, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 34, 26, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 35, 27, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 36, 28, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 37, 29, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 38, 30, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 39, 31, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 40, 32, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 41, 33, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 42, 34, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 43, 35, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 44, 36, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 45, 37, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 46, 38, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 47, 39, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 48, 40, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 49, 41, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 50, 42, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 2, 51, 43, NOW() );


insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 52,'C','陳玉珍', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 53,'C','陳有妹', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 54,'C','張萬鳳', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 55,'C','周五妹', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 56,'C','莊耀珠', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 57,'C','陳惠蓮', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 58,'H','何鍚源', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 59,'L','李九妹', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 60,'L','劉瓊芳', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 61,'L','劉桂芬', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 62,'L','梁笑玲', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 63,'N','伍自勵', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 64,'N','吳佩鳳', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 65,'S','薛鳳怡', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 66,'S','蘇香', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 67,'T','戴裕德', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 68,'W','王玉蘭', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 69,'W','王潔英', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 70,'Y','楊兆冬', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 71,'L','梁慧明', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 72,'T','鄧美卿', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 73,'W','胡天懷', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 74,'S','薛杏蘭', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 75,'L','李蘭', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 76,'C','蔡秀月', NOW() );
insert into User ( user_id, name_en, `name_zh-hk`, created_date ) values ( 77,'W','黃藯慈', NOW() );

insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,52,1, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,53,2, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,54,3, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,55,4, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,56,5, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,57,6, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,58,7, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,59,8, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,60,9, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,61,10, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,62,11, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,63,12, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,64,13, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,65,14, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,66,15, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,67,16, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,68,17, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,69,18, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,70,19, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,71,20, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,72,21, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,73,22, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,74,23, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,75,24, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,76,25, NOW() );
insert into Group_Member ( group_id, user_id, group_seq_num, created_date ) values ( 3,77,26, NOW() );