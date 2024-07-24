FROM python:3.9

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000


ENV key=PYTHONUNBUFFERED 1

CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]

