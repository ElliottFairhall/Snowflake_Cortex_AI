-- =============================================================================
-- 05_ACCESS_CONTROL
-- =============================================================================
-- Purpose:    Configure governance and access for AI Functions
-- =============================================================================

-- 1. Grant AI function access to a specific role.
-- Both are granted to PUBLIC by default, so this is only needed if your account has revoked them. Snowflake documents
-- that ACCOUNTADMIN must manage the USE AI FUNCTIONS privilege, so an administrator runs these two statements; they are
-- not a step for the tutorial role. CORTEX_TUTORIAL_ROLE is created by 00_setup_environment.sql.
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE CORTEX_TUTORIAL_ROLE;
GRANT USE AI FUNCTIONS ON ACCOUNT TO ROLE CORTEX_TUTORIAL_ROLE;  -- noqa: PRS
