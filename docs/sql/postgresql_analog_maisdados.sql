-- drop

drop table if exists item cascade;
drop table if exists verde cascade;
drop table if exists vermelho cascade;
drop table if exists amarelo cascade;

-- Criação

create table item (
	id bigint primary key,
	valor double precision not null,
	dummy char(1000)
);

create table verde (
	id bigint primary key,
	item_id bigint references item (id)
);

create table vermelho (
	id bigint primary key,
	item_id bigint references item (id)
);

create table amarelo (
	id bigint primary key,
	item_id bigint references item (id)
);

-- População

insert into item
select generate_series, random()*100, 'x'
from generate_series(1, 1000000);

insert into verde 
select generate_series, generate_series
from generate_series(1,200000);

insert into vermelho 
select generate_series, generate_series
from generate_series(200001,500000);

insert into amarelo 
select generate_series, generate_series
from generate_series(500001,900000);

select i.id, i.valor, vr.id verde, vm.id vermelho, a.id amarelo
from item i
left join verde vr on vr.item_id = i.id
left join vermelho vm on vm.item_id = i.id
left join amarelo a on a.item_id = i.id
order by i.id

-- Query

select sum(c1.verdes) verdes, sum(c2.vermelhos) vermelhos, sum(c3.amarelos) amarelos
from item i
left join (
	select ii.id, sum(ii.valor) verdes
	from item ii
	join verde v on v.item_id = ii.id
	group by ii.id) c1 on c1.id = i.id
left join (
	select ii.id, sum(ii.valor) vermelhos
	from item ii
	join vermelho v on v.item_id = ii.id
	group by ii.id) c2 on c2.id = i.id
left join (
	select ii.id, sum(ii.valor) amarelos
	from item ii
	join amarelo a on a.item_id = ii.id
	group by ii.id) c3 on c3.id = i.id

--  Tentando fazer a query de forma diferente

select 
	sum(case when vd.id is not null then i.valor else 0 end) verdes,
	sum(case when vm.id is not null then i.valor else 0 end) vermelhos,
	sum(case when a.id is not null then i.valor else 0 end) amarelos
from item i
left join verde vd on vd.item_id = i.id
left join vermelho vm on vm.item_id = i.id
left join amarelo a on a.item_id = i.id


/*
Sem indices:
antigo:		cost: 618086.77		time:	4184.059
novo:		cost: 249675.18		time:	3813.742
*/

create index idx_verde_itemid on verde (item_id);
create index idx_vermelho_itemid on vermelho (item_id);
create index idx_amarelo_itemid on amarelo (item_id);

/*
Com indices:
antigo:		cost: 533566.71		time:	34593.221
novo:		cost: 223368.87		time:	2258.474
*/