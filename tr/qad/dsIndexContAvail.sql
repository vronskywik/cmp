-- list of indices with daily constituents coverage
select * from Ds2IndexList where PermitLevelCode = 'DLY' and IndexListIntCode in (select IndexListIntCode from Ds2ConstDly)

-- list of indices with daily constituents and weight coverage
select * from Ds2IndexList where PermitLevelCode = 'DWT' and IndexListIntCode in (select IndexListIntCode from Ds2ConstDataDly)

-- list of indices with monthly constituents coverage
select * from Ds2IndexList where PermitLevelCode = 'MTH' and IndexListIntCode in (select IndexListIntCode from Ds2ConstMth)

-- list of indices with monthly constituents and weight coverage
select * from Ds2IndexList where PermitLevelCode = 'MWT' and IndexListIntCode in (select IndexListIntCode from Ds2ConstDataMth)