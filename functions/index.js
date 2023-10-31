// const functions = require('firebase-functions');

// // Create and deploy a HTTP Cloud Function
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   response.send("Hello from Firebase Cloud Functions! yo this is dileeshana");
// });

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();


exports.getQuestions = functions.https.onRequest(async (req, res) => {
    const db = admin.firestore();
    
    try {
        const questionsSnapshot = await db.collection('questions').limit(9).get();
        const questions = [];
        questionsSnapshot.forEach(doc => {
            questions.push({id: doc.id, ...doc.data()});
        });
        res.status(200).send(questions);
    } catch (error) {
        res.status(500).send(error);
    }
});

exports.predictIllness = functions.https.onRequest(async (req, res) => {
    if (req.method !== 'POST') {
        return res.status(400).send('Please send a POST request');
    }

    const userAnswers = req.body.answers; // Assuming answers come in the format: [{id: 'q1', answer: 'A'}, ...]

    const counts = {A: 0, B: 0, C: 0};
    userAnswers.forEach(answer => {
        const illness = answer.illness; 
        counts[illness]++;
    });

    const predictedIllness = Object.keys(counts).reduce((a, b) => counts[a] > counts[b] ? a : b); // This will give the illness with the highest count
    res.status(200).send({illness: predictedIllness});
});
