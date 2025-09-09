select sentiment, COUNT(*) as count
FROM sentiments
group by sentiment;

create table sentiment_summary (
sentiment_type varchar (10),
sentiment_count int
);

insert into sentiment_summary (sentiment_type, sentiment_count)
select sentiment, COUNT(*) as count
FROM sentiments
group by sentiment;

select *
from sentiment_summary;

select sum(sentiment_count) as total
from sentiment_summary;

alter table sentiment_summary
add column percentage decimal(5,2);

update sentiment_summary
set percentage= (sentiment_count /2863) *100;


