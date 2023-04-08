create view admin.vw_owner_auctions as 
select
a.id as id,
a.organizer_id as organizer_id,
a.title as title,
a.description as description,
(a.participants_number||'/'||a.max_participants) as participants_num,
(a.starts_at ||' - '|| a.ends_at) as auctions_dates
from tb_auctions a;


create view admin.vw_auction_lots as
select
l.id as id,
l.auction_id as auction_id,
l.title as title,
l.description as description,
l.start_price as start_price,
l.params as params
from tb_lots l;



create view admin.vw_users_info as
select
u.id, 
u.full_name as full_name,
u.email as email
from tb_users u;

create or replace view admin.vw_participants_list as
select 
p.auction_id as auction_id,
u.id as user_id,
u.full_name as full_name
from tb_participants p, admin.vw_users_info u
where p.user_id=u.id;


create table admin.tb_dict_approve_require(
    id integer,
    p_name text
);

insert into admin.tb_dict_approve_require (id, p_name) values (0, 'No approve required'), (1, 'Approve required');

create table admin.tb_dict_approve_status(
    id integer,
    p_name text
);

insert into admin.tb_dict_approve_status (id, p_name) values (0, 'Not approved'), (1, 'Approved');

create table admin.tb_dict_enter_fee_require(
    id integer,
    p_name text
);

insert into admin.tb_dict_enter_fee_require (id, p_name) values (0, 'Enter fee not required'), (1, 'Enter fee required');

create table admin.tb_dict_enter_fee_status(
    id integer,
    p_name text
);

insert into admin.tb_dict_enter_fee_status (id, p_name) values (0, 'Enter fee not payed'), (1, 'Enter fee payed');

create view admin.vw_attempt_requests as
select 
ar2.id as id,
ar2.auction_id as auction_id,
appr_req.p_name ||  case when ar1.approve_required=1 then appr_req.p_name || appr_status.p_name else '' end as approve,
fee_req.p_name || case when ar1.enter_fee_required=1 then fee_stat.p_name else '' end as enter_fee
from
tb_attempt_requirements ar1,
tb_attempt_requests ar2,
admin.tb_dict_approve_require appr_req,
admin.tb_dict_approve_status appr_status,
admin.tb_dict_enter_fee_require fee_req,
admin.tb_dict_enter_fee_status fee_stat
where 
ar1.auction_id=ar2.auction_id and
ar1.approve_required=appr_req.id and
ar2.approved=appr_status.id and
ar1.enter_fee_required=fee_req.id and
ar2.enter_fee_payed=fee_stat.id
;