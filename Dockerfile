# base image file
FROM python:3.9-alpine3.13

# Maintainer label
LABEL Maintainer="anuj5530"

# python unbuffered
ENV pythonunbuffered 1

# copying requirements
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

# creating virtual env and adding user
ARG DEV=false
RUN python -m venv /py && \
/py/bin/pip install --upgrade pip && \
/py/bin/pip install -r /tmp/requirements.txt && \
if [ $DEV = 'true' ]; \
then /py/bin/pip install -r /tmp/requirements.dev.txt; \
fi && \
rm -rf /tmp && \
adduser \
--disabled-password \
--no-create-home \
django-user

# adding path
ENV PATH="/py/bin:$PATH"
USER django-user