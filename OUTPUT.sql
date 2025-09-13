create table pan_nos( pan_number text );

select * from pan_nos;

select * from pan_nos where pan_number is null;

select pan_number,count(1) from pan_nos group by pan_number having count(1)>1;

select * from pan_nos where pan_number <> trim(pan_number);

select * from pan_nos where pan_number <> upper(pan_number);

select distinct upper(trim(pan_number)) as pan_number from pan_nos where pan_number is not null and trim(pan_number)<>'';


create or replace function check_adjacent_characters(str text)
returns boolean
language plpgsql
as $$
begin
for i in 1 .. (length(str)-1)
loop
if substring(str,i,1)=substring(str,i+1,1)
then
return true;
end if;
end loop;
return false;
end;
$$

select check_adjacent_characters('BAFDQ')


create or replace function check_sequential_characters(str text)
returns boolean
language plpgsql
as $$
begin
for i in 1 .. (length(str)-1)
loop
if ascii(substring(str,i+1,1))-ascii(substring(str,i,1))<>1
then
return false;
end if;
end loop;
return true;
end;
$$

select check_sequential_characters('AXDGE')

select * from pan_nos where pan_number ~ '^[A-Z]{5}[0-9]{4}[A-Z]$'

create or replace view vw_valid_invalid_pans
as
with cte_cleaned_pan as
(
select distinct upper(trim(pan_number)) as pan_number from pan_nos where pan_number is not null and trim(pan_number)<>''
),
cte_valid_pan as
(
select * from cte_cleaned_pan
where check_adjacent_characters(pan_number)=false
and check_sequential_characters(substring(pan_number,1,5))=false
and check_sequential_characters(substring(pan_number,6,4))=false
and pan_number ~ '^[A-Z]{5}[0-9]{4}[A-Z]$'
)
select cln.pan_number,case when vld.pan_number is not null then 'Valid PAN' else 'Invalid PAN' end as status from cte_cleaned_pan cln left join cte_valid_pan vld on vld.pan_number = cln.pan_number;


select * from vw_valid_invalid_pans

--Summary
with cte as
(select (select count(*) from pan_nos) as total_processed_records,
count(*) filter (where status='Valid PAN') as total_valid_pans,
count(*) filter (where status='Invalid PAN') as total_invalid_pans
from vw_valid_invalid_pans)
select total_processed_records,total_valid_pans,total_invalid_pans,(total_processed_records-(total_valid_pans+total_invalid_pans)) as total_missing_pans from cte;