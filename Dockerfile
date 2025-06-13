FROM mcr.microsoft.com/playwright/python:v1.52.0-jammy

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN playwright install --with-deps

COPY . .

ENV OPENAI_API_KEY=${OPENAI_API_KEY}

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]
