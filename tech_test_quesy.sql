SELECT 
id,
dt_report,
login_hash,
server_hash,
symbol,
currency,
SUM(CASE WHEN dt_report >= DATEADD(d, -7, GETDATE()) THEN volume END) AS sum_volume_prev_7d,
SUM(volume) AS sum_volume_prev_all,
DENSE_RANK() OVER   
    (PARTITION BY sum_volume_prev_7d ORDER BY login_hash, symbol DESC) AS rank_volume_symbol_prev_7d,
SUM(CASE WHEN dt_report between '2020/08/01' and '2020/08/30' THEN volume END) AS sum_volume_2020_08,
date_first_trade,
ROW_NUMBER() OVER(ORDER BY name ASC) AS num_row
FROM Trade t INNER JOIN User u on t.login_hash=u.login_hash
WHERE u.isAccountEnabled =true
ORDER BY rum_number DESC
GROUP BY dt_report, volume;