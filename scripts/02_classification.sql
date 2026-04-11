-- =============================================================================
-- 02_CLASSIFICATION
-- =============================================================================
-- Purpose:    Demonstrate AI_CLASSIFY for zero-shot categorization
-- =============================================================================

-- 1. Classify support tickets by category (Example)
/*
SELECT
    ticket_id,
    ticket_text,
    AI_CLASSIFY(
        ticket_text,
        ['Billing', 'Technical Issue', 'Feature Request', 'Account Access', 'General Enquiry']
    ) AS ticket_category
FROM support_tickets;
*/

-- 2. Multi-label classification
SELECT
    AI_CLASSIFY(
        'I need help resetting my password and also have a billing question',
        ['Billing', 'Technical Issue', 'Account Access'],
        { 'output_mode': 'multi' }
    ) AS categories;
