const sDoctor = require("../services/sDoctor"),
  {
    makeResponseOkMessage,
    makeResponseOk,
    makeResponseException,
  } = require("../global/response");

  async function getAllDoctors(req, res) {
    try {
      const doctors = await sDoctor.getAllDoctors();
      makeResponseOk(res, {data: doctors}, "doctors/all");
    } catch(err) {
      makeResponseException(res, err);
    }
  }

async function addDoctor(req, res) {
    try {
      let data = req.fields;
      await sDoctor.addDoctor(data);
      makeResponseOkMessage(res, "I061");
    } catch (err) {
      makeResponseException(res, err);
    }
  }

  module.exports = {
    addDoctor,
    getAllDoctors,
  
  };