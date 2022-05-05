var express = require("express"),
	cDoctor = require("../controllers/cDoctor");

var router = express.Router();

router.get("/all",cDoctor.getAllDoctors);
router.post("/",cDoctor.addDoctor);

module.exports = router;
