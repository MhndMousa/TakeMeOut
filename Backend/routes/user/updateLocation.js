var express = require('express');
var router = express.Router();

import Mongo from '../../utils/Mongo';

/* POST update info */
router.post('/', function(req, res, next) {
    const email = req.body.email;
    console.log(email);
    Mongo.updateLocation(email, req.body.location.coordinates[0], req.body.location.coordinates[1], () => {
        const resp = {
            success: true
        };
        res.json(resp);
    });
});

module.exports = router;
