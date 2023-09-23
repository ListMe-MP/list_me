const express = require("express");
const {connectToDb, getDb} = require('./db');

const app = express();


app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

const productList = [];
const feedbackData = [];

// Declare db in the outer scope
let db;

// Middleware to check if the database connection is ready
app.use((req, res, next) => {
    if (!getDb()) {
        return res.status(500).json({ error: 'Database connection is not ready' });
    }
    next();
});

// connect to the server
app.listen(3000, ()=>{
    console.log("Connected to server at 3000");
})

// post api

app.post("/api/add_product", (req, res)=>{
    console.log("Result", req.body);

    const itemArray = req.body.items.map(item => {
        return {
            "pname": item,
            "pimage": "",
            "pprice": "",
            "pquantity": "",
        }
    })

    const pdata = {
        "id": productList.length+1,
        "lTitle": req.body.ltitle,
        "items": itemArray

    };

    productList.push(pdata);
    console.log("Final", pdata);

    res.status(200).send({
        "status_code": 200,
        "message": "Product added successfully",
        "product": pdata
    })
})

//post api for feedback
app.post("/api/add_feedback", (req, res) => {
  console.log("Request Body:", req.body);

    const pdata = {
        "id": feedbackData.length+1,
        // "pfeedback": req.body.pfeedback,
        
        "pfeedback": req.body.pfeedback


       // "pfeedback": req.body.pdata,
       
    };

    feedbackData.push(pdata);
    console.log("Final", pdata);

    res.status(200).send({
        "status_code": 200,
        "message": "Feedback added successfully",
        "feedback": pdata
    });
    

})

// get Api

app.get("/api/get_product",(req,res)=> {


    if (productList.length > 0 ){
        res.status(200).send({
            'status_code':200,
            'products': productList
        });
    } else {
        res.status(200).send({
            'status_code':200,
            'products': []

    })


}})

// check connect to the database
connectToDb((err) => {
    if (err) {
        console.error('Failed to connect to the database:', err);
    } else {
        console.log('Connected to the database successfully.');

        db = getDb();

        
    }
});

// app.get('/items', async (req, res) => {
//     try {
//         const db = getDb();
//         const items = await db.collection('items').find().sort({ item_name: 1 }).toArray();
//         console.log('Fetched items:', items); // Add this line for debugging
//         res.status(200).json(items);
//     } catch (error) {
//         console.error('Error fetching documents:', error);
//         res.status(500).json({ error: 'Could not fetch the documents' });
//     }
// });

app.get('/api/items', async (req, res) => {
    try {
        // const searchTerm = req.query.searchTerm || ''; // Get user input from query parameter
        const db = getDb();
        const items = await db.collection('items')
            .find() 
            .sort({ item_name: 1 })
            .toArray();
        res.status(200).json(items);
    } catch (error) {
        console.error('Error fetching documents:', error);
        res.status(500).json({ error: 'Could not fetch the documents' });
    }
});


// POST route for adding items
app.post('/api/items', (req, res) => {

    const item = req.body;

    db.collection('items')
        .insertOne(item)
        .then(result => {
            res.status(201).json(result);
        })
        .catch(err => {
            res.status(500).json({ err: 'Could not create a new document' });
        });
});



