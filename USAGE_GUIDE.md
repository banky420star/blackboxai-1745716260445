# Advanced LSTM & DRL Trading Bot - Usage Guide

## 1. API Key Configuration

- Store your API keys securely using environment variables or a `.env` file.
- Example `.env` file:
  ```
  EXCHANGE_API_KEY=your_exchange_api_key
  EXCHANGE_SECRET_KEY=your_exchange_secret_key
  NEWS_API_KEY=your_news_api_key
  ```
- Load these keys in your environment before running the bot:
  ```bash
  export EXCHANGE_API_KEY="your_exchange_api_key"
  export EXCHANGE_SECRET_KEY="your_exchange_secret_key"
  export NEWS_API_KEY="your_news_api_key"
  ```
- Alternatively, use the `scripts/security_setup.sh` to create a secure API key file at `/opt/trading_bot/secrets/api_keys.env`.

- **Free & Unlimited Data Sources (No API Keys Required):**

  You can use the following truly free and unlimited data sources directly in your bot or analytics pipeline. These require no API keys and have no hard rate limits (please throttle politely, e.g., 1 request per second):

  1. **Crypto Market Data:**  
     - **Source:** CoinLore  
     - **Endpoint:** https://api.coinlore.net/api/tickers/  
     - **Features:** Real-time prices, market caps, 24h volume, 1h/24h/7d % changes for 2,000+ coins.

  2. **Forex & FX Rates:**  
     - **Source:** Exchangerate.host  
     - **Endpoint:** https://api.exchangerate.host/latest  
     - **Features:** Real-time and historical FX rates for 160+ fiat & crypto pairs; convert, timeseries, and more.

  3. **Stock & Equities:**  
     - **Source:** Yahoo Finance (via yfinance library)  
     - **Usage:**  
       ```python
       import yfinance as yf
       df = yf.download("AAPL", period="1mo")
       ```  
     - **Features:** Real-time quotes, historical OHLC, fundamentals, news headlines, options chains.

  4. **Global News & Events:**  
     - **Source:** GDELT Doc API  
     - **Endpoint:** https://api.gdeltproject.org/api/v2/doc/doc?query=bitcoin&mode=artlist&maxrecords=10&format=json  
     - **Features:** Searchable, machine-translated news across 65 languages; full-text search, event coding, rich metadata.

  - Poll these endpoints at 0.5–1 Hz to stay courteous and avoid IP blocking.

## 2. Running the Bot Locally

- Create and activate a Python virtual environment:
  ```bash
  python3 -m venv venv
  source venv/bin/activate
  ```
- Install dependencies:
  ```bash
  pip install -r requirements.txt
  ```
- Run the bot:
  ```bash
  python3 src/main.py
  ```
- The bot will train the model if no saved model exists, then start trading.

## 3. Deploying on a VPS

### Initial Setup

- Connect to your VPS via SSH.
- Upload the project files or clone the repository.
- Run the VPS setup script:
  ```bash
  bash scripts/setup_vps.sh
  ```
- Run the security setup script:
  ```bash
  bash scripts/security_setup.sh
  ```
- Configure your API keys securely as described above.

### Running the Bot on VPS

- Activate the virtual environment:
  ```bash
  source /opt/trading_bot/venv/bin/activate
  ```
- Start the bot:
  ```bash
  python3 /opt/trading_bot/src/main.py
  ```
- The bot is configured to run as a supervisor service for automatic restart and logging.

### Monitoring and Management

- Use the `scripts/manage_vps.py` script to:
  - Check system resources and bot status:
    ```bash
    python3 scripts/manage_vps.py --check
    ```
  - Create backups:
    ```bash
    python3 scripts/manage_vps.py --backup
    ```
  - Restart the bot:
    ```bash
    python3 scripts/manage_vps.py --restart
    ```
- Logs are stored in `/var/log/trading_bot/`.

## 4. Testing

- Run the test script to verify all components:
  ```bash
  python3 test_bot.py
  ```

## 5. Extending and Customizing

- Modify `src/config/trading_config.py` to adjust trading parameters.
- Extend `src/data/data_gatherer.py` to add new data sources.
- Customize `src/models/trading_model.py` to improve model architecture.
- Enhance `src/utils/technical_indicators.py` and `src/utils/risk_manager.py` for advanced analysis and risk management.

---

For any issues or questions, please refer to the project documentation or contact the development team.
