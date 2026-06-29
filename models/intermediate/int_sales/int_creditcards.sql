WITH source AS (
    SELECT 
        pk_credit_card,
        card_type
    FROM {{ ref('stg_sales_creditcard') }}
),

-- Add a dummy row (ID -1) to represent sales that are not credit card payments
no_card_row AS (
    SELECT
        -1 AS pk_credit_card,
        'Cash/No Card' AS card_type
),

combined AS (
    SELECT * FROM source
    UNION ALL
    SELECT * FROM no_card_row
),

transformed AS (
    SELECT
        pk_credit_card,
        -- Handle null values by labeling them as 'Not Specified'
        COALESCE(card_type, 'Not Specified') AS card_type
    FROM combined
)

SELECT * FROM transformed