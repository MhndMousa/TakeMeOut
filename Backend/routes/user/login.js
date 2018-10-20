var express = require('express');
var router = express.Router();

import Mongo from '../../utils/Mongo';
/* POST login info */
router.post('/', function(req, res, next) {
    const userQuery = {
        email: req.body.email,
    };
    // console.log(userQuery);
    Mongo.find("User", userQuery, undefined, (result) => {
        res.json(result);
    });
});

module.exports = router;
