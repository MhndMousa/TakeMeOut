var express = require('express');
var router = express.Router();
const MongoClient = require('mongodb').MongoClient;

import Mongo from '../../utils/Mongo';

/* POST Register info */
router.post('/', function(req, res, next) {
    // console.log(req.body);
    const newUser = req.body;
    
    var matchh = {
        "email" : newUser.email,
        "List" : []
    };
    Mongo.insert("User", newUser, () => {
        Mongo.insert("Match", matchh, () => {
            var response = {
                "success" : "true"
            };
            res.json(response);
        })
    })
});

module.exports = router;