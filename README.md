# pulse_app

Health care app

# Project Documentation
https://docs.google.com/document/d/19jUau8PabS7maOqlQkURS7NVNO_caerbi8HUPebTj7I/edit?usp=sharing

# Description

Pulse app is an application that track your health status and warning you if there's any dangerous health statue.
There is a login & sign up system you can sign up as a patient or as a helper 
If you signed as a helper the application well notify you when there is a patient around you that you can help him 
If you signed as a patient the application will read the sensors reads from firebase (heart rate, oxygen and temperature) the application provide you with a graph that describe your heart rate, oxygen in your blood and temperature per month, per day and per a week.
You can add your network list of people you would like to notify them if there's any dangerous health statue about you and you can send a report about your health statue as a pdf to any number via WhatsApp.
You can search for the nearest hospital or pharmacy.
You can set an alarm with your medicine times, and application will send a notification everyday to remember you with your medicine.
Finally if the app found any dangerous health statue it will automatically send messages with your current location to you network list of people and will notify the nearest helpers to help you.


# Project Architecture Description

We use MVVM architecture.
The start point of the project is main.dart file.
There is 5 main folders:
-Models (MODEL) folder which contains all the classes that describe our models data in the app in dart language.

-Modules (VIEW MODEL) folder which continents all the files that contain flutter code for the Screens UI.

-Layout (VIEW MODEL) folder which contains the files that contain flutter code for introduction screens.

-Cubits (MODEL) file which contains all cubits classes that response to get the data from the firebase and authentication the user with firebase

-Shared File contains :
 -Style folder containes the colors and the them of the app (VIEW).
 -Components folder which contains any shared ui component which used frequently in the app(VIEW).
 -Cubit folder which continents our state management BLOC and the methods which response to change the state of the app(MODEL).

# UI/UX Design

Simply put, User Interface Design is important because it can make or break your customer base. It creates fewer problems, increases user involvement, perfects functionality and creates a strong link between your customers and your website.
Therfore, you can also see the design of the UI/UX Design.

for Design: https://www.figma.com/file/IqCFGDFYGUaXzYd2Z02VVW/Pulse?node-id=0%3A1

for Prototype: https://www.figma.com/proto/IqCFGDFYGUaXzYd2Z02VVW/Pulse?node-id=125%3A617&scaling=scale-down&page-id=0%3A1&starting-point-node-id=125%3A600




# Hardware

It's a device that is attached to the patient and contains many sensors that read the patient's vital signs and send the readings to the Firebase to be dealt with and presented to the patient on the application, and it also contains a location at any time, We are using the beta version of the development board (nodeMCU-esp8266)

Ingredients used:
-Heart reat sensor (max30100)

![da11afb2-af3c-4603-ae4a-f234341cf97c](https://user-images.githubusercontent.com/75755688/161110499-5b44d220-4fe6-4412-a99d-cdf35c73c98c.jpg)
-tmpreture sensor (LM35)

![121](https://user-images.githubusercontent.com/75755688/161111054-c0fc875a-8446-47a3-b7cf-5b71ff47247b.jpg)
-GPS Module (UBLOX)


![96](https://user-images.githubusercontent.com/75755688/161110900-afcbaa83-45e5-4f56-a39d-00350e7c0dc2.jpg)


## Heart reat sensor (max30100)

In this part, I will explain how to connect the Heart reat sensor with the controller
![iot_oximeter_bb-min](https://user-images.githubusercontent.com/75755688/161111674-2bbc5624-0fd5-4e42-bed8-42e884864efc.png)

## tmpreture sensor (LM35)

In this part, I will explain how to connect the temperature sensor with the controller
![LM35 Interfacing with NodeMCU](https://user-images.githubusercontent.com/75755688/161114009-7765e805-cd72-4df8-a7a8-1da04c50b3ea.png)

## GPS Module (UBLOX)

In this part, I will explain how to connect the GPS Module with the controller
![1](https://user-images.githubusercontent.com/75755688/161114531-ff7250dc-f14f-4013-8d6b-ecf3edf1ef2f.jpg)

