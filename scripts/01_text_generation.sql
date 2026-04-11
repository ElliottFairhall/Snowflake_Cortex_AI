-- =============================================================================
-- 01_TEXT_GENERATION
-- =============================================================================
-- Purpose:    Demonstrate AI_COMPLETE for text generation and summarisation
-- =============================================================================

-- 1. Simple text generation
SELECT AI_COMPLETE('llama3.1-70b', 'Explain the benefits of Snowflake Dynamic Tables in two sentences.');

-- 2. Process a column of data (Example using a hypothetical feedback table)
/*
SELECT
    customer_id,
    feedback_text,
    AI_COMPLETE(
        'llama3.1-70b',
        'Summarise the following customer feedback in one sentence: ' || feedback_text
    ) AS feedback_summary
FROM customer_feedback
LIMIT 10;
*/
