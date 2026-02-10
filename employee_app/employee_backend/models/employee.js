const mongoose = require("mongoose");

const employeeSchema = new mongoose.Schema({
  name: String,
  email: String,
  role: String,
  department: String,   // add this
  salary: String        // add this
});

module.exports = mongoose.model("Employee", employeeSchema);
