declare @mytbl table(
id int not null,
[name] nvarchar(max) not null
)
declare @mytbl2 table(id int not null,
[name] nvarchar(max) not null)

insert into @mytbl values('1','Umair');
insert into @mytbl values('2','Ali');
insert into @mytbl values('3','Rahman');
insert into @mytbl values('4','Asgher');
insert into @mytbl values('5','Asgher');

insert into @mytbl2 values('1','A+');
insert into @mytbl2 values('2','A');
insert into @mytbl2 values('3','A+');
insert into @mytbl2 values('4','B+');
insert into @mytbl2 values('5','B');

select ROW_NUMBER() over(Partition By t1.name order by t1.name) as sr, t.id,UPPER(t.name) as name_,t1.name as Grade from @mytbl as t
inner join @mytbl2 t1 on  t.id=t1.id

select Rank() over(Partition By t1.name order by t1.name) as sr, t.id,UPPER(t.name) as name_,t1.name as Grade from @mytbl as t
inner join @mytbl2 t1 on  t.id=t1.id
