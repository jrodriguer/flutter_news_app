importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

const firebaseConfig = {
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// messages background on web
messaging.onBackgroundMessage((message) => {
 console.log("onBackgroundMessage", message);
});