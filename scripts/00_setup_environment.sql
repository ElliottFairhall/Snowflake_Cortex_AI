-- =============================================================================
-- 00_SETUP_ENVIRONMENT
-- =============================================================================
-- Purpose:    Provision the necessary databases, schemas, and sample data
--             required to execute the Cortex AI tutorial scripts.
-- =============================================================================

USE ROLE SYSADMIN;
CREATE DATABASE IF NOT EXISTS CORTEX_TUTORIAL_DB;
CREATE SCHEMA IF NOT EXISTS CORTEX_TUTORIAL_DB.PUBLIC;
USE SCHEMA CORTEX_TUTORIAL_DB.PUBLIC;

-- 1. Create and populate Customer Feedback for Text Generation/Summarisation
CREATE OR REPLACE TABLE customer_feedback (
    customer_id INT,
    feedback_text VARCHAR
);

INSERT INTO customer_feedback (customer_id, feedback_text) VALUES
    (101, 'The new dashboard is fantastic and runs so much faster than the old version. However, the export button is hard to find.'),
    (102, 'I am very frustrated because my login keeps failing and support hasn''t replied in 3 days.'),
    (103, 'Great product overall, but the pricing page needs to be much clearer about enterprise limits.');

-- 2. Create and populate Support Tickets for Classification
CREATE OR REPLACE TABLE support_tickets (
    ticket_id INT,
    ticket_text VARCHAR
);

INSERT INTO support_tickets (ticket_id, ticket_text) VALUES
    (5001, 'I need help resetting my password and also have a billing question regarding last month''s invoice.'),
    (5002, 'Can you please add a dark mode feature? It would really help with eye strain late at night.'),
    (5003, 'The application crashes every time I try to run the quarterly financial report.');

-- 3. Create and populate Product Reviews for Sentiment Analysis
CREATE OR REPLACE TABLE product_reviews (
    review_id INT,
    review_text VARCHAR
);

INSERT INTO product_reviews (review_id, review_text) VALUES
    (9001, 'This is absolutely the best data platform I have ever used. Highly recommend!'),
    (9002, 'Terrible experience. The documentation is extremely confusing and nothing works as expected.'),
    (9003, 'It gets the job done, but nothing spectacular. Meh.');

-- Ensure the role executing the AI functions has the required access
-- Note: Replace 'ACCOUNTADMIN' with a standard functional role in production
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE ACCOUNTADMIN;
GRANT USE AI FUNCTIONS ON ACCOUNT TO ROLE ACCOUNTADMIN;
