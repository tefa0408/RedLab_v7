module.exports = (sequelize, DataTypes) => {
    const Doctor = sequelize.define('Doctors', {
      id: { 
        type: DataTypes.INTEGER, 
        primaryKey: true,
        autoIncrement: true
      },
      doctorName: {
        type: DataTypes.STRING,
      }
    });
    
    Doctor.associate = (models) => {
      Doctor.hasMany(models.Appointment);
  
    };
    return Doctor;
  };
  