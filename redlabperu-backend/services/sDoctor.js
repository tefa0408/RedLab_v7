const models = require("../models");

async function getAllDoctors() {
    return await models.Doctors.findAll()
}

async function addDoctor(data) {
  await models.sequelize.transaction(async (transaction) => {
    const doctor = await models.Doctors.create(data, { transaction });

    return doctor;
  });
}

module.exports = {
    getAllDoctors,
    addDoctor
  };