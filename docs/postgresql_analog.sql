-- Criação

create table item (
	id bigint primary key,
	valor double precision not null
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
select generate_series, random()*100
from generate_series(1,10);

insert into verde 
select generate_series, generate_series
from generate_series(1,2);

insert into vermelho 
select generate_series, generate_series
from generate_series(3,5);

insert into amarelo 
select generate_series, generate_series
from generate_series(6,9);

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
