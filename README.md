## QConcursos Test API

This is a API developed for a QConcursos' test. There's two main features here:
* Listing the disciplines that were accessed the most in the last 24 hours
* List the most accessed questions by week/month/year

## Requirements
  - Ruby version: 2.6.5
  - Rails version: 6.0.3
  - Postgresql
  - Unix based systems

## Setup:
  - ```bundle install```
  - Create the file config/database.yml (there's a `database.yml.example` as example)
    - ```rails db:create```
    - ```rails db:migrate```
  - Create the .env file (there's a `.env.example` as example)
    - In case you don't want to use .env, you can edit follow the steps:
      - ```sudo nano ~/.bashrc```
      - Add in the end of the file `export URL=https://raw.githubusercontent.com/qcx/desafio-backend/master/`
      - Ctrl + X
      - Confirm the editing by typing S or Y (it depends of your computer language)
      - ```source ~/.bashrc```

## Running:
  - Download `Postman` program
    ## Disciplines
      - Set headers like:
        - `Content-Type: application/json`
        - `Accept: application/json`
        - Set http request to `GET`
        - Put `http://localhost:3000/api/disciplines` in url location to get disciplines that were accessed the most in the last 24 hours
    
    ## Questions
      - Set headers like:
        - `Content-Type: application/json`
        - `Accept: application/json`
        - Set http request to `POST`
        - Set body as `raw`
          ## Most accessed questions of the year:

            You just have to feel the year field:
            `{
                "year": "2020",
                "month": "",
                "day": ""
              }`
          ## Most accessed questions of the month and year:

            You just have to feel month and year fields

             `{
                "year": "2020",
                "month": "07",
                "day": ""
              }`
          ## Most accessed questions of the week:

            Fill up every field with a valid date number

             `{
                "year": "2020",
                "month": "07",
                "day": "01"
              }`

## Test:
  - ```bundle exec rspec```