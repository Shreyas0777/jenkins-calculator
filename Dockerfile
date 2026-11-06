FROM python:3.12-slim

WORKDIR /app

COPY calculator.py test_calculator.py requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir pytest

CMD ["python3", "-m", "pytest", "-v"]
