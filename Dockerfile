FROM python:3.11.2-alpine3.17

# This is to prevent Python from buffering our standard output stream
ENV PYTHONUNBUFFERED 1 
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
# Create a directory for our application, set it as the working directory, and copy our application code into it

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create a user that will run our application
RUN adduser -D user
USER user
