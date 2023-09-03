FROM python:3.11

# RUN apk update && apk upgrade
# RUN apk add build-base
RUN apt-get install gcc
RUN apt-get install wkhtmltopdf

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

RUN python manage.py makemigrations
RUN python manage.py migrate

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]