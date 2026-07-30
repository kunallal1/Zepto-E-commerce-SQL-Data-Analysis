-- Products with invalid pricing
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;

-- Remove invalid products
DELETE FROM zepto
WHERE mrp = 0;

-- Convert prices from paise to rupees
UPDATE zepto
SET
    mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

-- Verify updated prices
SELECT
    mrp,
    discountedSellingPrice
FROM zepto;