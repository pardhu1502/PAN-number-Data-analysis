# PAN Number Data Analysis

## Table of Contents

- [Project Overview](#project-overview)  
- [Motivation](#motivation)  
- [Dataset Description](#dataset-description)  
- [Problem Statement](#problem-statement)  
- [Technologies Used](#technologies-used)  
- [Folder / File Structure](#folder--file-structure)  


---

## Project Overview

This project performs an exploratory data analysis on Indian PAN (Permanent Account Number) data. The objectives are:

- To validate whether PAN numbers follow the official format.  
- To identify anomalies or invalid entries.  
- To clean / preprocess the data so that downstream usage (e.g. reporting, verification) can rely on accurate PAN values.  
- To visualize patterns of invalidity / distribution of PANs in the dataset.

---

## Motivation

PAN numbers are widely used in India for tax, identity verification, financial transactions, and many systems rely on them. If PAN numbers are incorrectly recorded (format errors, missing parts, extra characters, etc.), it can lead to issues such as rejected forms, processing delays, or even fraud. This project helps in:

- Automating the detection of invalid PANs.  
- Improving data quality.  
- Understanding what kinds of errors are most common.  
- Providing a foundation for further verification or correction steps.

---

## Dataset Description

Below is a description of the data used in this project:

| Name | Format | Number of Records | Key Attributes |
|------|--------|--------------------|------------------|
| Raw PAN data file(s) | CSV / Excel (.csv, .xlsx) | 10000 | Contains PAN number strings, perhaps user details or associated metadata |
| Cleaned / Processed Data | CSV / SQL dump / Notebook output | 3193,5832,975 | Only validated PANs, invalid PANs flagged, removed or corrected entries |
| Jupyter Notebook | .ipynb | — | All analysis steps: import, cleaning, validation, EDA, visualisations |
| SQL output | .sql / database dump | — | Summary tables, invalid entries etc. |

**PAN Format as per rules:**

- Total length = 10 characters. :contentReference[oaicite:0]{index=0}  
- First 5 characters must be uppercase letters A–Z. :contentReference[oaicite:1]{index=1}  
- Next 4 characters must be digits 0–9. :contentReference[oaicite:2]{index=2}  
- Last (10th) character must be an uppercase letter. :contentReference[oaicite:3]{index=3}  

---

## Problem Statement

- Validate whether entries in the dataset are valid PAN numbers according to the official format.  
- Find and quantify invalid entries and categorize types of errors (e.g. wrong character type, lower‐case letters, extra spaces, wrong length).  
- Provide summary statistics (percentage valid vs invalid, most common error types).  
- Visualize distribution of errors.  
- Produce a cleaned dataset with valid PAN numbers for further usage.

---

## Technologies Used

- **Python** — primary language for data cleaning, validation.  
- **Pandas** — for data manipulation, cleaning.  
- **NumPy** — for basic numerical operations.  
- **Regular Expressions (regex)** — for validating PAN format.  
- **Jupyter Notebook** — interactive analysis, code + visualisations.  
- **pgSQL** if you stored or exported results into a database.  

---

## Folder & File Structure

pan‑number‑data‑analysis/
├── data/
│ ├── raw/
│ │ └── PAN_raw_data.csv
│ ├── processed/
│ │ └── PAN_cleaned.csv
├── notebooks/
│ └── pan_analysis.ipynb
├── outputs/
│ ├── invalid_entries.csv
│ ├── summary_stats.txt
│ └── visualisations/
│ ├── error_type_distribution.png
│ └── valid_vs_invalid.png
├── src/
│ └── validation.py
├── README.md
└── requirements.txt



