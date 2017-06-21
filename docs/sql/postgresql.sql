create table escrituracao (
	id integer primary key,
	nome varchar(20) not null
);

create table nota (
	id integer primary key,
	descricao varchar(20) not null,
	escrit_id integer references escrituracao (id)
)

create table item (
	id integer primary key,
	nome varchar(20) not null,
	preco numeric(10,2),
	desconto numeric(10,2),
	nota_id integer references nota (id)
)

create table alimenticio (
	id integer primary key,
	nome varchar(20),
	item_id integer references item (id)
)

create table vestuario (
	id integer primary key,
	nome varchar(20),
	item_id integer references item (id)
)

create table veicular (
	id integer primary key,
	nome varchar(20),
	item_id integer references item (id)
)

insert into escrituracao values (1, 'nome1');
insert into escrituracao values (2, 'nome2');
insert into escrituracao values (3, 'nome3');
insert into escrituracao values (4, 'nome4');
insert into escrituracao values (5, 'nome5');

insert into nota values (1, 'desc1', 1);
insert into nota values (2, 'desc2', 1);
insert into nota values (3, 'desc3', null);
insert into nota values (4, 'desc4', null);
insert into nota values (5, 'desc5', 2);
insert into nota values (6, 'desc6', 2);
insert into nota values (7, 'desc7', 2);
insert into nota values (8, 'desc8', null);
insert into nota values (9, 'desc9', 3);

insert into item values (1, 'nome01', 2.15, 1.15, 1);
insert into item values (2, 'nome02', 4.20, 0.25, 1);
insert into item values (3, 'nome03', 1.02, 0.22, null);
insert into item values (4, 'nome04', 2.05, 0.20, 2);
insert into item values (5, 'nome05', 2.05, 0.20, 2);
insert into item values (6, 'nome06', 5.05, 4.35, 2);
insert into item values (7, 'nome07', 9.85, 0.50, null);
insert into item values (8, 'nome08', 12.80, 9.50, 4);
insert into item values (9, 'nome09', 8.75, 0.75, 4);
insert into item values (10, 'nome10', 10.45, 0.40, 5);
insert into item values (11, 'nome11', 11.30, 2.60, 5);
insert into item values (12, 'nome12', 12.50, 4.30, null);
insert into item values (13, 'nome13', 21.30, 12.40, 6);
insert into item values (14, 'nome14', 15.50, 12.50, 7);
insert into item values (15, 'nome14', 30.50, 30.00, 7);

insert into alimenticio values (1, 'alim1', 1);
insert into alimenticio values (2, 'alim2', 4);
insert into alimenticio values (3, 'alim3', 9);
insert into alimenticio values (4, 'alim4', 14);

insert into vestuario values (1, 'vest1', 2);
insert into vestuario values (2, 'vest2', 5);
insert into vestuario values (3, 'vest3', 10);
insert into vestuario values (4, 'vest4', 15);

insert into veicular values (1, 'veic1', 6);
insert into veicular values (2, 'veic2', 8);
insert into veicular values (3, 'veic3', 11);
insert into veicular values (4, 'veic4', 13);

select i.id, 
	sum(x1.soma_alimenticios) soma_alimenticios, 
	sum(x2.soma_vestuarios) soma_vestuarios, 
	sum(x3.soma_veiculares) soma_veiculares
from item i
left join (
		select ii.id, sum(ii.preco-ii.desconto) soma_alimenticios
		from item ii
		join alimenticio a on a.item_id = ii.id
		group by ii.id) x1 on x1.id = i.id
left join (
		select ii.id, sum(ii.preco-ii.desconto) soma_vestuarios
		from item ii
		join vestuario v on v.item_id = ii.id
		group by ii.id) x2 on x2.id = i.id
left join (
		select ii.id, sum(ii.preco-ii.desconto) soma_veiculares
		from item ii
		join veicular ve on ve.item_id = ii.id
		group by ii.id) x3 on x3.id = i.id
group by i.id
order by i.id















