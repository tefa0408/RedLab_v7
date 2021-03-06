var express = require("express"),
  cReferenceValue = require("../controllers/cReferenceValue");

var router = express.Router();

router.get("/", cReferenceValue.getPagedReferenceValue);
router.get("/all", cReferenceValue.getAllReferenceValue);
router.post("/", cReferenceValue.createReferenceValue);
router.get("/:id", cReferenceValue.getReferenceValue);
router.put("/exam/edit/:id/", cReferenceValue.updateExaminationReferenceValue);
router.get("/exam/examinationValues/", cReferenceValue.getExaminationValues);
router.get("/exam/:id/", cReferenceValue.getExamValuebyExamId);
router.put("/:id", cReferenceValue.updateReferenceValue);
router.delete("/:id", cReferenceValue.deleteReferenceValue);

module.exports = router;
