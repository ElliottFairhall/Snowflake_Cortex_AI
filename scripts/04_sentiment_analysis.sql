-- =============================================================================
-- 04_SENTIMENT_ANALYSIS
-- =============================================================================
-- Purpose:    Demonstrate AI_SENTIMENT for quantitative mood tracking
-- =============================================================================

-- 1. Analyse sentiment of product reviews (Example)
/*
SELECT
    review_id,
    review_text,
    AI_SENTIMENT(review_text) AS sentiment_score,
    CASE
        WHEN AI_SENTIMENT(review_text) > 0.3 THEN 'Positive'
        WHEN AI_SENTIMENT(review_text) < -0.3 THEN 'Negative'
        ELSE 'Neutral'
    END AS sentiment_label
FROM product_reviews
ORDER BY sentiment_score ASC
LIMIT 20;
*/
