
# NYArticles
NY Times famous articles implemented using mvvm, clean architecture(usecases) and coordinator pattren

# Content


 * Overview
 * App Features
 * How To Run
 * Requirements

 # Overview
    This project is created by implementation of clean architecure with MVVM-C.The main basic flow of the app is that View is having the viewmodel which contains all the logic to how to pull the data and pass it to the view in order to visible in the view and for the navigation it uses the coordintor pattren .The main backbone of the architecure is the use-cases. The Network feature is having the independent testcases. The network feature is more then 90% of code coverage.
 
  # App Features
 
  * **Network Feature**
     This is the indpendent module for calling the network api and having its seperate testcase.
    * **ApiRequestBuilder**  This is use to create the api request information
    * **HttpMethod**  Contains the http method like "get"
    * **Network** The main class to call the api basis on the request.
    * **NetworkError** All the related network error
 
 
  * **Main APP**
     
    * **AppCoordinator**  The app will be start from the AppCoordinator and then it will use the following child coordinator like 'PopularArticlesCoordinator'
    * **PopularArticlesViewController** This view is responsible to show the famous articles.
    
    * **Constants** Its contains the api keys inorder to have the different key change 'apiKey'

 # How To Run
  The app required the minimum iOS target 13.0. Use the latest xcode to Run the app. Kindly update the Api key in Constants-> apiKey
  
  # Requirements

- iOS 13+ 
- Xcode 14.2+
- Swift 5.7+
- SPM
