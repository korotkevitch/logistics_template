FROM python:3.9-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apk --update add
RUN apk add gcc libc-dev libffi-dev jpeg-dev zlib-dev libjpeg

RUN pip install --upgrade pip
RUN chmod +x entrypoint.sh

COPY ./requirements.txt .
COPY ./entrypoint.sh .

RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT ["/app/entrypoint.sh"]
