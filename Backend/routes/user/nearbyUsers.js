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
});

module.exports = router;
