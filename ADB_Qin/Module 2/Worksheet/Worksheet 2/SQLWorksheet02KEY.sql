-- NOTE: When completed, you should be able to run this file
-- as a script. See more detailed instructions below.

-- For each solution you submit, whether an SQL statement or a 
-- written response, hard-code line feeds by pressing Enter for 
-- a new line.
-- Line length should not exceed 70 characters; your page must
-- print without any of the lines wrapping.

-- Problem 5:
select v_areacode, count(v_code) 
from vendor
group by v_areacode;

-- Problem 6:
select v_areacode, count(v_code) 
from vendor
group by v_areacode
having count(v_code) >  2;

-- Problem 7:
select v_state, count(v_code) as "Vendor Count"
from vendor
group by v_state;

-- Problem 8:
select v_state, count(v_code) as "Vendor Count"
from vendor
group by v_state
having v_state in ('GA', 'KY');

-- Problem 9:
select v_state, count(v_code) as "Vendor Count"
from vendor
group by v_state
having v_state in ('GA', 'KY')
order by count(v_code);

-- Problem 10:
select p_descript, v_name 
from product, vendor
where vendor.v_code = product.v_code;

-- Problem 11:
select p_descript, v_name 
from product p, vendor v
where v.v_code = p.v_code;
