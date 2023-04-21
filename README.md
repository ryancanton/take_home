<h1 align="center">
  Turing Take Home
</h1>

## Table of Contents

- [Schema](#schema)
- [API Endpoints](#api-endpoint-examples)
- [Setup and Installation](#setup-and-installation)
- [About](#responsible-parties)

## Schema
<p align="center">
  <img width="900" src="https://user-images.githubusercontent.com/113324661/233697252-a1fb0a2c-eb90-4422-bd2e-d572b0ec6622.png">
</p>



## API Endpoint Examples


## POST create a subscription between a user and a tea

<b>Request:</b>
```
  POST /api/v1/subscriptions?frequency=3&customer_id=2&tea_id=2
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json 
  {
    "data": {
        "id": "9",
        "type": "subscription",
        "attributes": {
            "title": "Jasmine Subscription",
            "price": "12",
            "status": true,
            "frequency": 3,
            "customer_id": 2,
            "tea_id": 2
        }
    }
}
```
## PATCH change a subscriptions status

<b>Request:</b>
```
  PATCH /api/v1/subscriptions/6?change_status=true
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json
  {
    "data": {
        "id": "6",
        "type": "subscription",
        "attributes": {
            "title": "Earl Grey Subscription",
            "price": "0",
            "status": false,
            "frequency": 3,
            "customer_id": 2,
            "tea_id": 1
        }
    }
}
```
## GET a users subscriptions

<b>Request:</b>
```
  GET /api/v1/subscriptions?customer_id=1
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json
  {
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Jasmine Subscription",
                "price": "12",
                "status": true,
                "frequency": 3,
                "customer_id": 1,
                "tea_id": 2
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Earl Grey Subscription",
                "price": "7",
                "status": false,
                "frequency": 2,
                "customer_id": 1,
                "tea_id": 1
            }
        }
    ]
}
```

## Setup and Installation

From your terminal, run:

- ```git clone git@github.com:ryancanton/take_home.git```
- ```bundle install```
- ```rails db:{create,migrate,seed}```
- To run the tests: ```bundle exec rspec```


## Responsible Parties

| [<img alt="Ryan" width="75" src="https://media.licdn.com/dms/image/D4E03AQFAbg5Mt0mzHw/profile-displayphoto-shrink_200_200/0/1667417343436?e=1682553600&v=beta&t=RhEB2cemwMoMrLFIRoWxoo0rJtC_E2p49IKcCgj7Vew"/>](https://www.linkedin.com/in/ryan-canton-6a4854255/) |
| ----------- |
| Ryan Canton |
| [GitHub](https://github.com/ryancanton) | 
| [LinkedIn](https://www.linkedin.com/in/ryan-canton-6a4854255/) |
