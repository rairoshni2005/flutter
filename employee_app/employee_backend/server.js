const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');

const app = express();
app.use(cors());
app.use(express.json());

// connect mongoDB
mongoose.connect('mongodb://localhost:27017/employee_db')
.then(() => console.log("MongoDB Connected"))
.catch((err) => console.log(err));

const employeeRouter = require('./routes/employee');
app.use('/employees', employeeRouter);

app.listen(4000, () => {
  console.log("Server running on port 4000");
});
