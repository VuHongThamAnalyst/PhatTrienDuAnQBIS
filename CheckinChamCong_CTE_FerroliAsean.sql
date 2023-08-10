
WITH CTE_Dates AS (
SELECT convert(datetime,'01/12/2022',103) AS Date --chuyen doi kieu du lieu
UNION ALL
SELECT DATEADD(day, 1, Date)
FROM CTE_Dates
WHERE Date < convert(datetime,'31/12/2022',103)
)
SELECT  
CASE DATEPART(WEEKDAY, CTE_Dates.Date)
WHEN '1' THEN 'CN'
WHEN '2' THEN 'T2'
WHEN '3' THEN 'T3'
WHEN '4' THEN 'T4'
WHEN '5' THEN 'T5'
WHEN '6' THEN 'T6'
ELSE 'T7'
END AS THU,
convert(varchar,	DATEPART(DAY, CTE_Dates.Date)) STT_NGAY,
* FROM CTE_Dates
	
	
LEFT JOIN (
		
		
SELECT YEU_CAU.NGAY_TAO , YEU_CAU.NGUOI_TAO MA_NHAN_VIEN, YEU_CAU.NGUOI_TAO showNguoiTaoField0882874857,
NGUOI_DUNG.TEN_DAY_DU TEN_NHAN_VIEN,
convert(varchar,YEU_CAU.NGAY_TAO,103) NGAY_THANG,

		
YEU_CAU.KT1 GIO_VAO,
YEU_CAU.KT2 DIA_DIEM_VAO,
YEU_CAU.KT4 GIO_RA,
YEU_CAU.KT5 DIA_DIEM_RA,
YEU_CAU.KT6 GIO_VAO_1,
YEU_CAU.KT7 DIA_DIEM_VAO_1,
YEU_CAU.KT8 GIO_RA_1,
YEU_CAU.KT9 GIO_TRE,
YEU_CAU.KT10 GIO_SOM,
YEU_CAU.KT11 TONG_GIO,
CASE WHEN	dbo.convertnumeric(YEU_CAU.KT11) > 7 THEN 1 ELSE 0 END number0882872352,
CASE WHEN	dbo.convertnumeric(YEU_CAU.KT11) > 7 THEN '1' ELSE '0' END CONG

FROM SL_OBJECT YEU_CAU 
					  
JOIN (SELECT * FROM HT_NGUOIDUNG WHERE MA_DVSDTS = '022665038727' ) NGUOI_DUNG ON NGUOI_DUNG.TEN_DANG_NHAP = YEU_CAU.NGUOI_TAO


WHERE YEU_CAU.FUNCTION_ID_INDEX = '004088287079' and YEU_CAU.MA_DVSDTS  = '022665038727'	  			  						   		  
AND dbo.convertdatetime_date(convert(varchar, YEU_CAU.NGAY_TAO,103))  <= CONVERT(DATETIME,'31/12/2022',103)
AND dbo.convertdatetime_date(convert(varchar, YEU_CAU.NGAY_TAO,103))   >= CONVERT(DATETIME,'01/12/2022',103)
AND YEU_CAU.ATTR5 = ''  AND YEU_CAU.ATTR1 = '2' AND YEU_CAU.KT11 <> ''
ORDER BY YEU_CAU.NGAY_TAO ASC

) BANG_CHAM_CONG ON convert(datetime, convert(varchar, BANG_CHAM_CONG.NGAY_TAO, 103), 103) = CTE_Dates.Date
