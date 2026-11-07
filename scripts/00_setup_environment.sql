-- =============================================================================
-- 00_SETUP_ENVIRONMENT
-- =============================================================================
-- Purpose:    Provision the necessary databases, schemas, and sample data
--             required to execute the Cortex AI tutorial scripts.
-- =============================================================================

-- WARNING: this script uses CREATE OR REPLACE TABLE as a reset-to-sample-data step. It DROPS and recreates the tables
-- below (CUSTOMER_FEEDBACK, SUPPORT_TICKETS, PRODUCT_REVIEWS) in CORTEX_TUTORIAL_DB.PUBLIC, losing any rows in them.
-- Run it in a scratch account or a clean database only.

-- Role creation belongs to USERADMIN. SYSADMIN inherits the role so it can see and manage what it is granted on.
-- Add your own user with: GRANT ROLE CORTEX_TUTORIAL_ROLE TO USER <your_user>;
USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS CORTEX_TUTORIAL_ROLE;
GRANT ROLE CORTEX_TUTORIAL_ROLE TO ROLE SYSADMIN;

USE ROLE SYSADMIN;
CREATE DATABASE IF NOT EXISTS CORTEX_TUTORIAL_DB;
CREATE SCHEMA IF NOT EXISTS CORTEX_TUTORIAL_DB.PUBLIC;
USE SCHEMA CORTEX_TUTORIAL_DB.PUBLIC;

-- 1. Create and populate Customer Feedback for Text Generation/Summarisation
CREATE OR REPLACE TABLE CUSTOMER_FEEDBACK (
    CUSTOMER_ID INT,
    FEEDBACK_TEXT VARCHAR
);

INSERT INTO CUSTOMER_FEEDBACK (CUSTOMER_ID, FEEDBACK_TEXT) VALUES
    (101, 'The new dashboard is fantastic and runs so much faster than the old version. '
          || 'However, the export button is hard to find.'),
    (102, 'I am very frustrated because my login keeps failing and support hasn''t replied in 3 days.'),
    (103, 'Great product overall, but the pricing page needs to be much clearer about enterprise limits.');

-- 2. Create and populate Support Tickets for Classification
CREATE OR REPLACE TABLE SUPPORT_TICKETS (
    TICKET_ID INT,
    TICKET_TEXT VARCHAR
);

INSERT INTO SUPPORT_TICKETS (TICKET_ID, TICKET_TEXT) VALUES
    (5001, 'I need help resetting my password and also have a billing question regarding last month''s invoice.'),
    (5002, 'Can you please add a dark mode feature? It would really help with eye strain late at night.'),
    (5003, 'The application crashes every time I try to run the quarterly financial report.');

-- 3. Create and populate Product Reviews for Sentiment Analysis
CREATE OR REPLACE TABLE PRODUCT_REVIEWS (
    REVIEW_ID INT,
    REVIEW_TEXT VARCHAR
);

INSERT INTO PRODUCT_REVIEWS (REVIEW_ID, REVIEW_TEXT) VALUES
    (9001, 'This is absolutely the best data platform I have ever used. Highly recommend!'),
    (9002, 'Terrible experience. The documentation is extremely confusing and nothing works as expected.'),
    (9003, 'It gets the job done, but nothing spectacular. Meh.');

-- 4. Give the tutorial role access to the sample data (SYSADMIN owns the objects, so it grants on them)
GRANT USAGE ON DATABASE CORTEX_TUTORIAL_DB TO ROLE CORTEX_TUTORIAL_ROLE;
GRANT USAGE ON SCHEMA CORTEX_TUTORIAL_DB.PUBLIC TO ROLE CORTEX_TUTORIAL_ROLE;
GRANT SELECT ON TABLE CUSTOMER_FEEDBACK TO ROLE CORTEX_TUTORIAL_ROLE;
GRANT SELECT ON TABLE SUPPORT_TICKETS TO ROLE CORTEX_TUTORIAL_ROLE;
GRANT SELECT ON TABLE PRODUCT_REVIEWS TO ROLE CORTEX_TUTORIAL_ROLE;

-- 5. Cortex access. The tutorial states that SNOWFLAKE.CORTEX_USER and USE AI FUNCTIONS are granted to PUBLIC by
-- default, so CORTEX_TUTORIAL_ROLE already inherits them and no ACCOUNTADMIN grant is needed. Do not grant to
-- ACCOUNTADMIN: keep it for account administration only. If your account has revoked these from PUBLIC, grant them to
-- CORTEX_TUTORIAL_ROLE. Snowflake documents that ACCOUNTADMIN must manage the USE AI FUNCTIONS privilege and
-- grants CORTEX_USER, so that is a one-off administrator task, not a step of this tutorial (see
-- scripts/05_access_control.sql).
--
-- To run the tutorial scripts, use the tutorial role and a warehouse you can use:
--   USE ROLE CORTEX_TUTORIAL_ROLE;
