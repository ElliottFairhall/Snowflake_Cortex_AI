-- =============================================================================
-- 03_EXTRACTION
-- =============================================================================
-- Purpose:    Demonstrate AI_EXTRACT for structured information retrieval
-- =============================================================================

-- 1. Extract entities from an email string
SELECT AI_EXTRACT(
    'Hi, my name is James Smith and my order number is ORD-12345. Please deliver to 10 Downing Street, London.',
    { 'customer_name': 'VARCHAR', 'order_number': 'VARCHAR', 'delivery_address': 'VARCHAR' }
) AS extracted_data;

-- 2. Extract from staged documents (Placeholder)
-- SELECT AI_EXTRACT(
--     TO_FILE('@my_docs_stage', 'invoice_001.pdf'),
--     {'invoice_number': 'VARCHAR', 'total_amount': 'NUMBER', 'due_date': 'DATE'}
-- ) AS invoice_data;
