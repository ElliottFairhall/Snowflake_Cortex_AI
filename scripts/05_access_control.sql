-- =============================================================================
-- 05_ACCESS_CONTROL
-- =============================================================================
-- Purpose:    Configure governance and access for AI Functions
-- =============================================================================

-- 1. Grant AI function access to a specific role
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE analyst;
GRANT USE AI FUNCTIONS ON ACCOUNT TO ROLE analyst;
