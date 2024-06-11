SELECT MS.Name, MP.*
FROM SecMstrX MS
JOIN SecMapx MP
       ON MP.SecCode = MS.SecCode
       AND Type_ = 1 AND Ventype in (2, 3)
WHERE MS.ID = 'toc'
 
SELECT * FROM IBESInfo3 WHERE Code = 14580
SELECT * FROM IBGSInfo3 WHERE Code in (22402, 22821)