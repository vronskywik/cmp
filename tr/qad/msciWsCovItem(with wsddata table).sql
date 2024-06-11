select v.Date_ as date
              ,count(*) as b
              ,count(w1.Value_) as a
              
              from SDDates_v v left join MS2IdxInfo a3 on v.Code = 283
              Left join  MS2IdxConstmth a1 on a3.MSCICode = a1.MSCICode
              Left join MS2SecInfo a2 
              on a1.SecID = a2.SecID
              Left join Ms2SecPrcmth P1 on P1.SecID = a1.SecID and P1.Date_ = v.Date_
              Left join MS2FxRatemth F1 on F1.ISOCurCode = P1.IsoCurCode and F1.Date_ = v.Date_
              Left Join (Select *, 0 gbl From SecMapX 
              union
              Select *, 1 gbl from GSecMapX)G1
              on G1.VenCode=a1.SecId
              and G1.VenType=48--MSCI2
              and v.Date_  between G1.StartDate and G1.EndDate
             Left Join (Select *, 0 gbl From SecMstrX where Type_ = 1
              union
              Select *, 1 gbl from GSecMstrX where Type_=10)G3
              on G3.SecCode=G1.SecCode
              and G3.gbl=G1.gbl
              Left Join (Select *, 0 gbl From SecMapX 
              union
              Select *, 1 gbl from GSecMapX)G4
              on G4.SecCode=G1.SecCode AND G1.gbl = G4.gbl
              and G4.VenType=10 --WS
              AND G4.Rank = 1
              left join wsinfo ws on ws.code = G4.VenCode
              outer apply (select TOP 1 d.Value_ from wsndata w 
              join wsddata d on d.code = w.code and w.freq = d.freq and w.seq = d.seq and w.year_ = d.year_ and d.item = 5350
              where w.Code = ws.Code and w.item = 8251 and 
              w.seq = 1 and d.Value_ between '2015-01-01' and '2016-01-01') w1
              where v.Date_ between a1.StartDate and isnull (a1.EndDate, '31-dec-2079')
              and v.Date_ between '2015-01-01' and '2016-01-01'
              and a3.MsciCode = 990100
              group by v.Date_
              order by v.Date_
