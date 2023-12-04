CREATE OR REPLACE TABLE `<<PROYECT_ID>>.<<DATASET_ID>>.reviews_p`
PARTITION BY DATE_TRUNC(date, MONTH)
AS
SELECT *
FROM `<<PROYECT_ID>>.<<DATASET_ID>>.reviews`;


select count(1)
from `<<PROYECT_ID>>.<<DATASET_ID>>.reviews_p`
WHERE
  EXTRACT(YEAR FROM DATE_TRUNC(date, MONTH)) = 2023
  AND EXTRACT(MONTH FROM DATE_TRUNC(date, MONTH)) = 1;



CREATE OR REPLACE TABLE `<<PROYECT_ID>>.<<DATASET_ID>>.reviews_pc`
PARTITION BY DATE_TRUNC(date, MONTH)
CLUSTER BY listing_id
  OPTIONS (require_partition_filter = TRUE)
AS
SELECT *
FROM `<<PROYECT_ID>>.<<DATASET_ID>>.reviews`;


select count(1)
from `<<PROYECT_ID>>.<<DATASET_ID>>.reviews_pc`
WHERE
  EXTRACT(YEAR FROM DATE_TRUNC(date, MONTH)) = 2023
  AND EXTRACT(MONTH FROM DATE_TRUNC(date, MONTH)) = 1;