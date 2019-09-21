SELECT COUNT(DISTINCT item_no) as distinct_item_no,
	COUNT(DISTINCT item_description) as descrete_product_names,
	COUNT(DISTINCT bottle_size) as unique_bottle_sizes,
	COUNT(DISTINCT pack) as distinct_pack_increments,
	COUNT(DISTINCT inner_pack) as unique_inner_pack_configurations
FROM products;