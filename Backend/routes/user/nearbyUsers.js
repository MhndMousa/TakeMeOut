var express = require('express');
var router = express.Router();

import Mongo from '../../utils/Mongo';

/* GET matches */
router.post('/', function(req, res, next) {
            const email = req.body.email;
            
            Mongo.getNearbyUsers(email, (users) => {
                                 console.log(users);
                                 res.json(users);
                                 });
//             const debra = {
//                name: "debra",
//                 email: "debra1@gmail.com",
//                 age: "61",
//                 phone: "None",
//                 sex: "Female",
//                 cookpref: "Loves to cook",
//                 favfood: "ginger cookies",
//                 bio: "I started with nothing, and I still have most of it.",
//             };
//             res.json(debra);
            });

module.exports = router;

