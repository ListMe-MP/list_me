const express = require("express");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

const productList = [];
const feedbackData = [];


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

