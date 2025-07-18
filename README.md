# Flight Booker

This is a simple implementation of the project Flight Booker in the Odin Project cirriculum using Ruby on Rails. 

# Features

In this app, you can:

- Search for flights based on Departure and Arrival Airport, Departure Time, and number of passengers.
- Select a flight and proceed to booking
- Enter passengers' information
- Add/remove passengers during booking
- Check your booking (no search function for it)
- Add passengers during booking management
- Email booking and passenger confirmations (local in development)

# Technical features

In this app, there are a few technical features that ensure a smooth flow of the application

- During the search, all the parameters are validated and checked before giving a list of flights
- During the booking phase, all parameters are validated and the application handles everything with only one form
- To manage your booking, you have to remember your Booking id and use the router `/bookings/:id`
- During passenger addition and removal, the minimum limit is 1 and the maximum limit is 4. This is validated both on the front end and the backend.
- All validations are made both on the client and server side, as well as routing validations.
- Booking management and passenger addition and removal during booking is handled using Stimulus and Turbo streams

# How to run

In order to run the application locally, first clone the github repository using

```sh
git clone git@github.com:Bidrift/odin-flight-booker.git
cd odin-flight-booker
```

After that, if you haven't, create the database using `rails db:create`

If you have any issues with the migration or schema, migrate the database using `rails db:migrate`

Then, seed the database with actual flights in your time using `rails db:seeds:replant`

And finally, to run the application, simply run `rails server`

The application will be usually in http://localhost:3000

# Technical stack

During the development of this project, I used the following stack:

- Ruby on Rails: `8.0.2v`
- Gem [simple_form](https://github.com/heartcombo/simple_form)
- Stimulus and Turbo
- Mailers

# Demo (screenshots)

- Flight search

![flight search](https://i.imgur.com/iHr2JaR.png)

- Flight selection

![flight selection](https://i.imgur.com/5XqCvXJ.png)

- Booking form

![booking form](https://i.imgur.com/0bmbwhG.png)

- Booking information

![booking info](https://i.imgur.com/7kp4dTc.png)

- Booking management (passenger addition)

![booking manager](https://i.imgur.com/8Ttn5Q1.png)

- Booking confirmation email

![email preview](https://i.imgur.com/cPrm1HE.png)