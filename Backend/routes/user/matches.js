var express = require('express');
var router = express.Router();

import Mongo from '../../utils/Mongo';

/* GET matches */

// router.get('/', function(req, res, next) {
//     const email = req.header("email");

//     Mongo.getMatches(email, (matches) => {
//     	// Console.log(matches);
//         res.json(req.body);
//     });
// });

/*
Before you delete and redo this sam, READ THIS
This method takes a User, checks the matches for the user. 
If it gets true for a match it will check that user to see if 
that User has a true next to him. 
*/

router.post('/', function(req, res, next) {
	const User = req.body;

	// console.log(User.potentialMatches);
	if(User.potentialMatches == 1){
		Mongo.getMatches(User.potentialUserEmail, (potentialUser) => {
			if(potentialUser.includes(User.email) == true){
				const resp = {
	                success: true
	            };
	            res.json(resp);
				//add potential User to User.
				//Create a convo between the two
			}else{
				const resp = {
	                success: false
	            };
	            res.json(resp);
				console.log("no Match");
				//add potential User to User.
			}
		});


	    // console.log(userList);
	    
	}else{
		const matches = {
		    email: User.email,
		    likes: []
		};
		// console.log(matches);
		Mongo.insert("Matches", matches, () => {
			res.json(User);
		});
		
		
	}
	
});

module.exports = router;
