# Coronavirus REST API Flutter Course

Source code for my [Coronavirus REST API Flutter Course on Teachable](https://courses.codewithandrea.com/p/flutter-rest-api-course-build-a-coronavirus-tracking-app).

This repository has one commit for each course lesson that contains code changes.

Each commit has a corresponding tag, which is named with the same numbering used in the course: `sectionNumber.lessonNumber`).

## Note about files in .gitignore

The following files contain API keys and are not included in the repository:

- `.vscode/settings.json`
- `lib/app/services/api_keys.dart`

When cloning this project, make sure to define your local copies according to the instructions given in the course.

## Course Curriculum

### Section 1: Intro to REST and the nCoV 2019 REST API

1. RESTful APIs: The Basics
2. The nCoV 2019 Coronavirus API: Setup instructions, API Keys and Access Tokens
3. REST Client for VS Code: Initial setup & sending requests
4. REST Client: Using Environment Variables and excluding sensitive data with .gitignore
5. REST Client: Adding the remaining requests

### Section 2: Building an API Service with the Dart http package

1. App Architecture Overview
2. Installing the http package
3. Saving the API key + GitHub source code + the Error Lens extension
4. The API class
5. The APIService class: requesting an access token
6. Parsing the http response and retrieving the access token
7. Using the API Service to show the access token
8. Adding the remaining endpoints to the API class
9. Requesting and parsing data from the remaining endpoints
10. Using the APIService class to show endpoint data
11. Recap on the APIService class

### Section 3: Building a Data Repository and creating the basic UI

1. The Data Repository
2. Loading and refreshing the access token when needed
3. Adding a Provider for the DataRepository
4. Creating a basic dashboard UI
5. Creating a custom card widget to show endpoint data
6. Loading the initial endpoint data from the API
7. Adding a refresh indicator

### Section 4: Loading data from multiple endpoints and polishing the UI

1. Loading data from multiple endpoints with Future.wait
2. The EndpointsData class
3. Improving the DataRepository class with generics and function arguments
4. Showing all the cards
5. Adding the icon assets to the project
6. Update the cards layout, image and color

### Section 5: Date formatting and reading the last updated date from the server

1. Showing when the data was last updated: client vs server approach
2. Parsing date information from the API response data
3. Creating a new data model to hold the date and value from the API
4. Showing the last updated date in the UI
5. Formatting dates with the intl package
6. Add thousands' separators with the NumberFormat class

### Section 6: Error handling and caching data with Shared Preferences

1. Error handling overview, and understanding the call stack
2. Showing an alert dialog to the user
3. Completing the error handling code
4. Introduction to data persistence with Shared Preferences
5. Writing a DataCacheService
6. Integrating the DataCacheService in the DataRepository
7. Injecting the DataCacheService in main.dart
8. Hot fix: The getter 'date' was called on null
9. Conclusion & next steps


### [License: MIT](LICENSE.md)  