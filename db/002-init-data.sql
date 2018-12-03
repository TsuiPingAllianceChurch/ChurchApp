USE tpac_db;

insert into User ( name_en, `name_zh-hk`, created_date ) values ( 'Chan Tai Man', '陳大文', NOW() );
insert into User ( name_en, `name_zh-hk`, created_date ) values ( 'You Tai Man', '游大文', NOW() );
insert into User ( name_en, `name_zh-hk`, created_date ) values ( 'Wong Tai Man', '王大文', NOW() );


insert into `Group` ( type, name_en, `name_zh-hk`, created_date ) values ( '團契', '', '馬利亞團', NOW() );
insert into `Group` ( type, name_en, `name_zh-hk`, created_date ) values ( '團契', '', '雅各團', NOW() );
insert into `Group` ( type, name_en, `name_zh-hk`, created_date ) values ( '團契', '', '安得烈團', NOW() );
insert into `Group` ( type, name_en, `name_zh-hk`, created_date ) values ( '團契', '', '所羅門團', NOW() );


insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 1, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 1, 2, NOW() );
insert into Group_Member ( group_id, user_id, created_date ) values ( 2, 3, NOW() );


insert into Worship ( date, type, remark, created_date ) values ( '2018-12-02', '早堂', '', NOW() );
insert into Worship ( date, type, remark, created_date ) values ( '2018-12-02', '午堂', '', NOW() );



