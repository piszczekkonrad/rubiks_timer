# rubiks_timer

Minimum SDK: 21
Target SDK: 30

tested on Android API 30

## Getting Started

Mobile App created for learning to solve Rubik's cube. 
App was being developed alongside going through Flutter course, and is designed in such a way to showcase my ability to use certain technologies.
App uses cubit from bloc library for state management.
In "solving" part it fetches data from "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer", which I wrote myself, using retrofit and dio.
App uses freezed for generating  models and states.
It features a simple timer, for measuring your speedcubing results :D
App uses Firebase firestore to store your times, and Firebase Authentification.
