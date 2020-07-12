/* eslint-disable promise/no-nesting */
const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().functions);

// var serviceAccount = require("../functions/kilimo-salama-firebase-adminsdk-2ztjs-3ac67456a6.json");

// admin.initializeApp({
//     credential: admin.credential.cert("../functions/kilimo-salama-firebase-adminsdk-2ztjs-3ac67456a6.json"),
//     databaseURL: "https://kilimo-salama.firebaseio.com"
// });
var newData;

exports.sendNotification = functions.firestore
  .document('chats/{groupId1}/{groupId2}/{message}')
  .onCreate(async(snap, context) => {
    console.log('----------------start function--------------------')
    if (snap.empty){
      console.log("No data available");
      return;
    }

    var tokens = [
      'fNOpeiG38JA:APA91bFsI8OA2blJYTQkzSQ25WGsMqaAM5WzuQ2nV_DveChxoNM6Zj6Sr9K06hM09xOfYlKyeMxmQVKCjiLgmxTgyF0yE8rAZwPv_1PER30I2GbWdqAoWtZvpid9KveKLU1tIfm3e7-w'
    ];
    // the doc that has been created
    newData = snap.data();
    console.log(newData);

    // fetch these values from the document
    const idFrom = newData.idFrom
    const idTo = newData.idTo
    const contentMessage = newData.content

    // Get push token user to (receive)
    await admin
    .firestore()
    .collection('users')
    .where('uid', '==', idTo)
    .get()
    .then(querySnapshot => {
      return querySnapshot.forEach(userTo => {
        console.log(`Found user to: ${userTo.data().username}`);

        if(userTo.data().chattingWith !== idFrom) {
          // get the info user from (sent)
          admin
          .firestore()
          .collection('users')
          .where('uid', '==', idFrom)
          .get()
          .then(querySnapshot2 => {
            return querySnapshot2.forEach(userFrom => {
              console.log(`Found user from: ${userFrom.data().username}`);
              const payload = {
                notification: {
                  title: userFrom.data().username,
                  body: contentMessage,
                  badge: '1',
                  sound: 'default'
                },
                data: {
                  click_action: 'FLUTTER_NOTIFICATION_CLICK',
                  message: contentMessage,
                }
              }
              // Lets push to the target device
              try {
                admin
                .messaging()
                // .sendToDevice(tokens, payload)
                .sendToDevice(userTo.data().pushToken, payload)
                .then(response => {
                  return console.log('Successfully sent message:', response);
                })
                .catch(error => {
                  console.log('Unable to send notification to recepient', error);
                })
              } catch (error) {
                console.log('Error sending message:', error);
              }
            })
          })
          .catch(error => {
            console.log('Unable to get chat sender', error);
          })
        } else {
          console.log('Can not find pushToken target user');
        }
      })
    })
    .catch(error => {
      console.log('Unable to get chat recepient', error)
    })
  }
  )