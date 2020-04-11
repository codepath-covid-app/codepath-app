# DeliverIt

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Our app helps people receive deliveries.

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

* User can create a new account
* User can login
* User can select a helper and create a shopping list specifying a location for delivery
* User can view helpers in their area
* User can view helper availability


**Optional Nice-to-have Stories**

* User can rate users helping with tasks.
* User can view tags specifying if a person is elderly/handicapped, in order to prioritize tasks.
* User can pay for tasks.


### 2. Screen Archetypes

* Login
   * User can login
* Register
   * User can create a new account
* Stream/View posts
   * User can view a feed of all the posts made.
* Make a post
   * User can make a post specifying where he/she is going (for delivery).
* Schedule
   * Helper sees user requests on a schedule


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Schedule


**Flow Navigation** (Screen to Screen)

* Registration Screen
   * Login Screen
* Login Screen
   * Home Screen
* Home Screen
    * List
* List Screen
    * Availability Screen
* Availability Screen
    * Shopping List Creation Screen
* Shopping List Creation Screen
    * Home Screen

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
- Posts/Task Requests
- Likes (accept requests)
- Shopping List
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


- Task Request

| Property        | Column 2 | Column 3                                          |
| --------------- | -------- | ------------------------------------------------- |
| Store           | String   | Name of the store that user wants deliveries from |
| Time            | DateTime | Time that user prefers the deliveries by          |
| Items           | String   | Items that user wants                             |
| Number of items | Number   | Total number of items requested                   |
| Price           | String   | Total Price of all Items                          |\
| Time Limit                |    Number      | Time limit for how long user can take to make request |

- Helpers

| Property      | Type   | Description                     |
| ------------- | ------ | ------------------------------- |
| Name          | String | Name of user                    |
| Profile Image | File   | Image of user                   |
| Age           | Number | Age of the user                 |
| Address       | String | Location of deliveries drop-off |
| Phone Number  | String | Phone number of user            |
| Availability              |   Array     |         List of all the hourly time slots the Helper is available |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
