# DeliverIt

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app allows a user to place an order for delivery from different stores in their area and was developed as a response to the COVID-19 pandemic so people, especially high-risk people like the elderly, wouldn't need to leave their homes.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Delivery
- **Mobile:** This app would be primarily developed for mobile and functionality may be limited to mobile devices.
- **Story:** Allows a user to place an order for delivery specifically as a response to the covid-19 pandemic but can be used for general purpose.
- **Market:** Anyone can use this app but there is options to prioritize the elederly and handicapped.
- **Habit:** This app can be used as often as a user would like and is designed to keep people from having to leave their homes.
- **Scope:** We are starting as a delivery app during the pandemic but are open to expanding to other services.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can create a new account
- [x] User can login
* User can select a category and view businesses related to that category
* User can select various products or services to request from a business
* User can view availability of businesses and fill in time slots to have their products delivered or to have service performed


**Optional Nice-to-have Stories**

* User can rate business services.
* User can pay for tasks.
* User can view history of tasks requested from businesses.
* User can request to register/post to their own business onto app.

App : https://imgur.com/a/kSynqMv.gif
Updated: https://imgur.com/AMe8tKP.gif

### 2. Screen Archetypes

* Login
   * User can login
* Register
   * User can create a new account
* Categories
    * User can view and select a category
* Stream/View businesses
   * User can view a feed of all the businesses associated to the selected category.
* Make a request
   * User can make a request for what services or products they require
* Schedule
   * User can see availability schedulem for businesses


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile
* Categories


**Flow Navigation** (Screen to Screen)

* Registration Screen
   * Login Screen
* Login Screen
   * Home Screen
* Home Screen (of Categories)
    * Profile Screen (tab)
* Businesses List Screen
    * Scheduling Screen
    * Order/ Service Request 
* Order/ Service Request Screen
    * Order/ Service Request Confirmation Screen
* Scheduling Screen
    * Calendar Screen
   


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_IMG_URL" width=600>
![](https://i.imgur.com/TFmCt92.png)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
Objects:
- Users
- Products/Service Requests
- Businesses
- Availability Schedule

### Models
- Users

| Property | Type | Description |
| -------- | ---- | ----------- |
| Name     |  String    |   Name of user|
|Profile Image  |   File   |      Image of user       |
|     Age     |  Number    |       Age of the user      |
|   Address       |   String  |      Location of deliveries drop-off       |
|     Phone Number     |  String    |    Phone number of user         |


-Products Request

| Property        | Column 2 | Column 3                                          |
| --------------- | -------- | ------------------------------------------------- |
| Store           | String   | Name of the store that user wants deliveries from |
| Time            | DateTime | Time that user prefers the service by          |
| Items           | String   | Items that user wants                             |
| Number of items | Number   | Total number of items requested                   |
| Price           | String   | Total Price of all Items                          |\
| Time Limit                |    Number      | Time limit for how long user can take to make request |

- Service Request
| Property        | Column 2 | Column 3                                          |
| --------------- | -------- | ------------------------------------------------- |
| Business Name           | String   | Name of the business that user wants service from |
| Time            | DateTime | Time that user prefers the service to be done          |
| Tasks           | String   | Specific tasks the user wants accomplished from this business                          |
| Number of tasks | Number   | Total number of tasks requested from this business                   |
| Price           | String   | Total Price of all Tasks                          |\
| Time Limit                |    Number      | Time limit for how long user can take to make request |


- Businesses

| Property      | Type   | Description                     |
| ------------- | ------ | ------------------------------- |
| Name          | String | Name of Business                    |
| Logo  | File   | Logo image of Business                   |
| Services/Products      | Array | List of services or products available by this business                |
| Address       | String | Location of deliveries drop-off |
| Phone Number  | String | Phone number of user            |
| Availability              |   Array     |         List of all the hourly time slots the business has available |

### Networking
- Profile Screen
    - (Read/GET) Query logged in user object
    - (Update/PUT) Update user profile image
- Categories Screen
    - (Read/GET) Fetch all businesses tagged with the associated category
- Business Screen
    - (Read/GET) Fetch information about products and services offered from this business 
- Scheduling Screen
    - (Create/POST) User can select products/services
    - (Read/GET) Fetch business' availabiity calendar
    - (Create/POST) User can fill in time slot on business calendar
- Receipts Screen
    - (Read/GET) Query post object.
    ![](https://i.imgur.com/7aLwpG5.png)


}
- [OPTIONAL: List endpoints if using existing API such as Yelp]
