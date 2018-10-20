var express = require('express');
var router = express.Router();

import Mongo from '../../utils/Mongo';

router.post('/', function(req, res, next) {
	var f;
	var ifMatch = 0;
	const User = req.body;
    const userQuery = {
        email: req.body.email,
	};
	const potuserQuery = {
        email: req.body.potentialUserEmail,
	};
	Mongo.find("Match", userQuery, undefined, (result) => {
		Mongo.find("Match", potuserQuery, undefined, (re) => {
		
			result.List.push(User.potentialUserEmail);
			const newentry = {
				email: result.email,
				List : result.List
			};
			Mongo.delete("Match", userQuery, () => {
			});
			Mongo.insert("Match", newentry,  () => {
				if(re.List.includes(User.email)){
					const resp = {
						success: true
					};
					res.json(resp);
				}else{
					const resp = {
						success: false
					};
					res.json(resp);
				}
			});
		});
	});
});

module.exports = router;
