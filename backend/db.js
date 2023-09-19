const { MongoClient } = require('mongodb');

let dbConnection
let uri = 'mongodb+srv://harshani:listMe1234@shoppinglistcluster.m3cfxvy.mongodb.net/SuggestItems?retryWrites=true&w=majority'

module.exports = {
    connectToDb: (cb) => {
        MongoClient.connect(uri)
            .then((client) => {
                dbConnection = client.db()
                console.log('Connected to MongoDB successfully.');
                return cb()
            })
            .catch(err => {
                console.error('Error connecting to MongoDB:', err);
                return cb(err)
            })
    },
    getDb: () => dbConnection
}