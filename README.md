# Fit Master

## About
Fitmaster is an application that centralizes your meal tracking data and Fitbit fitness data.  By using the Edamam API, the user is able to obtain some general nutritional information on the foods they log.  And after logging into their Fitbit accounts, their physical activity is displayed side-by-side with their nutritional data.  That way the user can visualize both how many calories they consumed in a day as well as how many calories they burned.  They also can establish both nutritional and fitness goals for themselves and visualize if they are achieving those goals.

---
## Development

This project utilizes Ruby on Rails as a web app framework, [Paperclip](https://github.com/thoughtbot/paperclip) and [AWS](https://aws.amazon.com/s3/) for file attachment & storage, [rails action mailer](http://guides.rubyonrails.org/action_mailer_basics.html), and [Bootstrap](http://getbootstrap.com/) for styling.

---

## App Overview
![](http://g.recordit.co/sGeBKROsso.gif)

---

## Technical Challenges

The Fitbit API's authentication tokens expire every 8 hours, making it difficult for a user to remain logged into my app while their browser remains open.  I devised a way to check the expiration time before API calls are made and update the token if needed.  This way the user doesn't have to log out and log back in to get their data.

[New Token Service Code](https://github.com/nickpisciotta/fitness_tracker/blob/master/app/services/new_token_service.rb#L1-L22)

[Expiration Check Code](https://github.com/nickpisciotta/fitness_tracker/blob/master/app/services/activity_service.rb#L44-L48)

---

## Installation Instructions to Run Locally

```
git clone git@github.com:nickpisciotta/give-hub.git
cd give-hub
bundle
rake db:create
rake db:migrate
rails s
```
