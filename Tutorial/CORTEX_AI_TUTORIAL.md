# 🚀 Snowflake Cortex AI Functions Tutorial

## 🎯 Learning Objectives

1. 🧠 Understand the concept of Cortex AI Functions and how they enable AI-powered analytics within Snowflake.

2. 🛠️ Master the use of key AI functions including AI_COMPLETE, AI_CLASSIFY, AI_EXTRACT, and AI_SENTIMENT.

3. 🔗 Learn how to process text, images, and documents using built-in LLM capabilities without leaving Snowflake.

## 📚 Table of Contents

- [🚀 Snowflake Cortex AI Functions Tutorial](#-snowflake-cortex-ai-functions-tutorial)
  - [🎯 Learning Objectives](#-learning-objectives)
  - [📚 Table of Contents](#-table-of-contents)
    - [🎉 Introduction](#-introduction)
    - [📝 Introduction to Cortex AI Functions](#-introduction-to-cortex-ai-functions)
    - [🤖 Available AI Functions](#-available-ai-functions)
    - [💬 Text Generation with AI_COMPLETE](#-text-generation-with-ai_complete)
    - [🏷️ Classification with AI_CLASSIFY](#%EF%B8%8F-classification-with-ai_classify)
    - [📄 Extraction with AI_EXTRACT](#-extraction-with-ai_extract)
    - [😊 Sentiment Analysis with AI_SENTIMENT](#-sentiment-analysis-with-ai_sentiment)
    - [🔒 Access Control and Costs](#-access-control-and-costs)
  - [💡 Tutorial](#-tutorial)
  - [🎈 Conclusion](#-conclusion)
  - [📖 Additional Resources](#-additional-resources)
  - [⚠️ Disclaimer](#%EF%B8%8F-disclaimer)

### 🎉 Introduction

Welcome to this tutorial on Snowflake Cortex AI Functions! This tutorial is designed to help you understand and
implement AI-powered analytics directly within your Snowflake environment. By the end of this tutorial, you'll be able
to confidently use AI functions to classify, extract, summarise, translate, and generate text — all using simple SQL.
So, let's dive in! 🏊‍♀️

### 📝 Introduction to Cortex AI Functions

Snowflake Cortex AI Functions provide access to industry-leading large language models (LLMs) from providers such as
Anthropic, Meta, Mistral AI, OpenAI, and DeepSeek — all fully hosted within Snowflake. This means your data never leaves
the platform, ensuring performance, scalability, and governance.

AI Functions are available as SQL functions and can also be called from Python via Snowpark. They support use cases such
as:

- Extracting entities to enrich metadata and streamline validation.
- Aggregating insights across customer tickets or survey responses.
- Filtering and classifying content by natural language.
- Sentiment analysis for service improvement.
- Translating and localising multilingual content.
- Parsing documents for analytics and RAG pipelines.

### 🤖 Available AI Functions

| Function            | Purpose                                              | Input Types     |
| ------------------- | ---------------------------------------------------- | --------------- |
| `AI_COMPLETE`       | Generate text completions using a selected LLM       | Text, Images    |
| `AI_CLASSIFY`       | Classify text or images into user-defined categories | Text, Images    |
| `AI_FILTER`         | Return True/False for natural language conditions    | Text, Images    |
| `AI_EXTRACT`        | Extract structured information from text/documents   | Text, Documents |
| `AI_SENTIMENT`      | Analyse sentiment of text (-1 to 1 score)            | Text            |
| `AI_TRANSLATE`      | Translate text between supported languages           | Text            |
| `AI_SUMMARIZE_AGG`  | Summarise text across multiple rows                  | Text            |
| `AI_AGG`            | Aggregate insights across rows with a prompt         | Text            |
| `AI_EMBED`          | Generate embedding vectors for similarity search     | Text, Images    |
| `AI_REDACT`         | Redact personally identifiable information (PII)     | Text            |
| `AI_PARSE_DOCUMENT` | Extract text and layout from documents               | Documents       |

### 💬 Text Generation with AI_COMPLETE

The `AI_COMPLETE` function generates a completion for a given prompt using a selected LLM model. It is the most
versatile AI function and can be used for summarisation, question answering, text generation, and more.

```sql
-- Simple text generation
SELECT AI_COMPLETE('llama3.1-70b', 'Explain the benefits of Snowflake Dynamic Tables in two sentences.');

-- Process a column of data
SELECT
    customer_id,
    feedback_text,
    AI_COMPLETE(
        'llama3.1-70b',
        'Summarise the following customer feedback in one sentence: ' || feedback_text
    ) AS feedback_summary
FROM customer_feedback
LIMIT 10;
```

### 🏷️ Classification with AI_CLASSIFY

The `AI_CLASSIFY` function classifies text or images into categories that you define — no model training required.

```sql
-- Classify support tickets by category
SELECT
    ticket_id,
    ticket_text,
    AI_CLASSIFY(
        ticket_text,
        ['Billing', 'Technical Issue', 'Feature Request', 'Account Access', 'General Enquiry']
    ) AS ticket_category
FROM support_tickets;

-- Multi-label classification
SELECT
    AI_CLASSIFY(
        'I need help resetting my password and also have a billing question',
        ['Billing', 'Technical Issue', 'Account Access'],
        {'output_mode': 'multi'}
    ) AS categories;
```

### 📄 Extraction with AI_EXTRACT

The `AI_EXTRACT` function extracts structured information from unstructured text or documents based on a schema you
provide.

```sql
-- Extract entities from an email
SELECT AI_EXTRACT(
    'Hi, my name is James Smith and my order number is ORD-12345. Please deliver to 10 Downing Street, London.',
    {'customer_name': 'VARCHAR', 'order_number': 'VARCHAR', 'delivery_address': 'VARCHAR'}
) AS extracted_data;

-- Extract from staged documents
SELECT AI_EXTRACT(
    TO_FILE('@my_docs_stage', 'invoice_001.pdf'),
    {'invoice_number': 'VARCHAR', 'total_amount': 'NUMBER', 'due_date': 'DATE'}
) AS invoice_data;
```

### 😊 Sentiment Analysis with AI_SENTIMENT

The `AI_SENTIMENT` function returns a sentiment score between -1 (very negative) and 1 (very positive) for a given piece
of text.

```sql
-- Analyse sentiment of product reviews
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
```

### 🔒 Access Control and Costs

To use Cortex AI Functions, users require:

- The `CORTEX_USER` database role (granted to `PUBLIC` by default).
- The `USE AI FUNCTIONS` account-level privilege (granted to `PUBLIC` by default).

```sql
-- Grant AI function access to a specific role
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE analyst;
GRANT USE AI FUNCTIONS ON ACCOUNT TO ROLE analyst;
```

**Cost considerations**: AI Functions incur compute costs based on the number of tokens processed. Snowflake recommends
using a warehouse size no larger than MEDIUM, as larger warehouses do not increase performance for AI function calls.

```sql
-- Track AI function credit consumption
SELECT *
FROM SNOWFLAKE.ACCOUNT_USAGE.CORTEX_FUNCTIONS_USAGE_HISTORY
ORDER BY start_time DESC
LIMIT 20;
```

## 💡 Tutorial

In this tutorial, we'll be exploring how to use Cortex AI Functions to analyse customer feedback data. We'll classify
tickets, extract key entities, run sentiment analysis, and generate summaries — all using standard SQL against data
stored in Snowflake.

By the end of this tutorial, you'll have gained a comprehensive understanding of how to leverage Snowflake's built-in AI
capabilities to add intelligence to your data workflows without requiring any external model deployment or data
movement.

## 🎈 Conclusion

In conclusion, Snowflake Cortex AI Functions provide a powerful, accessible way to bring AI-powered analytics into your
data platform. With functions such as AI_COMPLETE, AI_CLASSIFY, AI_EXTRACT, and AI_SENTIMENT, you can classify content,
extract entities, analyse sentiment, and generate text — all from simple SQL queries. Because the models are fully
hosted within Snowflake, your data remains secure and governed, making it straightforward for Engineers, Analysts, and
Data Scientists to add intelligence to their workflows.

## 📖 Additional Resources

- [Cortex AI Functions Documentation](https://docs.snowflake.com/en/user-guide/snowflake-cortex/aisql)
- [Quick Start - Getting Started with Cortex AI](https://quickstarts.snowflake.com/guide/getting_started_with_snowflake_cortex/)
- [Cortex AI Functions: Images](https://docs.snowflake.com/en/user-guide/snowflake-cortex/ai-images)
- [Cortex AI Functions: Documents](https://docs.snowflake.com/en/user-guide/snowflake-cortex/ai-documents)

## ⚠️ Disclaimer

Please note that whilst we strive to keep this tutorial up-to-date, Snowflake's features and capabilities may change
over time. Always refer to the [official Snowflake documentation](https://docs.snowflake.com/) for the most accurate and
current information.
