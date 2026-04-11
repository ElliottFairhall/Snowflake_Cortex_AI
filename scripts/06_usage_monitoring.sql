-- =============================================================================
-- 06_USAGE_MONITORING
-- =============================================================================
-- Purpose:    Monitor credit consumption for AI Functions
-- =============================================================================

-- 1. Track AI function credit consumption
SELECT *
FROM SNOWFLAKE.ACCOUNT_USAGE.CORTEX_FUNCTIONS_USAGE_HISTORY
ORDER BY START_TIME DESC
LIMIT 20;
