# 🚀 Snowflake Cortex AI Functions

> Architecture and design rationale: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

[![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Platform-29B5E8?style=flat&logo=snowflake)](https://www.snowflake.com/)
[![SQL](https://img.shields.io/badge/SQL-Snowflake%20Dialect-lightgrey)](https://docs.snowflake.com/)
[![Status](https://img.shields.io/badge/Status-Educational-success)](https://github.com/ElliottFairhall/Snowflake_Cortex_AI)

A comprehensive guide to leveraging **Snowflake Cortex AI Functions** for AI-powered analytics. This project
demonstrates how to classify text, extract entities, analyse sentiment, and generate text directly within Snowflake
using simple SQL and built-in Large Language Models (LLMs).

______________________________________________________________________

## Key Features

- **Text Generation**: Mastering `AI_COMPLETE` for summaries and creative content.
- **Classification**: Using `AI_CLASSIFY` for zero-shot categorization.
- **Entity Extraction**: Leveraging `AI_EXTRACT` for structured data from unstructured text.
- **Sentiment Analysis**: Quantitative mood tracking with `AI_SENTIMENT`.
- **Governance**: Security and access control implementation for AI features.

______________________________________________________________________

## Project Structure

```text
Snowflake_Cortex_AI/
├── README.md               # You are here
├── Tutorial/
│   └── CORTEX_AI_TUTORIAL.md # Step-by-step walkthrough
├── scripts/                # Standalone SQL scripts extracted from the tutorial
│   ├── 01_text_generation.sql
│   ├── 02_classification.sql
│   ├── 03_extraction.sql
│   ├── 04_sentiment_analysis.sql
│   ├── 05_access_control.sql
│   └── 06_usage_monitoring.sql
└── data/                   # Sample data placeholders
```

______________________________________________________________________

## Getting Started

> **Environment Setup:** Before beginning, execute `scripts/00_setup_environment.sql` to provision the necessary
> databases, schemas, and sample data for this project.

1. Navigate to the [Tutorial](Tutorial/CORTEX_AI_TUTORIAL.md) for the full step-by-step guide.
2. Execution order for scripts is provided in the `scripts/` directory numbering.

______________________________________________________________________

## Author

**Elliott Fairhall** *Data Engineering Educational Series*
