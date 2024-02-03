# Data Modeling Project with DBT

## Overview

This project uses data related to direct marketing campaigns (phone calls) of a Portuguese banking institution. The classification goal is to predict if the client will subscribe to a term deposit (variable y).

**Data Source:** [Bank Marketing Dataset](https://archive.ics.uci.edu/dataset/222/bank+marketing)

## Project Structure

### 1. Staging
   - Raw data is loaded in this stage.
   - [Explanation of raw data loading.]

### 2. Trusted
   - Data undergoes a cleaning and transformation process.
   - [Details about applied transformations.]

### 3. Refined
   - Utilization of DBT and BigQuery to model the data.
   - [Information on specific modeling and transformations done with DBT.]
   
## Prerequisites

Ensure you have the following tools installed before getting started:

- DBT
- BigQuery

## Environment Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/nayyarabernardo/dbt-bank-marketing.git
   cd dbt-bank-marketing
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

## Running the Project

### Staging
```bash
dbt run --models staging
```

### Trusted
```bash
dbt run --models trusted
```

### Refined
```bash
dbt run --models refined
```

## Results

The final results can be found in the `refined` layer. [Add information about the obtained results.]

## Contributions

Contributions are welcome! Feel free to open an issue or create a pull request.

