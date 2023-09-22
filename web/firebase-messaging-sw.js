importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

const firebaseConfig = {
   apiKey: "AIzaSyCuee_CCVZIO40ZKQ41wXXkBrOsgPzpVSM",
   authDomain: "flutter-news-app-6a808.firebaseapp.com",
   projectId: "flutter-news-app-6a808",
   storageBucket: "flutter-news-app-6a808.appspot.com",
   messagingSenderId: "43190597035",
   appId: "1:43190597035:web:ac12179e0e6d4438d38eee"
 };

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// messages background on web
messaging.onBackgroundMessage((message) => {
 console.log("onBackgroundMessage", message);
});