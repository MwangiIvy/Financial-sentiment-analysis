create table sentiments as
select date, market_event, market_index, index_change_percent, trading_volume, sentiment, sector, impact_level, related_company
from financial_news_events;

select
case
when market_index in ('S&P 500', 'Dow Jones', 'Nasdaq Composite', 'Russell 2000') then 'US markets'
when market_index in ('NSE', 'Nitfy', 'BSE Sensex') then 'Indian markets'
when market_index in ('FTSE 100', 'DAX', 'Euro Stoxx 50', 'CAC 40') then 'European markets'
when market_index in ('Nikkei 225', 'Hang Seng', 'Shanghai Composite', 'KOSPI') then 'Asian markets'
else 'other market'
end as market_index
from  sentiments;

alter table sentiments
add column market_region varchar(50);

update sentiments
set market_region =case
when market_index in ('S&P 500', 'Dow Jones', 'Nasdaq Composite', 'Russell 2000') then 'US markets'
when market_index in ('NSE', 'Nitfy', 'BSE Sensex') then 'Indian markets'
when market_index in ('FTSE 100', 'DAX', 'Euro Stoxx 50', 'CAC 40') then 'European markets'
when market_index in ('Nikkei 225', 'Hang Seng', 'Shanghai Composite', 'KOSPI') then 'Asian markets'
else 'other market'
end
where market_region is NULL;
