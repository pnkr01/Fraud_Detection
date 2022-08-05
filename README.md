<br />

<div align="center">
  <a href="https://github.com/pnkr01/Fraud_Detection">
    <img src="https://user-images.githubusercontent.com/83778936/182015338-58021bcb-1855-4d81-8745-c7ee34b4ccf3.png" alt="Logo" width="80" height="80">
  </a>
  <h1 align="center"><b>HackOn Shop</b></h1>
    <p align="center">
    Your Solution to Fraudless E-Commerce Platform.
  </p>
<img src="https://img.shields.io/github/languages/code-size/pnkr01/ghumo?style=flat-square" alt="Code size" />
<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/pnkr01/ghumo?style=flat-square">
<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/pnkr01/ghumo?style=flat-square">
<img alt="GitHub Repo forks" src="https://img.shields.io/github/forks/pnkr01/ghumo?style=flat-square">
<img alt="GitHub Repo issues" src="https://img.shields.io/github/issues/pnkr01/ghumo?style=flat-square">
<br />
<a href="https://github.com/pnkr01/Fraud_Detection/issues">Report Bug</a>
·
<a href="https://github.com/pnkr01/Fraud_Detection/issues">Request Feature</a>
</div>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#why-hackon-shop-">Aim</a>
    </li>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#tech-stacks">Tech Stacks</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#app-screenshots">App ScreenShots</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## Why Hackon Shop ?

The goal of our concept is to create a scalable solution that will benefit the e-commerce ecosystem by reducing identity and payment fraud through analysis of transaction and behavioural data. Other third-party clients can effortlessly integrate our service with the use of an API key. It will also assist them in conserving resources by using our model as a service.

## About The Project

Our idea consists of 3 major components, namely the Android App, the Web App, and the Machine Learning Model.

Android Application: 
To determine whether a transaction is fraudulent before the order is confirmed, we will create a minimally viable e-commerce software that will be connected to a machine learning model via a backend API.

Web App : To demonstrate how easily the backend API can be incorporated into any platform, we'll develop a functionality similar to the Android application.

Fraud Detection Model: We have used random forest on our dataset to determine whether a transaction is fraudulent or not by using information from the e-commerce platform, such as the IP address, billing address, purchase amount, etc. The model will be deployed on a scalable microservice architecture.


Later on, we will focus more on our system's scalability and security, as well as adding new features to extend our current implementation for third-party clients to add their own restrictions and logic.

We will also work to improve the detection model by utilising an elaborate dataset with more features, such as tracking of user actions performed prior to purchasing a product.

We will also include a feedback mechanism to help the model learn from its mistakes and improve.

The business model will also be launched as a ** pay-per-use** model, which will benefit both small and large businesses.


### Tech Stacks

**Mobile Applicaton:**

- Flutter
- Firebase
- Backed Model


## Getting Started

You can test HackOn Shop in your own development environment. This section shows you how:

## Prerequisites

You'll need to set up the IDE and mobile device emulator, or any mobile testing device on your local system.


**Flutter Environment: You'll need to have the following installed:**

1. [Flutter SDK](https://flutter.dev/docs/get-started/install)
2. [Android Studio](https://developer.android.com/studio)

***Ensure you are testing the app using Flutter version [2.10.5](https://docs.flutter.dev/development/tools/sdk/releases?tab=windows) and above.***

*For checking flutter version:*

- Run flutter --version in terminal

If your version is not upto date, follow these steps to upgrade:

- flutter channel stable to switch to the channel having stable version of flutter updates
- flutter upgrade to get the latest flutter version

### *Development Environment: For setting up the development environment, follow the steps given below.*

- Clone this repository after forking using git clone <https://github.com/pnkr01/Fraud_Detection>
- cd into `quick_order`
- Check for flutter setup and connected devices using `flutter doctor`
- Get all the dependencies using `flutter pub get`

- **Run the app using `flutter run`**

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

This project structure:

```text
QUICCK_ORDER/lib/
├── src/                       
     ├── global/
            ├── components
            ├── constants
            ├── ...
            └──.....
     ├── model
           ├── cart
           ├── product
           └── category
     ├──screens
          ├── account 
                 ├── account.dart
          ├──  cart
                ├── components
                       ├── ...
                       ├── ...
                       ├── ...
                └── cart_screen.dart
                
                
          ├── details
                 ├── components
                         ├── ...
                         ├── ...
                         ├── ...
                 └── details.dart
                 
          ├── home
               ├── components
                      ├── ...
                      ├── ...
                      └── ...
                      
               └── home_screen.dart
               
          ├── splash
               ├── components
                       ├── ...
                       ├── ...
                       ├── ...
               └── splash.dart
          
     ├── services
            ├── api
                 └── ip_address.dart
            ├── auth
                  ├──components
                          ├── new_user
                          ├── old_user
                          └── profile
                  └── sigin.dart
            
     ├──app_theme.dart
     └──app.dart
            
└── main.dart                  # Heart of this App.
```

## APP Screenshots

<div align="center">


![1 1](https://user-images.githubusercontent.com/83778936/182018244-ee4c7882-ad6a-426a-a103-5f618a6a9fea.jpg)
![2 1](https://user-images.githubusercontent.com/83778936/182018256-adabcb33-3647-4830-b516-6c2e01a184f9.jpg)
![3 1](https://user-images.githubusercontent.com/83778936/182018264-6e794c0e-f97d-42a8-bbf9-65f20783890e.jpg)
![4 1](https://user-images.githubusercontent.com/83778936/182018266-bffac51e-8604-43b9-9332-d93e4ef97862.jpg)
![5 1](https://user-images.githubusercontent.com/83778936/182018271-4a096b88-89be-4275-b4d0-6fe2dc88dfd4.jpg)
![10 1](https://user-images.githubusercontent.com/83778936/182018287-53c21b4f-9c75-48ae-af67-9b6097239192.jpg)
![11 1](https://user-images.githubusercontent.com/83778936/182018288-74b39e69-56c5-4fbe-a77f-dd180f2c4437.jpg)


</div>

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Team Name - Seh_Lenge_Thoda 
<br>
[Pawan Kumar](https://github.com/pnkr01)
<br>
[Saheb Giri](https://github.com/iamsahebgiri)
<br>
[Gyanaranjan](https://github.com/TheSpeedX)
<br>
[Rahul Kumar](https://github.com/rahulhind)

Project Link: [Link](https://github.com/pnkr01/Fraud_Detection)

Made with ♥ by Team Seh_Lenge_Thoda in HackOn with Amazon .

