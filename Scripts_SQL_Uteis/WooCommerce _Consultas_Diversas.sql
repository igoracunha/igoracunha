/****************************** SCRIPTS ÚTEIS PARA WOOCOMMERCE - WORDPRESS ******************************/


/****************************** CONSULTA DE PRODUTOS COM PREÇO PROMOCIONAL COM LINKS ******************************/
SELECT product.ID
	,product.post_title
	,prices.meta_value price
	,sales.meta_value sale
	,product.post_excerpt
	,product.post_content
	,product.guid link
	,IMAGE.guid foto
FROM `cVlRFQ_posts` product
LEFT JOIN `cVlRFQ_postmeta` sales ON sales.meta_key = '_sale_price'
	AND sales.post_id = product.ID
LEFT JOIN `cVlRFQ_postmeta` prices ON prices.meta_key = '_regular_price'
	AND prices.post_id = product.ID
LEFT JOIN (
	SELECT CASE 
			WHEN INSTR(meta_value, ",") > 0
				THEN SUBSTRING(meta_value, 1, (INSTR(meta_value, ",") - 1))
			ELSE meta_value
			END meta_value
		,prod2.guid
		,p.post_id ID
	FROM `cVlRFQ_postmeta` p
	INNER JOIN `cVlRFQ_posts` prod2 ON prod2.ID = (
			CASE 
				WHEN INSTR(meta_value, ",") > 0
					THEN SUBSTRING(meta_value, 1, (INSTR(meta_value, ",") - 1))
				ELSE meta_value
				END
			)
	WHERE meta_key IN ('_thumbnail_id')
	) IMAGE ON IMAGE.ID = product.ID
WHERE product.post_type = 'product'
	AND COALESCE(sales.meta_value, '') <> '';
/******************************************************************************************************************/

/****************************** CONSULTA DAS CATEGORIAS DE PRODUTOS PAI ******************************/
SELECT *
FROM `cVlRFQ_terms` terms
INNER JOIN `cVlRFQ_term_taxonomy` tax ON tax.term_id = terms.term_id
WHERE tax.taxonomy = 'product_cat'
	AND tax.parent = 0
	AND tax.count <> 0;
/******************************************************************************************************************/

/****************************** CONSULTA DE PRODUTOS COM PESO ZERADO ******************************/
SELECT product.ID
	,product.post_title
FROM `cVlRFQ_posts` product
INNER JOIN `cVlRFQ_postmeta` weight ON weight.meta_key = '_weight'
	AND weight.post_id = product.ID
INNER JOIN `cVlRFQ_wc_product_meta_lookup` stock ON stock.product_id = product.ID
WHERE product.post_type = 'product'
	AND weight.meta_value = '0.000'
AND stock.stock_status = 'instock';
/******************************************************************************************************************/
