
---begin: Lấy ra Lead time theo từng group trong tháng 8 và số booking của từng group
Select  DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103)) AS LEAD_TIME, COUNT(*) SO_BOOKING ,
convert(numeric(18,2), COUNT(*))/convert(numeric(18,2), '66') TY_LE ,
DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103)) *convert(numeric(18,2), COUNT(*))/convert(numeric(18,2), '66') lt
FROM SL_OBJECT AS DON_HANG_BOOKING 
WHERE FUNCTION_ID = '004M088287011' AND MA_DVSDTS = '088287048363' AND ATTR6 = '30925032' AND NGAY_TAO >= convert(datetime, '01/08/2022', 103) AND NGAY_TAO <= convert(datetime, '31/08/2022', 103)
AND ATTR86 IN ( 'Completed', 'Vouchered')
GROUP BY DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103))
--end


--- begin: Tính tổng số lượng booking trong tháng 
SELECT SUM(SO_BOOKING) AS TONG_BKG_T8 FROM (
Select  DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103)) AS LEAD_TIME, COUNT(*) SO_BOOKING FROM SL_OBJECT AS DON_HANG_BOOKING 
WHERE FUNCTION_ID = '004M088287011' AND MA_DVSDTS = '088287048363' AND ATTR6 = '30925032' AND convert(datetime,convert(varchar, NGAY_TAO,103),103) >= convert(datetime, '01/09/2022', 103) 
AND convert(datetime,convert(varchar, NGAY_TAO,103),103) <= convert(datetime, '30/09/2022', 103)
AND ATTR86 IN ( 'Completed', 'Vouchered')
GROUP BY DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103))

) AS BANG_DU_LIEU_LEAD_TIME_THANG_8
--- end


--- Viết lại câu SQL tính số booking trong tháng

SELECT COUNT(*) FROM (
SELECT NGAY_TAO, ATTR25 AS MA_BOOKING FROM SL_OBJECT AS DON_HANG_BOOKING
WHERE FUNCTION_ID = '004M088287011' AND MA_DVSDTS = '088287048363' AND ATTR6 = '30925032' 
AND convert(datetime,convert(varchar,NGAY_TAO,103),103) >= convert(datetime, '01/09/2022', 103)
AND convert(datetime,convert(varchar,NGAY_TAO,103),103) <= convert(datetime, '30/09/2022', 103)
AND ATTR86 IN ('Completed', 'Vouchered')) AS SO_BOOK




--- begin: Tính tỷ lệ = booking theo group/tổng số booking và leadtime_tb = sum lt * ty_le
select sum(lt) as lttt from (

Select  DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103)) AS LEAD_TIME, COUNT(*) SO_BOOKING ,
convert(numeric(18,2), COUNT(*))/convert(numeric(18,2), '233') TY_LE ,

DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103)) *convert(numeric(18,2), COUNT(*))/convert(numeric(18,2), '233') lt
FROM SL_OBJECT AS DON_HANG_BOOKING 
WHERE FUNCTION_ID = '004M088287011' AND MA_DVSDTS = '088287048363' AND ATTR6 = '30925032' AND convert(datetime,convert(varchar, NGAY_TAO,103),103) >= convert(datetime, '01/10/2022', 103) 
AND convert(datetime,convert(varchar, NGAY_TAO,103),103) <= convert(datetime, '31/10/2022', 103)
AND ATTR86 IN ( 'Completed', 'Vouchered')
GROUP BY DATEDIFF(day, NGAY_TAO, convert(datetime, ATTR90, 103)) ) abc 
--- end



