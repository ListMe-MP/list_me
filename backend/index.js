const express = require("express");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

const productList = [];

app.listen(2000, ()=>{
    console.log("Connected to server at 2000");
})

// post api

app.post("/api/add_product", (req, res)=>{
    console.log("Result", req.body);

    const pdata = {
        "id": productList.length+1,
        "lTitle": req.body.ltitle,
        items: [
            {
                "pname": req.body.pname,
                "pimage": req.body.ppath,
                "pprice": req.body.pprice,
                "pquantity": req.body.pqty,

            }
        ]
    };

    productList.push(pdata);
    console.log("Final", pdata);

    res.status(200).send({
        "status_code": 200,
        "message": "Product added successfully",
        "product": pdata
    })
})