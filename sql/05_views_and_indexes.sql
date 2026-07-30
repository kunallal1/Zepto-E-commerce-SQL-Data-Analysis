-- View: Revenue by Category
CREATE OR REPLACE VIEW revenue_by_category AS
SELECT
    category,
    SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category;

-- View: Out of Stock Products
CREATE OR REPLACE VIEW out_of_stock_products AS
SELECT
    sku_id,
    name,
    category,
    mrp
FROM zepto
WHERE outOfStock = TRUE;

-- Index for category
CREATE INDEX idx_category
ON zepto(category);

-- Index for product name
CREATE INDEX idx_product_name
ON zepto(name);

-- Index for MRP
CREATE INDEX idx_mrp
ON zepto(mrp);